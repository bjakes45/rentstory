class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
  	  
      t.belongs_to :topic
      t.belongs_to :user, optional: true

  	  t.string :title
  	  t.text :body
      
      t.integer :address, optional: true
      t.string :street, optional: true
      t.string :city, optional: true

      t.string :landlord, optional: true

      t.boolean :publish, default:true

      t.timestamps
    end
  end
end
