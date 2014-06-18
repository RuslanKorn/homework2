class WelcomeController < ApplicationController
  helper_method :creator?
  def show
    @sample_movie = Movie.order("RANDOM()").first
  end
end
