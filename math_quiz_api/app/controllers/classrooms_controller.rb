class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
    render :json => @classrooms
  end

  def show
    @classroom = Classroom.find(params[:id])
    render json: @classroom
  end

  def create
    classroom = params["classroom"]
    new_classroom = Classroom.create(:name => classroom["name"])
    render :json => {:classroom => new_classroom}
  end

  def update
    classroom = params["classroom"]
    edited_classroom = Classroom.find(params[:id])
    edited_classroom.update(:first_name => classroom["first_name"], :last_name => classroom["last_name"], :gender => classroom["gender"], :grade => classroom["grade"])
    edited_classroom = Classroom.find(params[:id])
    render :json => {:classroom => edited_classroom}
  end

  def destroy
    deleted_classroom = Classroom.find(params[:id]).destroy
    render :json => {:classroom => deleted_classroom}
  end
end
