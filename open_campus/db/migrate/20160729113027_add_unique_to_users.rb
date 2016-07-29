class AddUniqueToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uniq, :integer
  end
end
