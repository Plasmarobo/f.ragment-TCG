class Card < ActiveRecord::Base
  require 'json'
  belongs_to :game
  belongs_to :user

  def Load
    #Build path
    path = "cards/#{self.type}/#{self.name}.json"
    self.json = JSON.Parse(File.read(path))
    self.save
  end
end
