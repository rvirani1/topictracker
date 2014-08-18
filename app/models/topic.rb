class Topic < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_topic, :against => [:title, :description]

  belongs_to :creator, class_name: "User", :foreign_key => "creator_id"
  has_many :votes
  has_many :voting_users, :through => :votes, source: :user
  has_and_belongs_to_many :tags

  validates_presence_of :title, :creator_id
  validates_uniqueness_of :title



  def add_tags_to_topic(tag_selectors)
    tag_selectors.each do |tag_name|
      if Tag.find_by_name(tag_name)
        self.tags << Tag.find_by_name(tag_name)
      else
        self.tags << Tag.new(name: tag_name)
      end
    end
  end

  # @existing_tags = params[:tag_selector].select { |x| x =~ /^\d+$/ }
end
