class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :userEmail
      t.integer :password_digest

      t.timestamps
    end
  end
end
