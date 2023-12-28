class ActivityService
  def self.conn
    Faraday.new(url: "https://www.boredapi.com/api/")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.participant_count(count)
    get_url("activity?participants=#{count}")
  end
end