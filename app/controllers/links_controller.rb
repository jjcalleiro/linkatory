class LinksController < ApplicationController    
 # GET - displays all links    
 def index      
   @links = Link.find :all, :order => 'created_at ASC'    
 end    
 
 # GET - shows one link (based on the supplied id)    
 def show      
   @link = Link.find(params[:id])    
 end    
 
 # GET - displays a form which can be used to create a link
 def new  
   @link = Link.new    
 end    
 
 # link - create a new link    
 def create      
   @link = Link.new(params[:link])      
   @link.save!      
   redirect_to link_path(@link)    
   rescue ActiveRecord::RecordInvalid      
   render :action => 'new'    
 end    
 
 # GET - displays a form allowing us to edit an existing link
 def edit
   @link = Link.find(params[:id])
 end    
 
 # PUT - update an existing link    
 def update      
   @link = Link.find(params[:id])      
   @link.attributes = params[:link]      
   @link.save!      
   redirect_to link_path(@link)    
   rescue ActiveRecord::RecordInvalid      
   render :action => 'edit'    
 end    
 
 # DELETE - delete a link    
 def destroy      
   @link  = Link.find(params[:id])      
   @link.destroy      
   redirect_to links_path    
 end  
end