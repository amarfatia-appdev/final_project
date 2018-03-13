class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all

    render("hotels/index.html.erb")
  end

  def show
    @hotel = Hotel.find(params[:id])

    render("hotels/show.html.erb")
  end

  def new
    @hotel = Hotel.new

    render("hotels/new.html.erb")
  end

  def create
    @hotel = Hotel.new

    @hotel.stars = params[:stars]
    @hotel.min_cost = params[:min_cost]
    @hotel.destination_id = params[:destination_id]

    save_status = @hotel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hotels/new", "/create_hotel"
        redirect_to("/hotels")
      else
        redirect_back(:fallback_location => "/", :notice => "Hotel created successfully.")
      end
    else
      render("hotels/new.html.erb")
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])

    render("hotels/edit.html.erb")
  end

  def update
    @hotel = Hotel.find(params[:id])

    @hotel.stars = params[:stars]
    @hotel.min_cost = params[:min_cost]
    @hotel.destination_id = params[:destination_id]

    save_status = @hotel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hotels/#{@hotel.id}/edit", "/update_hotel"
        redirect_to("/hotels/#{@hotel.id}", :notice => "Hotel updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hotel updated successfully.")
      end
    else
      render("hotels/edit.html.erb")
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])

    @hotel.destroy

    if URI(request.referer).path == "/hotels/#{@hotel.id}"
      redirect_to("/", :notice => "Hotel deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hotel deleted.")
    end
  end
end
