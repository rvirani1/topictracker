class User < ActiveRecord::Base
  has_many :created_topics, class_name: "Topic", dependent: :destroy #, foreign_key: :creator_id
  has_many :votes
  has_many :voted_topics, class_name: "Topic", :through => :votes


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
