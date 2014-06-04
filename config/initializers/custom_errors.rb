ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(',')

  if html_tag =~ /^<label/
    html_tag
  else
    %(<span class="html_tag">#{html_tag}<span class="validation-error">&nbsp;#{errors}</span></span>).html_safe
  end

end