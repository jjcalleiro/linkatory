class LinksController < ApplicationController
  
  # GET - Displays all links
  def index
    @links = Link.find :all, :order => 'created_at ASC'
  end

  # GET - Shows one link (based on supplied id)
  def show
    @link = Link.find(params[:id])
  end

  # GET - displays a form that can be used to create a link 
  def new
    @link = Link.new
  end

  # POST - Create a new link
  def create
    @link = Link.new(params[:post])
    @link.save!
    redirect_to :action => link_path(@link)
    rescue ActiveRecord::RecordInvalid
    render :action => "new"
  end

  # GET - display a from allowing us to edit an existing link
  def edit
    @link = Link.find(params[:id])
  end

  # PUT - update an existing link
  def update
    @link = Link.find(params[:id])
    @link.attributes = params[:post]
    @link.save!
    redirect_to :action => link_path(@link)
    rescue ActiveRecord::RecordInvalid
    render :action => "edit"
  end

  # DELETE - delete a link
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to :action => "index"
  end

end
