class AddResultToUsers < ActiveRecord::Migration
  def change
    add_column :users, :result, :integer
  end
end
