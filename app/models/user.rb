class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :restaurants, foreign_key: :owner_id
  has_many :reviews, foreign_key: :reviewer_id

  def full_name
    name_array = self.username.split(".")
    full_name = ""

    name_array.each do |name|
      full_name += "#{name.capitalize} "
    end
    full_name.strip!
  end

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
