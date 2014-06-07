class Movie < ActiveRecord::Base
  validates :title, :rating, :description, presence: true
  validates :title, uniqueness: true
  validates_format_of :release_date, with: /\A(\d{4}-\d{2}-\d{2})\z/, :message => "format must be yyyy-mm-dd"

  def self.all_ratings
    Movie.select(:rating).distinct.pluck(:rating)
  end
end
