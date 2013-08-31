class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  after_validation :generate_slug

  def admin?
    self.role == "admin"
  end

  def generate_slug
    self.slug = self.username.scan(/\w+/).join("-").downcase
    words = self.slug.scan(/\w+/)
    slug_arr = []
    User.all.each { |user| slug_arr << user.slug }
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