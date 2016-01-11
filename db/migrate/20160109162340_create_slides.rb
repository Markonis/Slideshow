class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.integer :page_number
      t.string :image_url
      t.belongs_to :presentation

      t.timestamps null: false
    end
  end
end
