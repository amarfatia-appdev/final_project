class DestinationsController < ApplicationController
  def index
    @q = Destination.ransack(params[:q])
    @destinations = @q.result(:distinct => true).includes(:recommendations, :hotels, :flights, :tags, :favorites, :fans, :vibes).page(params[:page]).per(10)

    render("destinations/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @flight = Flight.new
    @hotel = Hotel.new
    @destination = Destination.find(params[:id])
    
    @google_map = "https://maps.googleapis.com/maps/api/staticmap?center="+ @destination.latitude + "," + @destination.longitude+ "&size=300x300&zoom=5"


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
