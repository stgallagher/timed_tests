class ProblemsController < ApplicationController
  def index
    render :json => Problem.all
  end

  def show
    render :json => Problem.find(params[:id])
  end

  def create
    problem = params["problem"]
    new_problem = Problem.create(:top_factor => problem["top_factor"], :bottom_factor => problem["bottom_factor"], :operator => problem["operator"], :answer => problem["answer"])
    render :json => {:problem => new_problem}
  end

  def update
    problem = params["problem"]
    edited_problem = Problem.find(params[:id])
    edited_problem.update(:top_factor => problem["top_factor"], :bottom_factor => problem["bottom_factor"], :operator => problem["operator"], :answer => problem["answer"])
    edited_problem = Problem.find(params[:id])
    render :json => {:problem => edited_problem}
  end

  def destroy
    deleted_problem = Problem.find(params[:id]).destroy
    render :json => {:problem => deleted_problem}
  end
end
