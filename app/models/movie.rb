class Movie < ActiveRecord::Base
  validates :title, :rating, presence: true
  validates :title, uniqueness: true
  validates_format_of :rating, with: /\A(G|PG|PG-13|NC-17|R)\z/, :message => "must be G, PG, PG-13, NC-17 or R"
  validates_format_of :release_date, with: /\A(\d{4}-\d{2}-\d{2})\z/, :message => "format must be yyyy-mm-dd"
end

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(',')

  if html_tag =~ /^<label/
    html_tag
  else
    %(<span class="html_tag">#{html_tag}<span class="validation-error">&nbsp;#{errors}</span></span>).html_safe
  end

end
