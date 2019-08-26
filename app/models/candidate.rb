class Candidate < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than: 29 }
end
