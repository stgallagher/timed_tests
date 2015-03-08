class SchoolsController < ApplicationController
  def index
    render :json => School.all
  end

  def show
    render :json => School.find(params[:id])
  end

  def create
    school = params["school"]
    new_school = School.create(:name => school["name"])
    render :json => {:school => new_school}
  end

  def update
    school = params["school"]
    edited_school = School.find(params[:id])
    edited_school.update(:name => school["name"])
    edited_school = School.find(params[:id])
    render :json => {:school => edited_school}
  end

  def destroy
    deleted_school = School.find(params[:id]).destroy
    render :json => {:school => deleted_school}
  end
end
