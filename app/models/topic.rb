class Topic < ActiveRecord::Base
  belongs_to :creator, class_name: "User", :foreign_key => "created_by_id"
  has_many :votes
  has_many :voting_users, class_name: "User", :through => :votes

  validates_presence_of :title, :creator_id
  validates_uniqueness_of :title




end
