class User < ApplicationRecord

  validates_presence_of :name, :email, :password
  validates :email, confirmation: { case_sensitive: true }

  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
