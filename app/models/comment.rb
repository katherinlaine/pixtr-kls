class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  def self.by_most_recent
    order(created_at: :desc)
  end
end
