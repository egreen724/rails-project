class Activity < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :activity_keywords
  has_many :keywords, through: :activity_keywords
  accepts_nested_attributes_for :keywords

  def keywords_attributes=(keyword_attributes)
    keyword_attributes.values.each do |keyword_attribute|
      keyword = Keyword.find_or_create_by(keyword_attribute)
      self.keywords << keyword
    end
  end

end
