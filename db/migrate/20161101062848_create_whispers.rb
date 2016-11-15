class CreateWhispers < ActiveRecord::Migration
  def change
    create_table :whispers do |t|
      t.string :title
      t.text :content


      t.timestamps null: false
    end
  end
end
