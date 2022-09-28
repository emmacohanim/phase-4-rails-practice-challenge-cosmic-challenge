class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates_presence_of :name, :scientist_id, :planet_id
  validates :scientist_id, uniqueness: { scope: :name }
    # validates that scientist has not already been on mission to certain planet
end
