class LynkUpService
  def get_user(id)
    response = connection.get("/users/#{id}/")
		JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_all_users
    response = connection.get("/users/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_user(id, params)
    response = connection.patch("/users/#{id}/") do |con|
      con.headers = { "Content-Type" => "application/json" }
      con.body = params.to_json
    end
		JSON.parse(response.body, symbolize_names: true)
  end

  def get_friends_for_user(id)
    response = connection.get("/users/#{id}/friends/")
		JSON.parse(response.body, symbolize_names: true)
  end

  def get_friend_for_user(user_id, friend_id)
    response = connection.get("/users/#{user_id}/friends/#{friend_id}/")
		JSON.parse(response.body, symbolize_names: true)
  end

  def add_friend_for_user(id, params)
    response = connection.post("/users/#{id}/friends/") do |con|
      con.headers = { "Content-Type" => "application/json" }
			con.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_friend_for_user(user_id, friend_id)
    response = connection.delete("/users/#{user_id}/friends/#{friend_id}/")
  end

  def get_all_groups
    response = connection.get("/groups/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_group(id)
    response = connection.get("/groups/#{id}/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_group_friends(group_id)
    response = connection.get("/groups/#{group_id}/friends/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def add_group_friend(group_id, params)
    response = connection.post("/groups/#{group_id}/friends/") do |con|
      con.headers = { "Content-Type" => "application/json" }
      con.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_group_friend(group_id, params)
    response = connection.delete("/groups/#{group_id}/friends/") do |con|
      con.headers = { "Content-Type" => "application/json" }
      con.body = params.to_json
    end
  end

  def create_group(params)
    response = connection.post("/groups/") do |con|
      con.headers = { "Content-Type" => "application/json" }
			con.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_group(id, params)
    response = connection.patch("/groups/#{id}/") do |con|
      con.headers = { "Content-Type" => "application/json" }
      con.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_group(id)
    response = connection.delete("/groups/#{id}/")
  end

  def get_all_events
    response = connection.get("/events/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_event(id)
    response = connection.get("/events/#{id}/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_event(id, params)
    response = connection.patch("/events/#{id}/") do |con|
      con.headers = { "Content-Type" => "application/json" }
			con.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_event(id)
    response = connection.delete("/events/#{id}/")
  end

  private 

  def connection
		url = ENV["LYNKUP_URL"]
    Faraday.new(url: url)
  end
end