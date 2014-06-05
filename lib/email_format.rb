require "email_regex"
require "email_format/version"
require "email_format/email_format_validator"

module EmailFormat

  def self.valid?(email)
    !!(email =~ EmailRegex::EMAIL_ADDRESS_REGEX)
  end
end
