class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :remember_token

      t.timestamps
    end
    add_index :users, :remember_token
  end

end
