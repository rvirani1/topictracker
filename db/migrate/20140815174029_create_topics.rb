class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
