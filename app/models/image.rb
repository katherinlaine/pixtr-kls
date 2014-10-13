class Image < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user

  validates :name, presence: true
end
