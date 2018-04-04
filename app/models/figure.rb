class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  validates_presence_of :name

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
