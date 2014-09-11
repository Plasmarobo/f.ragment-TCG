class PathCard < ActiveRecord::Base

  belongs_to :game_instance
  belongs_to :hand

  def right_icon_tag
    img = ""
    case self.right_link
    when "in"
      img = "left64.png"
    when "out"
      img = "right64.png"
    when "both"
      img = "leftright64.png"
    when "blocked"
      img = "block64.png"
    else
      img = "error.png"
    end
    image_tag(img)  
  end

  def left_icon_tag
    img = ""
    case self.left_link
    when "in"
      img = "right64.png"
    when "out"
      img = "left64.png"
    when "both"
      img = "leftright64.png"
    when "blocked"
      img = "block64.png"
    else
      img = "error.png"
    end
    image_tag(img)
  end

  def up_icon_tag
    img = ""
    case self.up_link
    when "in"
      img = "down64.png"
    when "out"
      img = "up64.png"
    when "both"
      img = "updown64.png"
    when "blocked"
      img = "block64.png"
    else
      img = "error.png"
    end
    image_tag(img)
  end

  def down_icon_tag
    img = ""
    case self.down_link
    when "in"
      img = "up64.png"
    when "out"
      img = "down64.png"
    when "both"
      img = "updown64.png"
    when "blocked"
      img = "block64.png"
    else
      img = "error.png"
    end
    image_tag(img)
  end

end
