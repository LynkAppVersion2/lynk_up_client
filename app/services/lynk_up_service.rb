class LynkUpService
  def get_user(id)
    response = connection.get("/users/#{id}/")
		JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_users
    response = connection.get("/users/")
		JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def connection
		url = ENV["LYNKUP_URL"]
    Faraday.new(url: url)
  end
end