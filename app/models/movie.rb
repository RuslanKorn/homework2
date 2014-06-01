class Movie < ActiveRecord::Base
  validates :title, :rating, :release_date, presence: true
  validates :title, :uniqueness => true
  validates_format_of :rating, with: /\A(G|PG|PG-13|NC-17|R)\z/, :message => "must be G, PG, PG-13, NC-17 or R!"
  validates_format_of :release_date, with: /\A\d{4}-\d{2}\d{2}./, :message => "format must be xxxx-xx-xx!"

end
