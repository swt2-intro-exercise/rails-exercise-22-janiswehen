class AuthorController < ApplicationController
  
  def index
    @authors = Author.all
  end

  def new
  end

  def show
    @author = Author.find(author_id_params)
  end

  def create
    @author = Author.new(new_author_params)

    @author.save
    redirect_to root_path, notice: 'Success!'
  end

  private
  def new_author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end

  private
  def author_id_params
    params.require(:id)
  end
end
