class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    render("flights/index.html.erb")
  end

  def show
    @flight = Flight.find(params[:id])

    render("flights/show.html.erb")
  end

  def new
    @flight = Flight.new

    render("flights/new.html.erb")
  end

  def create
    @flight = Flight.new

    @flight.min_cost = params[:min_cost]
    @flight.destination_id = params[:destination_id]

    save_status = @flight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/flights/new", "/create_flight"
        redirect_to("/flights")
      else
        redirect_back(:fallback_location => "/", :notice => "Flight created successfully.")
      end
    else
      render("flights/new.html.erb")
    end
  end

  def edit
    @flight = Flight.find(params[:id])

    render("flights/edit.html.erb")
  end

  def update
    @flight = Flight.find(params[:id])

    @flight.min_cost = params[:min_cost]
    @flight.destination_id = params[:destination_id]

    save_status = @flight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/flights/#{@flight.id}/edit", "/update_flight"
        redirect_to("/flights/#{@flight.id}", :notice => "Flight updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Flight updated successfully.")
      end
    else
      render("flights/edit.html.erb")
    end
  end

  def destroy
    @flight = Flight.find(params[:id])

    @flight.destroy

    if URI(request.referer).path == "/flights/#{@flight.id}"
      redirect_to("/", :notice => "Flight deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Flight deleted.")
    end
  end
end
