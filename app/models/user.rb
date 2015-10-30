# App User
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :articles

  validates :username,
            presence: true,
            length: { in: 4..25 },
            uniqueness: { case_sensitive: false }

  # This Regex is pragmatic, not exhaustive, and importantly, case-INsensitive.
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email,
            presence: true,
            length: { maximum: 255 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL }
end
