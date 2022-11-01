class AuthorsController < ApplicationController
  
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(author_id_params)
  end

  def destroy
    @author = Author.find(author_id_params)
    @author.destroy
   
    redirect_to authors_path
  end

  def show
    @author = Author.find(author_id_params)
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path, notice: 'Success!'
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(author_id_params)

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end

  private
  def author_id_params
    params.require(:id)
  end
end
