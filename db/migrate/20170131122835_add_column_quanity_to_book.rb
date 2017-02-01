class AddColumnQuanityToBook < ActiveRecord::Migration
  def change
    add_column :books, :quantity, :integer, :default => 0
  end
end
