class Task < ActiveRecord::Base
  belongs_to :user
  has_one :attachment
end
