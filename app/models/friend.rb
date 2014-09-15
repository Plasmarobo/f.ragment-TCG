class Friend < ActiveRecord::Base
  belongs_to :user
  has_one :friend, class_name: :User
end
