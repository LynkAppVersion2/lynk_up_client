Rails.application.routes.draw do
  get "/users/:id/dashboard", to: "users#dashboard"
  get "/users/:user_id/events/:event_id", to: "events#show"
end
