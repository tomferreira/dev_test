class Todo < ActiveRecord::Base

  scope :undone, -> { where( done: false ) }
  scope :done, -> { where( done: true ) }
end
