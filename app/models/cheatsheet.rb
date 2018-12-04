class Cheatsheet < ApplicationRecord
  has_many :cheats, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
