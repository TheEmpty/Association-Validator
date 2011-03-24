=== How to use
Validate that the id field is a saved record. It will ignore blank fields, so use presence if you need it. 
    validates :from_age_record_id, :presence => true, :association => {:class_name => 'AgeRecord'}
    validates :user_id, :presence => true, :association => true

You can also set the message using the :message option:
    validates :user_id, :association => {:message => 'was unretrievable'}
	
For polymorphic classes, pass your class_name option as a proc or use the new polymorphic_class option
    class Item < ActiveRecord::Base
      # The new way to do polymorphic resource validation
      validates :owner_id, :presence => true, :association => {:polymorphic_class => 'owner_type'}
      # it calls record.send(:polymorphic_class)

      # If for some odd reasson you need to use a proc:
      validates :user_id, :presence => true, :association => {:class_name => Proc.new {|r| r.user_type || "User" }}
    end

=== How to install
Add the following line to your Gemfile and install.
    gem 'association_validator'

=== Todo
* Tests