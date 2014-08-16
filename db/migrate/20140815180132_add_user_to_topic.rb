class AddCreatorToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :creator_id, :integer
  end
end
