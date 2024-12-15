class UsersController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books
    @user = @book.user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
