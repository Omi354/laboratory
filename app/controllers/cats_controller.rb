class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to @cat, notice: "Cat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :age)
  end
end
