class User < ActiveRecord::Base
  has_many :distances

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password_new)
    @password = BCrypt::Password.create(password_new)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end
