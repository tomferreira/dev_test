class Todo < ActiveRecord::Base

  default_scope { order('due_date ASC') }

  scope :undone, -> { where( done: false ) }
  scope :done, -> { where( done: true ) }
end
