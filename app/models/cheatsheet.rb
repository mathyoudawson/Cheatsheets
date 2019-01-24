class Cheatsheet < ApplicationRecord
  has_many :cheats, dependent: :destroy
  belongs_to :user, required: false

  validates :title, presence: true
  validates :description, presence: true

  def self.sort_cheats_by_category(cheats)
    cheats.group_by(&:category)
  end

  def self.clone_from(parent_id)
    parent = Cheatsheet.find(parent_id)
    cloned_cheatsheet = parent.dup
    cloned_cheatsheet.cheats = parent.cheats.map(&:dup)
    cloned_cheatsheet.user = nil
    cloned_cheatsheet
  end

  def search_cheats(term)
    search_results = self.cheats.search(term, 'term')
    search_results += self.cheats.search(term, 'description')
    search_results
  end

  def self.search(term, type)
    if term
      where("#{type} LIKE ?", "%#{term}%")
    else
      all
    end
  end
end
