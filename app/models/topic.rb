class Topic < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_topic, :against => [:title, :description]

  belongs_to :creator, class_name: "User", :foreign_key => "creator_id"
  has_many :votes
  has_many :voting_users, :through => :votes, source: :user
  has_and_belongs_to_many :tags

  validates_presence_of :title, :creator_id
  validates_uniqueness_of :title

end
