class Cheatsheet < ApplicationRecord
  has_many :cheats, dependent: :destroy
  belongs_to :user, required: false

  validates :title, presence: true
  validates :description, presence: true
end
