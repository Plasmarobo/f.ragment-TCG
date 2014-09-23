class Card < ActiveRecord::Base
  require 'json'
  belongs_to :game
  belongs_to :player

  def Load
    if self.json.nil?
      path = "#{Rails.root.to_s}/public/cards/#{self.card_type}/#{self.name}.json"
      puts "Tried to read #{path}"
      self.json = File.read(path)
      puts "JSON: #{self.json}"
      self.save
    end
    @info = JSON.parse(self.json)
  end

  def upLink
    if @info.nil?
      self.Load
    end

    file = "error"
    size = "64"
    
    case @info["up_link"]
    when "in"
      file = "down"
    when "out"
      file = "up"
    when "both"
      file = "updown"
    when "blocked"
      file = "blocked"
    end
    
    return "cards/icon/#{file}#{size}.png"
  end

  def downLink
    if @info.nil?
      self.Load
    end

    file = "error"
    size = "64"

    case @info["down_link"]
    when "in"
      file = "up"
    when "out"
      file = "down"
    when "both"
      file = "updown"
    when "blocked"
      file = "blocked"
    end

    return "cards/icon/#{file}#{size}.png"
  end

  def leftLink
    if @info.nil?
      self.Load
    end

    file = "error"
    size = "64"

    case @info["left_link"]
    when "in"
      file = "right"
    when "out"
      file = "left"
    when "both"
      file = "leftright"
    when "blocked"
      file = "blocked"
    end

    return "cards/icon/#{file}#{size}.png"
  end

  def rightLink
    if @info.nil?
      self.Load
    end

    file = "error"
    size = "64"

    case @info["right_link"]
    when "in"
      file = "left"
    when "out"
      file = "right"
    when "both"
      file = "leftright"
    when "blocked"
      file = "blocked"
    end

    return "cards/icon/#{file}#{size}.png"
  end

  def getName
    if @info.nil?
      self.Load
    end

    return @info["name"]
  end

  def getFlavortext
    if @info.nil?
      self.Load
    end
    haml = ""
    return @info["description"].each { |line| ".f_fragment_flavor_line #{line}"}
  end

  def locked?
    if @info.nil?
      self.Load
    end

    return @info["locked"]
  end

  def inject?
    if @info.nil?
      self.Load
    end

    return @info["inject"]
  end

  def push?
    if @info.nil?
      self.Load
    end

    return @info["push"]
  end

  def getRule
    if @info.nil?
      self.Load
    end

    return @info["rule"]
  end

end
