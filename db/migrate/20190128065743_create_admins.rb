class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|

      t.belongs_to :user
      
      t.integer :created_by

      t.timestamps
    end
  end
end
