class CreateAuthorPublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :author_publishers do |t|
      t.integer :author_id
      t.integer :publisher_id


      t.timestamps
    end
  end
end