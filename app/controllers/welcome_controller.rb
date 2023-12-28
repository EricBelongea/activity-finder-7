class WelcomeController < ApplicationController
  def show
  end

  def search
    # require 'pry'; binding.pry
    participants = params[:num_participants].to_i
    if participants < 1 || participants > 5
      flash[:error] = "Please select between 1 and 5 people for an activity."
      redirect_back(fallback_location: root_path)
    else
      @activity = ActivityFacade.participant_count(participants)
    end
  end
end