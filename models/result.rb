class Result < ApplicationRecord


  validates :name,:standard,presence: true

validates :score,:macid, presence: true

end
