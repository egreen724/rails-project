class Activity < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :activity_keywords
  has_many :keywords, through: :activity_keywords
  accepts_nested_attributes_for :keywords

  validates :distance, presence: true, :numericality => { :greater_than_or_equal_to => 0}
  validates :state, presence: true


  def self.state_filter(state_input)
    where(state: state_input)
  end

  def self.keyword_filter(keyword_input)
    includes(keywords: :names).where(names: keyword_input)
  end

  def self.category_filter(category_input)
    where(category: category_input)
  end

  def self.greater_than_ten
    where("distance >= 10")
  end

  def self.five_to_ten
    where("distance >= 5 AND distance < 10")
  end

  def self.two_to_five
    where("distance >= 2 AND distance < 5")
  end

  def self.less_than_two
    where("distance < 2")
  end

  def keywords_attributes=(keyword_attributes)
    keyword_attributes.values.each do |keyword_attribute|
      keyword = Keyword.find_or_create_by(keyword_attribute)
      self.keywords << keyword
    end
  end

  def comments
    if self.trips != []
      self.trips.each do |trip|
       if trip.comment != nil
         self.comments << trip.comment
       end
     end
    end
  end

end
