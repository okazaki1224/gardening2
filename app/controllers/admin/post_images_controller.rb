class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!
  def index
  end
end
