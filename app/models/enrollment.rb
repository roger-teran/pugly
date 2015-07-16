class Enrollment < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :team, inclusion:{in:["team_a", "team_b"]}
end
