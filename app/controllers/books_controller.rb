class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    
    
        #@image = User.find(@user)

  end

  def show
    @book = Book.find(params[:id])
    #@user = @book.user
        #userid = current_user.id

        #@image = User.find(@userid)
        
         #   @newbook = Book.new
    @user = @book.user
    #@image = User.find(@user)


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
    if @book.update(book_params)
    redirect_to book_path, notice: 'Book was successfully created.'
    else
    redirect_to book_path
    end
    

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
