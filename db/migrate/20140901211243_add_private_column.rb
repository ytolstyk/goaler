class AddPrivateColumn < ActiveRecord::Migration
  def change
    add_column :goals, :private, :boolean
  end
end
