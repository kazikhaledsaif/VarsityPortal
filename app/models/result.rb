class Result < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :semester

end
