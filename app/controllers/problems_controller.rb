class ProblemsController < ApplicationController
  before_filter :require_user, :except => [ :index, :show ]
  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def create
    @problem = Problem.new(params[:problem])
    if @problem.save
      redirect_to new_problem_path, notice: 'Problem was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @problem = Problem.find(params[:id])

    if @problem.update_attributes(params[:problem])
      redirect_to problems_path, notice: 'Problem was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to problems_url, notice: 'Problem was successfully deleted.'
  end
end
