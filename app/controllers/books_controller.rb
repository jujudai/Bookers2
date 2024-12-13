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
