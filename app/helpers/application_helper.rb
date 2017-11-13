module ApplicationHelper
  def flash_messages
    content_tag(:script) do
      "setTimeout(function () { #{ flash.collect { |key, msg| "Materialize.toast('#{ msg }', 4000);" }.join } }, 400);".html_safe
    end
  end
end
