class BooksController < ApplicationController
  before_filter :find_book, :only => [:update, :destroy]

  def index
    @books = Book.all.sort_by(&:created_at)
    if params[:type] == 'line'
      @booksArray = @books.map{|b| {"day" => b.date, "count" => b.quantity} if b.quantity > 0}.compact
    elsif params[:type] == 'pie'
      @booksArray = @books.map{|b| {"label" => b.title, "value" => b.quantity} if b.quantity > 0}.compact
    else
      @booksArray = []
      @booksjson = @books.map{|b| {"x" => b.title, "y" => b.quantity} if b.quantity > 0}.compact
      hash = {"values" => @booksjson}
      @booksArray.push(hash)
    end

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @booksArray }
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    head :no_content
  end

  def search
    @books = Book.where("title LIKE ?", '%' + params[:title] + '%')
    render json: @books
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :date, :price, :quantity)
  end
end
