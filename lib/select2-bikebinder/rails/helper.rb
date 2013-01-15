module ApplicationHelper
  def h!(str)
    str = html_escape(str)
    return str.gsub(/'/, "&#x27")
  end
end

module Select2BikeBinder
  module ViewHelper
  end
end
