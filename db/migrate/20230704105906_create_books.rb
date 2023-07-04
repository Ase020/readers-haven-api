class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.integer :publish_date
      t.integer :price
      t.integer :author_id
      t.integer :user_id
      t.integer :publisher_id

      t.timestamps
    end
  end
end
