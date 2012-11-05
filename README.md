is_association
==============

Patches ActiveRecord::Base to expose a method is_association? The method will return true for all associations like has_one, has_many and belongs_to while returning false for regular attributes on the table. 

This gem is tested with rspec(spec/is_association_spec.rb) and hosted on [rubygems](https://rubygems.org/gems/is_association).