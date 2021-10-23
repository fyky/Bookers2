class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user.id
    
    
        @image = User.find(@user)

  end

  def show
    @book = Book.find(params[:id])

        @userid = current_user.id
        @user = User.find(@userid)
        @image = User.find(@userid)

  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end


  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
