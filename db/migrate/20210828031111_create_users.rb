class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.datetime :birthday_date
      t.string :prc_id

      t.timestamps
    end
  end
end
