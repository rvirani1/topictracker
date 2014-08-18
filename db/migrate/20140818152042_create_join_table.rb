class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :topics, :tags do |t|
      t.index :topic_id
      t.index :tag_id
    end
  end
end
