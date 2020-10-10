class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.string :username
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.integer :type_id
      t.string :category

      t.timestamps
    end
  end
end
