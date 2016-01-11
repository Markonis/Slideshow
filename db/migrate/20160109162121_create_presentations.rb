class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :author

      t.timestamps null: false
    end
  end
end
