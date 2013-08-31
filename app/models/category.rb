class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :posts, through: :categorizations

  validates :name, presence: true

  after_validation :generate_slug

  def generate_slug
    self.slug = self.name.scan(/\w+/).join("-").downcase
    words = self.slug.scan(/\w+/)
    slug_arr = []
    Category.all.each { |post| slug_arr << post.slug}
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