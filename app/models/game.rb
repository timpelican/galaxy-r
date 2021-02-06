class Game < ApplicationRecord
  has_many :races
  enum status: { waiting: 0, active: 1, processing: 2, finished: 3}
end
