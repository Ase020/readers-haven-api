class CreateJoinTableAuthorPublisher < ActiveRecord::Migration[7.0]
  def change
    create_join_table :authors, :publishers do |t|
      # t.index [:author_id, :publisher_id]
      # t.index [:publisher_id, :author_id]
    end
  end
end
