class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :user_id

      t.timestamps
    end
  end
end
