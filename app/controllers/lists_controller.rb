class ListsController < ApplicationController
  def index
    @lists = User.page(params[:page]).per(5)
  end
end
