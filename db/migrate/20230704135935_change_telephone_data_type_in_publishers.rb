class ChangeTelephoneDataTypeInPublishers < ActiveRecord::Migration[7.0]
  def change
    change_column :publishers, :telephone, :string
  end
end
