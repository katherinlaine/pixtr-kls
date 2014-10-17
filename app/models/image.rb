class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :gallery
  has_and_belongs_to_many :groups
  has_many :likes
  belongs_to :user

  acts_as_taggable

  validates :name, presence: true
end
