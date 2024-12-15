class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

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
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @books = Book.all
      flash.now[:alert]
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to @book
    else
      flash.now[:alert]
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @book, notice:
  end

  private

  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path, alert: "You are not authorized to perform this action."
    end
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
