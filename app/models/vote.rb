class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates_uniqueness_of :topic, scope: :user

end