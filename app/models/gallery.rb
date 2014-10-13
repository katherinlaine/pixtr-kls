class Gallery < ActiveRecord::Base
  has_many :images

  validates :name, presence: true, uniqueness: true
end
