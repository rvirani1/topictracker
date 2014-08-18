class Tag < ActiveRecord::Base
  validates_uniqueness_of :name
  has_and_belongs_to_many :topics


  def self.select_list()
    # return something link [["Tag with id 1", 1], ["Tag with id 2", 2]]
    # or something like {:key : value }
    hash = Hash.new
    Tag.all.each do |tag|
      hash[tag.name] = tag.id.to_s
    end
    hash

    # Tag.all.each_with_object({}) { |tag, hash| hash[tag.name] = tag.id.to_s }
  end
end

