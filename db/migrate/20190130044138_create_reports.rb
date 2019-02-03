class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
	  
	    t.belongs_to :user
	    t.belongs_to :post

  	  t.string :topic
  	  t.text :body

      t.boolean :resolve, default: false

      t.timestamps
    end
  end
end
