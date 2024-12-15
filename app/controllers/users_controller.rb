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
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user) 
    else
      flash.now[:alert]
      render :edit
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

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert]
      redirect_to root_path
    end
  end
end