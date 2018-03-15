class RecommendationsController < ApplicationController
  before_action :current_user_must_be_recommendation_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_recommendation_user
    recommendation = Recommendation.find(params[:id])

    unless current_user == recommendation.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.recommendations.ransack(params[:q])
      @recommendations = @q.result(:distinct => true).order("created_at desc").includes(:user, :destination).page(params[:page]).per(10)

    render("recommendations/index.html.erb")
  end

  def show
    @recommendation = Recommendation.find(params[:id])

    render("recommendations/show.html.erb")
  end

  def new
    @recommendation = Recommendation.new

    render("recommendations/new.html.erb")
  end

  def create
    flight_budget = params[:flight_number].to_i
    hotel_budget = params[:hotel_number].to_i
    stars = params[:stars].to_i
    vibe = params[:vibe_id].to_i
    
    destinations = Destination.joins(tags: :vibe).where('tags.vibe_id' => vibe).pluck(:destination_id)
    suggestions = []
    destinations.each do |destination|
      costf = Flight.find_by(:destination_id => destination).min_cost
      costh = Hotel.find_by(:destination_id => destination, :stars => stars).min_cost
      if flight_budget >= costf && hotel_budget >=costh
      suggestions.push(destination)
      end  
    end  
    
    if suggestions.length == 0
      redirect_to("/destinations", :alert => "Sorry we were unable to find a match. Please check back soon as we are expanding our list of destinations!")
    else
      suggestions.each do |suggestion|
        @recommendation = Recommendation.new
        @recommendation.user_id = current_user.id
        @recommendation.destination_id = suggestion
        if @recommendation.valid?
          @recommendation.save
        end
      end
    redirect_to("/recommendations")
    end 
  end 
 

  def edit
    @recommendation = Recommendation.find(params[:id])

    render("recommendations/edit.html.erb")
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destination_id = params[:destination_id]

    save_status = @recommendation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recommendations/#{@recommendation.id}/edit", "/update_recommendation"
        redirect_to("/recommendations/#{@recommendation.id}", :notice => "Recommendation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recommendation updated successfully.")
      end
    else
      render("recommendations/edit.html.erb")
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])

    @recommendation.destroy

    if URI(request.referer).path == "/recommendations/#{@recommendation.id}"
      redirect_to("/", :notice => "Recommendation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Recommendation deleted.")
    end
  end
end
