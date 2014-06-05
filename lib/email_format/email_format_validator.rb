class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless EmailFormat.valid?(value)
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  end
end
