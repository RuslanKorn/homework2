class Movie < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
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
