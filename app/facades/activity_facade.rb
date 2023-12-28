class ActivityFacade
  def self.participant_count(count)
    json_response = ActivityService.participant_count(count)
    Activity.new(json_response)
  end
end