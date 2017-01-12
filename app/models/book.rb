class Book < ActiveRecord::Base

  def self.data_series(date)
    date_range = date.to_date..Date.today
    books_per_day = Book.where(:date => date_range).group("date(date)").select("date, sum(price) as price")
    date_range.map do |date|
      book = books_per_day.detect{ |book| book.date.to_date == date}
      book && book.price.to_f || 0.0
    end
  end
end
