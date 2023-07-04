class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :star_rating
      t.text :description
      t.string :book_id
      t.string :user_id

      t.timestamps
    end
  end
end
