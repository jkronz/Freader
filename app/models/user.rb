class User < ActiveRecord::Base
  before_save :create_remember_token
  attr_accessible :email, :remember_token

  has_many :feeds

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
