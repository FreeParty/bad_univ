class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :password_confirm
      t.boolean :flag

      t.timestamps null: false
    end
  end
end
