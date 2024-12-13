class BooksController < ApplicationController
  def new
    @book = Book.new 
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice:
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice:
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @book, notice:
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
