class ChangeDataTypesInReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :book_id, 'integer USING CAST(book_id AS integer)'
    change_column :reviews, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
