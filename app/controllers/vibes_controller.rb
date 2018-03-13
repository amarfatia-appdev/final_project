class VibesController < ApplicationController
  def index
    @q = Vibe.ransack(params[:q])
    @vibes = @q.result(:distinct => true).includes(:tags, :destinations).page(params[:page]).per(10)

    render("vibes/index.html.erb")
  end

  def show
    @tag = Tag.new
    @vibe = Vibe.find(params[:id])

    render("vibes/show.html.erb")
  end

  def new
    @vibe = Vibe.new

    render("vibes/new.html.erb")
  end

  def create
    @vibe = Vibe.new

    @vibe.name = params[:name]

    save_status = @vibe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vibes/new", "/create_vibe"
        redirect_to("/vibes")
      else
        redirect_back(:fallback_location => "/", :notice => "Vibe created successfully.")
      end
    else
      render("vibes/new.html.erb")
    end
  end

  def edit
    @vibe = Vibe.find(params[:id])

    render("vibes/edit.html.erb")
  end

  def update
    @vibe = Vibe.find(params[:id])

    @vibe.name = params[:name]

    save_status = @vibe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/vibes/#{@vibe.id}/edit", "/update_vibe"
        redirect_to("/vibes/#{@vibe.id}", :notice => "Vibe updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Vibe updated successfully.")
      end
    else
      render("vibes/edit.html.erb")
    end
  end

  def destroy
    @vibe = Vibe.find(params[:id])

    @vibe.destroy

    if URI(request.referer).path == "/vibes/#{@vibe.id}"
      redirect_to("/", :notice => "Vibe deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Vibe deleted.")
    end
  end
end
