class FlatpagesController < ApplicationController
  def movement
    @nav = "movement"
  end

  def people
    @nav = "people"
  end

  def seminars
    @nav = "seminars"
  end

  def friends
    @nav = "friends"
  end
end