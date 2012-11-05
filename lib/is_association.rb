class ActiveRecord::Base
  def is_association? relation
    begin
      self.association(relation.to_sym)
    rescue NoMethodError
      return false
    end
    true
  end
end
