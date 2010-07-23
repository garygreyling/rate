class RefereesController < ApplicationController
  def index
    @referees = Referee.all
  end
end
