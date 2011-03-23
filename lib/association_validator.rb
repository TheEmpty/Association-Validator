class AssociationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if record.send(attribute).blank? # return if value.blank? # use :presence => true if you want to confirm that something is there
    
	if options[:class_name].blank?
      attribute_string = attribute.to_s
      attribute_string[-3,3] = ''
    else
      attribute_string = options[:class_name]
    end
    
    c  = attribute_string.camelize.constantize # create a refrence to the class
    begin
      valid = c.find(value, :select => 'id') # activerecord will raise an exception if it's not found, so we're going to catch it
    rescue 
      record.errors[attribute] = "is a non existent record" # and report that it doesn't exist
    end
  end
end
