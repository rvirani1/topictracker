class User < ActiveRecord::Base
  #Active Record Associations
  has_many :created_topics, class_name: "Topic", dependent: :destroy, foreign_key: :creator_id
  has_many :votes
  has_many :voted_topics, class_name: "Topic", :through => :votes, :source => :topic
  has_many :comments
  has_many :commented_topics, class_name: "Topic", :through => :comments, :source => :topic

  # Using Paperclip for creating Avatar
  has_attached_file :avatar, :styles => {
      :medium => "300x300",
      :thumb => "100x100",
      :icon => "20x20" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def voted?(topic)
    @_voted_topics ||= self.voted_topics.pluck :id
    @_voted_topics.include?(topic.id)
  end
end
