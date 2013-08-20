module ApplicationHelper
  def convert_true_false(value)
    if value
      "Yes"
    else
      "No"
    end
  end
end
