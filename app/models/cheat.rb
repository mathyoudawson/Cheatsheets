class Cheat < ApplicationRecord
  belongs_to :cheatsheet
  
  def self.search(term, type)
    if term
      where("#{type} LIKE ?", "%#{term}%")
    else
      all
    end
  end
end
