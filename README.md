is_association
==============

Patches ActiveRecord::Base to expose a method is_association? The method will return true for all associations like has_one, has_many and belongs_to while returning false for regular attributes on the table. 