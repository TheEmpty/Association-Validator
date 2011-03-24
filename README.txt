=== How to use
Validate that the id field is a saved record. It will ignore blank fields, so use presence if you need it. 
    validates :from_age_record_id, :presence => true, :association => {:class_name => 'AgeRecord'}
    validates :user_id, :presence => true, :association => true

You can also set the message using the :message option:
    validates :user_id, :association => {:message => 'was unretrievable'}
	
For polymorphic classes, pass your class_name option as a proc:
    class Item < ActiveRecord::Base
      validates :owner_id, :presence => true, :association => {:class_name => Proc.new {|r| r.owner_type}}
    end
    # == Schema Information
    # Table name: items
    #  owner_id   :integer
    #  owner_type :string

=== How to install
Add the following line to your Gemfile and install.
    gem 'association_validator'

=== Todo
* Tests