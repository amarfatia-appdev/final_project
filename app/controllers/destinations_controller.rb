class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all

    render("destinations/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @tag = Tag.new
    @flight = Flight.new
    @hotel = Hotel.new
    @recommendation = Recommendation.new
    @destination = Destination.find(params[:id])

    render("destinations/show.html.erb")
  end

  def new
    @destination = Destination.new

    render("destinations/new.html.erb")
  end

  def create
    @destination = Destination.new

    @destination.name = params[:name]
    @destination.description = params[:description]
    @destination.tag_id = params[:tag_id]
    @destination.image_url = params[:image_url]
    @destination.latitude = params[:latitude]
    @destination.longitude = params[:longitude]

    save_status = @destination.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/destinations/new", "/create_destination"
        redirect_to("/destinations")
      else
        redirect_back(:fallback_location => "/", :notice => "Destination created successfully.")
      end
    else
      render("destinations/new.html.erb")
    end
  end

  def edit
    @destination = Destination.find(params[:id])

    render("destinations/edit.html.erb")
  end

  def update
    @destination = Destination.find(params[:id])

    @destination.name = params[:name]
    @destination.description = params[:description]
    @destination.tag_id = params[:tag_id]
    @destination.image_url = params[:image_url]
    @destination.latitude = params[:latitude]
    @destination.longitude = params[:longitude]

    save_status = @destination.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/destinations/#{@destination.id}/edit", "/update_destination"
        redirect_to("/destinations/#{@destination.id}", :notice => "Destination updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Destination updated successfully.")
      end
    else
      render("destinations/edit.html.erb")
    end
  end

  def destroy
    @destination = Destination.find(params[:id])

    @destination.destroy

    if URI(request.referer).path == "/destinations/#{@destination.id}"
      redirect_to("/", :notice => "Destination deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Destination deleted.")
    end
  end
end
