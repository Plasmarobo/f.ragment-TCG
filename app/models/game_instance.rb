class GameInstance < ActiveRecord::Base
  require 'json'
  has_many :path_cards
  has_many :action_cards
  has_many :goal_cards
  has_many :hands
  has_one :root_card, foreign_key: :root_card, class_name: :PathCard
  
  def InstanceDeck(deck_json)
    deck = JSON.parse(deck_json)
    #Read Command Card
    root = PathCard.new
    root.Load('cards/path/#{deck.root}.json')
    root.sequence = 0
    root.InstanceAgainst(game)
    if root.save()
      self.root_card = root
    else

    end
    sequence = 1
    deck.action.each_pair do |action_def, count|
      card = ActionCard.new
      card.Load('cards/action/#{action_def}.json')
      card.InstanceAgainst(self)
      count.times do |index|
        card.sequence = sequence
        card.save
        sequence = sequence + 1
      end
    end
    sequence = 1
    deck.path.each do |path_def, count|
      card = PathCard.new
      card.Load('cards/path/#{path_def}.json')
      card.InstanceAgainst(self)
      count.times do |index|
        card.sequence = sequence
        card.save
        sequence = sequence + 1
      end
    end
    sequence = 1
    deck.goal.each do |goal_def, count|
      card = GoalCard.new
      card.Load('cards/goal/#{goal_def}.json')
      card.InstanceAgainst(self)
      count.times do |index|
        card.sequence = sequence
        card.save
        sequence = sequence + 1
      end
    end
  end
end
