class Game < ApplicationRecord
  validates_presence_of :name, :status
  has_many :races, dependent: :destroy
  enum status: { waiting: 0, active: 1, processing: 2, finished: 3}
  after_initialize do |game|
    game.status ||= :waiting if self.new_record?
  end
end
