class BooksController < ApplicationController
  def new
    @book = Book.new 
  end

  def index
    @user = current_user
    @books = Book.all || []
  end

  def show
    @book = Book.find(params[:id])
  @user = @book.user
  end

  def create
    @Book = Book.new(book_params)
    @Book.user_id = current_user.id
    if @Book.save
      redirect_to books_path(@Book)
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
