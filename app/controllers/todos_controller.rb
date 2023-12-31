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
    @categories = Category.all
    render :new
  end

  def create
    puts "Here I am!!!!****!!!!"
    pp params
    todo = Todo.create(
      user_id: current_user.id,
      title: params[:todo][:title],
      deadline: params[:todo][:deadline],
      description: params[:todo][:description],
      completed: params[:todo][:completed],
    )

    if todo.valid?
      CategoryTodo.create(category_id: params[:category_id], todo_id: todo.id)
      redirect_to "/todos"
    end
  end

  def edit
    @todo = Todo.find_by(id: params[:id])
    render :edit
  end

  def update
    pp "HELLO"
    pp !!params[:todo][:completed]
    @todo = Todo.find_by(id: params[:id])
    @todo.update(
      title: params[:todo][:title],
      deadline: params[:todo][:deadline],
      description: params[:todo][:description],
      completed: !!params[:todo][:completed],
    )

    redirect_to "/todos"
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to "/todos", status: :see_other
  end
end
