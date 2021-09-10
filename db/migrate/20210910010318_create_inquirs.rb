class CreateInquirs < ActiveRecord::Migration[6.1]
  def change
    create_table :inquirs do |t|
      t.string :name
      t.string :email
      t.string :number
      t.string :message
      t.string :status

      t.timestamps
    end
  end
end
