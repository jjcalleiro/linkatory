class Link < ActiveRecord::Base
  
  # validation constants that can also be used for form lengths
  TITLE_MAX_LENGTH = 80
  
  # link validations
  # TODO: Add validation for URL format
  validates_presence_of :location, :on => :create, :message => "must have a valid url"
  
  # title validations
  validates_presence_of :title, :message => "Just put something in the title"
  validates_length_of :title, :maximum => TITLE_MAX_LENGTH, :message => "Your title needs to be less than #{TITLE_MAX_LENGTH} Characters"
  
end
