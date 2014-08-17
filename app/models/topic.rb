class Topic < ActiveRecord::Base
  belongs_to :creator, class_name: "User", :foreign_key => "creator_id"
  has_many :votes
  has_many :voting_users, :through => :votes, source: :user

  validates_presence_of :title, :creator_id
  validates_uniqueness_of :title




end
