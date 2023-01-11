class Candidate < ApplicationRecord
  belongs_to :constituency
  acts_as_votable
end
