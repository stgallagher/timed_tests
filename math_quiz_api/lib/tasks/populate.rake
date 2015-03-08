namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'forgery'
    require 'gender_detector'

    gd = GenderDetector.new

    Rake::Task['db:reset'].invoke

    classrooms = []
    teachers = []
    students = []
    quizzes = []
    problems = []

    # create single school
    school = School.create(:name => "Lakewood Elementary")

    # create teachers
    5.times do
      first_name = Forgery('name').first_name
      last_name = Forgery('name').last_name
      gender = gd.get_gender(first_name)
      teachers << Teacher.create( :first_name => first_name, :last_name => last_name, :gender => gender, :grade => 'third')
    end

    # create classrooms
    5.times do
     classrooms << Classroom.create(:name => "Room_#{Forgery('basic').number}#{Forgery('lorem_ipsum').character.capitalize}")
    end

    # associated teachers, classrooms and school
    classrooms.each_with_index do |classroom, i|
      classrooms[i].teacher = teachers[i]
      classrooms[i].school = school
      classroom.save
    end

    # create students, associate them with classrooms
    classrooms.each do |classroom|
      classroom_students = []
      30.times do
        first_name = Forgery('name').first_name
        last_name = Forgery('name').last_name
        gender = gd.get_gender(first_name)
        student = Student.create( :first_name => first_name, :last_name => last_name, :gender => gender, :grade => 'third')
        # create array of student models
        classroom_students << student
        # associate students with classrooms
        classroom.students << student
      end
      # store student objects for later
      students << classroom_students
      # clear out classroom students
      classroom_students = []
    end

    # create quizzes
    100.times do
      max_time = [120, 180].sample
      operator = ['+', '-', '*', '/'].sample
      quizzes << Quiz.create( :level => "4s", :operator => operator, :max_time => max_time)
    end

    # create problems
    1000.times do
      problem_found = false
      until problem_found
        top_factor = Random.rand(26)
        bottom_factor = Random.rand(26)
        operator = ['+', '-', '*', '/'].sample
        # can't divide by zero
        bottom_factor = 1 if operator == '/' and bottom_factor == 0
        answer = top_factor.send(operator, bottom_factor)
        if answer > 0 and evenly_divisible_if_divide(operator, top_factor, bottom_factor)
          problems << Problem.create(:top_factor => top_factor,
                                     :bottom_factor => bottom_factor,
                                     :operator => operator,
                                     :answer => answer)
          problem_found = true
        end
      end
    end

    #  associating quizzes and problems
    quizzes.each do |quiz|
      quiz_problem_ids = []
      30.times do
        problem_found = false
        until problem_found
          problem = problems.sample
          unless quiz_problem_ids.include?(problem[:id])
            if problem[:operator] == '/'  and problem[:top_factor] % problem[:bottom_factor] == 0 and problem[:answer] > 0 and problem[:operator] == quiz[:operator]
              quiz.problems << problem
              quiz_problem_ids << problem[:id]
              problem_found = true
            elsif problem[:operator] != '/' and problem[:operator] == quiz[:operator]
              quiz.problems << problem
              quiz_problem_ids << problem[:id]
              problem_found = true
            end
          end
        end
      end
      quiz.save
      quiz_problem_ids = []
    end

    # creating quiz sessions
    5.times do |i|
      quiz = quizzes.sample
      students.flatten.each do |student|
        quiz_date = Time.now - (i * 2).weeks
        time_taken = 60 + Random.rand(60)
        correct = 3 + Random.rand(28)
        unanswered = Random.rand(5)
        wrong = 30 - correct - unanswered
        score = correct
        qs = QuizSession.create(:date => quiz_date,
                                :time_taken => time_taken,
                                :correct => correct,
                                :unanswered => unanswered,
                                :wrong => wrong,
                                :score => score)
        qs.quiz = quiz
        qs.student = student
        quiz.save
        qs.save
      end
    end
  end

  def evenly_divisible_if_divide(op, top, bottom)
    return true if op != '/'
    if top % bottom == 0
      return true
    else
      return false
    end
  end

end
