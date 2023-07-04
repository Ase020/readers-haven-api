class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :gender
      t.string :email
      t.string :nationality
      t.string :bio

      t.timestamps
    end
  end
end
