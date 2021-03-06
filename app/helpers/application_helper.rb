# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def js(data)
    if data.respond_to? :to_json
      data.to_json
    else
      data.inspect.to_json
    end
  end
  
  def partial(name, options={})
    old_format = self.template_format
    self.template_format = :html
    js render({ :partial => name }.merge(options))
  ensure
    self.template_format = old_format
  end
end
