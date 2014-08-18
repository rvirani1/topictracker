class User < ActiveRecord::Base
  has_many :created_topics, class_name: "Topic", dependent: :destroy, foreign_key: :creator_id
  has_many :votes
  has_many :voted_topics, class_name: "Topic", :through => :votes, :source => :topic
  # TODO add paperclip to avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def voted?(topic)
    @_voted_topics ||= self.voted_topics.pluck :id
    @_voted_topics.include?(topic.id)
  end
end
