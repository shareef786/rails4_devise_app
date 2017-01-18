class BooksController < ApplicationController
  before_filter :find_book, :only => [:update, :destroy]

  def index
    @books = Book.all.sort_by(&:created_at)
    @booksjson = @books.map{|b| {"day" => "#{b.date}", "count" => b.price}}
    # @booksjson = [
    #   {"day" => "2016-02-16","count" => 380},
    #   {'day' => '2016-02-17','count' => @books.last.price},
    #   {'day' => '2016-02-18','count' => @books.first.price},
    #   {'day' => '2016-02-19','count' => 100},
    #   {'day' => '2016-02-20','count' => 150}
    # ]
# binding.pry
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @booksjson }
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
    params.require(:book).permit(:title, :date, :price)
  end
end
