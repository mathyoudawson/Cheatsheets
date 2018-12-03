class Cheatsheet < ApplicationRecord
  has_many :cheats

  validates :title, presence: true
  validates :description, presence: true
end
