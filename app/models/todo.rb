class Todo < ActiveRecord::Base

  include RankedModel
  ranks :order

  scope :undone, -> { where( done: false ) }
  scope :done, -> { where( done: true ) }
end
