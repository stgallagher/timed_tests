class ApiController < ApplicationController
  before_action :set_resource

  def index
    render :json => { @resource_symbol => @resource_model.all }
  end

  def show
    render :json => { @resource_symbol => @resource_model.find(params[:id]) }
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

  def set_resource
    @resource_model = self.controller_name.singularize.capitalize.constantize
    @resource_symbol = self.controller_name.to_sym
    @resource_string = self.controller_name
  end

end
