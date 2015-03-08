class StudentsController < ApplicationController
  def index
    p "params = #{params.inspect}"
    if params[:classroom_id]
      classroom = Classroom.find(params[:classroom_id])
      @students = Classroom.find(params[:classroom_id]).students
      render :json => { :classroom => classroom, :students => @students }
    elsif params[:teacher_id]
      teacher = Teacher.find(params[:teacher_id])
      classroom = Teacher.find(params[:teacher_id]).classroom
      @students = Classroom.find(classroom).students
      render :json => { :teacher => teacher, :students => @students }
    else
      @students = Student.all
      render :json => @students
    end
  end

  def show
    render :json => Student.find(params[:id])
  end

  def create
    student = params["student"]
    new_student = Student.create(:first_name => student["first_name"], :last_name => student["last_name"], :gender => student["gender"], :grade => student["grade"])
    render :json => {:student => new_student}
  end

  def update
    student = params["student"]
    edited_student = Student.find(params[:id])
    edited_student.update(:first_name => student["first_name"], :last_name => student["last_name"], :gender => student["gender"], :grade => student["grade"])
    edited_student = Student.find(params[:id])
    render :json => {:student => edited_student}
  end

  def destroy
    deleted_student = Student.find(params[:id]).destroy
    render :json => {:student => deleted_student}
  end

end
