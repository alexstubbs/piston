class ::Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end

class ::String
  def camelize(first_letter_in_uppercase = true)
    if first_letter_in_uppercase
      gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      self[0].chr.downcase + camelize(self)[1..1]
    end
  end

  def constantize
    ActiveSupport::Inflector.constantize(self)
  end
end
