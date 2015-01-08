module ApplicationHelper
  
  def modal_flash(object, type)
    render "global/forms/modal_flash", :object => object, :type => type
  end
  
  def convert_true_false(value)
    if value
      "Yes"
    else
      "No"
    end
  end

  def modal_flash(object, type)
    render "global/forms/modal_flash", :object => object, :type => type
  end
  
  def bootstrap_class_for flash_type
    {success: 'alert-success', notice: 'alert-info', error: 'alert-danger', alert: 'alert-warning'}[flash_type.to_sym] || flash_type.to_s
  end
end
