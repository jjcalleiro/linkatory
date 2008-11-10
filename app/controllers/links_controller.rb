class LinksController < ApplicationController
    
  # GET - Displays all links
  def index
    @links = Link.find :all, :order => 'created_at ASC'
    respond_to do |format|
      format.xml  { render :xml => @links.to_xml }
      format.json { render :json => @links.to_json }
      format.html { }
    end
  end

  # GET - Shows one link (based on supplied id)
  def show
    @link = Link.find(params[:id])
    respond_to do |format|
      format.xml  { render :xml => @link.to_xml }
      format.json { render :json => @link.to_json }
      format.html { }
    end
  end

  # GET - displays a form that can be used to create a link 
  def new
    @link = Link.new
  end

  # POST - Create a new link
  def create
    @link = Link.new(params[:post])
    @link.save!

    respond_to do |format|
      format.html { redirect_to :action => link_path(@link) }
      format.xml  { render :xml => @link.to_xml, :status => :created }
      format.json { render :json => @link.to_json, :status => :created }
    end
    rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml  { render :xml => @post.errors.to_xml, :status => 500 }
    end
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
    
    respond_to do |format|
      format.html { }
    end
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
