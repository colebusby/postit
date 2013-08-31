class Post < ActiveRecord::Base
  include Voteable

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true
  validates :url, presence: true
  validates :description, presence: true

  after_validation :generate_slug

  def generate_slug
    self.slug = self.title.scan(/\w+/).join("-").downcase
    words = self.slug.scan(/\w+/)
    slug_arr = []
    Post.all.each { |post| slug_arr << post.slug}
    i = 1
    while slug_arr.include?(self.slug)
      self.slug = words.join("-") + "-#{i}"
      i += 1
    end
    self.slug
  end

  def to_param
    self.slug
  end
end