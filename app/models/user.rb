class User < ApplicationRecord
  has_many :sessions, dependent: :destroy

  validates :slack_id, presence: true, uniqueness: true
  validates :email, presence: true
end
