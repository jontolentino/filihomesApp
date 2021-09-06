class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :name_status_maker
      t.string :content

      t.timestamps
    end
  end
end
