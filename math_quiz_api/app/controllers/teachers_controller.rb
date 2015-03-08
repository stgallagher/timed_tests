class TeachersController < ApplicationController
  def index
    render :json =>Teacher.all
  end

  def show
    render :json => Teacher.find(params[:id])
  end

  def create
    teacher = params["teacher"]
    new_teacher = Teacher.create(:first_name => teacher["first_name"], :last_name => teacher["last_name"], :gender => teacher["gender"], :grade => teacher["grade"])
    render :json => {:teacher => new_teacher}
  end

  def update
    teacher = params["teacher"]
    edited_teacher = Teacher.find(params[:id])
    edited_teacher.update(:first_name => teacher["first_name"], :last_name => teacher["last_name"], :gender => teacher["gender"], :grade => teacher["grade"])
    edited_teacher = Teacher.find(params[:id])
    render :json => {:teacher => edited_teacher}
  end

  def destroy
    deleted_teacher = Teacher.find(params[:id]).destroy
    render :json => {:teacher => deleted_teacher}
  end
end
