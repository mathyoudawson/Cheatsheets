class Cheatsheet < ApplicationRecord
  has_many :cheats, dependent: :destroy
  belongs_to :user, required: false

  validates :title, presence: true
  validates :description, presence: true

  def sort_cheats_by_category
    self.cheats.all.group_by(&:category)
  end

  def self.clone_from(parent_id)
    parent = Cheatsheet.find(parent_id)
    cloned_cheatsheet = parent.dup
    cloned_cheatsheet.user = nil
    cloned_cheatsheet
  end

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
