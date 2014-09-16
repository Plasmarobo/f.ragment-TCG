class AccountController < ApplicationController
  before_action :authenticate_user!
  def manage
  end

  def friends
  end
end
