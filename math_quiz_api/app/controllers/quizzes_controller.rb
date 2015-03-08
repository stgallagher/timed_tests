class QuizzesController < ApplicationController
  def index
    render :json => Quiz.all
  end

  def show
    render :json => Quiz.find(params[:id])
  end

  def create
    quiz = params["quiz"]
    new_quiz = Quiz.create(:level => quiz["level"], :operator => quiz["operator"], :max_time => quiz["max_time"])
    render :json => {:quiz => new_quiz}
  end

  def update
    quiz = params["quiz"]
    edited_quiz = Quiz.find(params[:id])
    edited_quiz.update(:first_name => quiz["first_name"], :last_name => quiz["last_name"], :gender => quiz["gender"], :grade => quiz["grade"])
    edited_quiz = Quiz.find(params[:id])
    render :json => {:quiz => edited_quiz}
  end

  def destroy
    deleted_quiz = Quiz.find(params[:id]).destroy
    render :json => {:quiz => deleted_quiz}
  end
end
