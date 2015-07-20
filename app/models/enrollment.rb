class Enrollment < ActiveRecord::Base
  belongs_to :game
  belongs_to :player, class_name: "User", foreign_key: :user_id
  # has_many :teams
 
  validates :team, inclusion: { in: ["team_a", "team_b"] }
end


# <h1>Team A</h1>
# <% @game.enrollments.teams.first.each do |player| %>
# <a> <%= player %> </a>
# <% end %>
# <h1>Team B</h1>
# <% @game.enrollments.teams.last.each do |player| %>
# <a> <%= player %> </a>
# <% end %>