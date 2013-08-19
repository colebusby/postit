class Comment < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, dependent: :destroy

  validates :description, presence: true
end