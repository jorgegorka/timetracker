class Job < ActiveRecord::Base
  belongs_to :company
  has_many :labors

  validates_presence_of :title
end
