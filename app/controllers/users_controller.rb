class UsersController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
end
