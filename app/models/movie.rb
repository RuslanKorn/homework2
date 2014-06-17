class Movie < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :title, :rating, :description, presence: true
  validates :title, uniqueness: true
  validates_format_of :release_date, with: /\A(\d{4}-\d{2}-\d{2})\z/, :message => "format must be yyyy-mm-dd"

scope :list, ->(options) {
    res = all
    res = res.where(rating: options[:rating]) if options.key? :rating
    res = res.order(options[:order]) if options.key? :order
    res
  }

  def self.all_ratings
    all.map(&:rating).uniq
  end

end
