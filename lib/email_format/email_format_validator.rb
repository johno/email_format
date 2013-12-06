class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ EmailRegex::EMAIL_ADDRESS_REGEX
      record.errors[attribute] << (options[:message] || "is invalid")
    end
  end
end
