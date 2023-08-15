Rails.application.routes.draw do
  get "/users/:id/dashboard", to: "users#dashboard"
end
