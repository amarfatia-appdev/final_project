Rails.application.routes.draw do
  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

  # Routes for the Vibe resource:
  # CREATE
  get "/vibes/new", :controller => "vibes", :action => "new"
  post "/create_vibe", :controller => "vibes", :action => "create"

  # READ
  get "/vibes", :controller => "vibes", :action => "index"
  get "/vibes/:id", :controller => "vibes", :action => "show"

  # UPDATE
  get "/vibes/:id/edit", :controller => "vibes", :action => "edit"
  post "/update_vibe/:id", :controller => "vibes", :action => "update"

  # DELETE
  get "/delete_vibe/:id", :controller => "vibes", :action => "destroy"
  #------------------------------

  # Routes for the Recommendation resource:
  # CREATE
  get "/recommendations/new", :controller => "recommendations", :action => "new"
  post "/create_recommendation", :controller => "recommendations", :action => "create"

  # READ
  get "/recommendations", :controller => "recommendations", :action => "index"
  get "/recommendations/:id", :controller => "recommendations", :action => "show"

  # UPDATE
  get "/recommendations/:id/edit", :controller => "recommendations", :action => "edit"
  post "/update_recommendation/:id", :controller => "recommendations", :action => "update"

  # DELETE
  get "/delete_recommendation/:id", :controller => "recommendations", :action => "destroy"
  #------------------------------

  # Routes for the Hotel resource:
  # CREATE
  get "/hotels/new", :controller => "hotels", :action => "new"
  post "/create_hotel", :controller => "hotels", :action => "create"

  # READ
  get "/hotels", :controller => "hotels", :action => "index"
  get "/hotels/:id", :controller => "hotels", :action => "show"

  # UPDATE
  get "/hotels/:id/edit", :controller => "hotels", :action => "edit"
  post "/update_hotel/:id", :controller => "hotels", :action => "update"

  # DELETE
  get "/delete_hotel/:id", :controller => "hotels", :action => "destroy"
  #------------------------------

  # Routes for the Flight resource:
  # CREATE
  get "/flights/new", :controller => "flights", :action => "new"
  post "/create_flight", :controller => "flights", :action => "create"

  # READ
  get "/flights", :controller => "flights", :action => "index"
  get "/flights/:id", :controller => "flights", :action => "show"

  # UPDATE
  get "/flights/:id/edit", :controller => "flights", :action => "edit"
  post "/update_flight/:id", :controller => "flights", :action => "update"

  # DELETE
  get "/delete_flight/:id", :controller => "flights", :action => "destroy"
  #------------------------------

  # Routes for the Destination resource:
  # CREATE
  get "/destinations/new", :controller => "destinations", :action => "new"
  post "/create_destination", :controller => "destinations", :action => "create"

  # READ
  get "/destinations", :controller => "destinations", :action => "index"
  get "/destinations/:id", :controller => "destinations", :action => "show"

  # UPDATE
  get "/destinations/:id/edit", :controller => "destinations", :action => "edit"
  post "/update_destination/:id", :controller => "destinations", :action => "update"

  # DELETE
  get "/delete_destination/:id", :controller => "destinations", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
