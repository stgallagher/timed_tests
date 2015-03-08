class QuizSessionsController < ApplicationController
  def index
    render :json => QuizSession.all
  end

  def show
    render :json => QuizSession.find(params[:id])
  end

  def create
    quiz_session = params["quiz_session"]
    new_quiz_session = QuizSession.create(:date => quiz_session["date"], :time_taken => quiz_session["time_taken"], :correct => quiz_session["correct"], :unanswered => quiz_session["unanswered"], :wrong => quiz_session["wrong"], :score => quiz_session["score"])
    render :json => {:quiz_session => new_quiz_session}
  end

  def update
    quiz_session = params["quiz_session"]
    edited_quiz_session = QuizSession.find(params[:id])
    edited_quiz_session.update(:date => quiz_session["date"], :time_taken => quiz_session["time_taken"], :correct => quiz_session["correct"], :unanswered => quiz_session["unanswered"], :wrong => quiz_session["wrong"], :score => quiz_session["score"])
    edited_quiz_session = QuizSession.find(params[:id])
    render :json => {:quiz_session => edited_quiz_session}
  end

  def destroy
    deleted_quiz_session = QuizSession.find(params[:id]).destroy
    render :json => {:quiz_session => deleted_quiz_session}
  end
end
