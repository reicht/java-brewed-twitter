class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :bloops_count

      t.timestamps null: false
    end
  end
end
