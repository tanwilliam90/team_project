class Workout < ActiveRecord::Base
  belongs_to :user

  # validates :user, presence: true # add this
end
