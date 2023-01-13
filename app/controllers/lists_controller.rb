class ListsController < ApplicationController
  def index
    @lists = User.all
  end
end
