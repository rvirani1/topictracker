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
    #TODO remove stink
    self.tags.each do |tag|
      binding.pry
      unless tag_selectors.include?(tag.name)
        self.tags.delete(Tag.find_by_name(tag.name))
      end
      binding.pry
    end

    tag_selectors.each do |tag_name|
      if self.has_tag?(tag_name)
        next
      elsif Tag.find_by_name(tag_name)
        self.tags << Tag.find_by_name(tag_name)
      else
        self.tags << Tag.new(name: tag_name)
      end
    end
  end

  def has_tag?(tag_name)
    self.tags.include? Tag.find_by_name(tag_name)
  end

  # @existing_tags = params[:tag_selector].select { |x| x =~ /^\d+$/ }
end
