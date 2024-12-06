class BooksController < ApplicationController
  def new
    @book = Book.new 
  end

  def index
  end

  def show
  end

   # 投稿データの保存
   def create
    @Book = Book.new(book_params)
    @Book.user_id = current_user.id
    @Book.save
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image) # 必要なパラメータを許可
  end
end
