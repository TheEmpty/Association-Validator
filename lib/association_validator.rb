class AssociationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, record_id)
    return if record.send(attribute).blank? # return if there is nothing to validate
    # use :presence => true if you want to confirm that something is there
    
    if not options[:polymorphic_class].blank?
      attribute_string = record.send(options[:polymorphic_class])
      return if attribute_string.blank?
      
    elsif options[:class_name].blank? # if class_name is not specified, assume that it's the attirbute without the last 3 characters which should be _id
      attribute_string = attribute.to_s
      attribute_string[-3,3] = ''
      
    elsif options[:class_name].is_a?(String)
      attribute_string = options[:class_name]
      
    elsif options[:class_name].is_a?(Proc)
      attribute_string = options[:class_name].yield(record)
      return if attribute_string.blank?
      
    else
      raise "Association Validator does not support a(n) #{options[:class_name].class.to_s.humanize} as a class_name option"
    end
    
    c  = attribute_string.camelize.constantize # create a refrence to the class
    begin
      valid = c.find(value, :select => 'id') # activerecord will raise an exception if it's not found, so we're going to catch it
    rescue 
      record.errors[attribute] = (options[:message] || "is a non existent record") # and report that it doesn't exist
    end
  end
end
