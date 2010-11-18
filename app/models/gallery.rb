require 'carrierwave/orm/mongoid'
class Gallery
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActsAsList::Mongoid
  
  field :pos, :type => Integer
  field :title
  field :description
  field :keywords
  
  validates_presence_of :title, :description
  validates_uniqueness_of :title, :case_sensitive => false
  validates_length_of :title, :within => 2..100
  validates_length_of :description, :within => 5..1000
  validates_length_of :keywords, :within => 3..200, :allow_blank => true
  
  key :title
  attr_protected :_id
  
  acts_as_list :column => :pos
  
  # hierarchical associations
  embeds_many :gallery_photos
  
  # image
  mount_uploader :slide, SlideUploader
  
end
