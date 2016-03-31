class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :comments
  has_many :users, :through => :comments
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :categories

  has_attached_file :image, styles: { medium: "182x268>", small: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
