class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render :index
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    render :show
  end

  def new
    @todo = Todo.new
    render :new
  end

  def create
    todo = Todo.create(
      user_id: params[:todo][:user_id],
      title: params[:todo][:title],
      deadline: params[:todo][:deadline],
      description: params[:todo][:description],
      completed: params[:todo][:completed],
    )

    redirect_to "/todos"
  end

  def edit
    @todo = Todo.find_by(id: params[:id])
    render :edit
  end

  def update
    @todo = Todo.update(
      user_id: params[:todo][:user_id],
      title: params[:todo][:title],
      deadline: params[:todo][:deadline],
      description: params[:todo][:description],
      completed: params[:todo][:completed],
    )

    redirect_to "/todos"
  end
end
