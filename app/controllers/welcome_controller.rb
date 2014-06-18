class WelcomeController < ApplicationController
  helper_method :creator?
  def show
    @sample_movie = Movie.where(:draft => false).order("RANDOM()").first
  end
end
