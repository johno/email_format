require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'active_model'
require 'email_format'

RSpec.configure do |config|
  config.color_enabled = true
end

class FakeModel
  include ActiveModel::Validations

  attr_accessor :email

  validates :email, email_format: true
end

class FakeModelWithBlankEmail
  include ActiveModel::Validations

  attr_accessor :email

  validates :email, email_format: true, allow_blank: true
end
