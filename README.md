# Email Format

[![Build Status](https://travis-ci.org/johnotander/email_format.svg?branch=master)](https://travis-ci.org/johnotander/email_format)

This gem uses the thorough email validation check used by the [email_regex](https://github.com/dougwig/email_regex) gem written by Doug Wiegley which "provides a valid email regex that conforms to most valid RFC edges cases (disallows backticks), and allows for a few illegal patterns that are in common use".

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_format'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_format

## Usage

Using it is as simple as using the `validates` keyword in your model:

```ruby
class User < ActiveRecord::Base
  
  # ...

  validates :email, email_format: true

  # ...

end
```

Now the email attribute will be validated accordingly:

```ruby
User.new('valid@email.com').valid? # => true
User.new('invalid_email@@').valid? # => false
```

Also, the model in question doesn't need to inherit from ActiveRecord::Base, you only need to `include ActiveModel::Validations` in your class:

```ruby
require 'email_format'

class Awesome
  include ActiveModel::Validations
  attr_accessor :email
  validates :email, email_format: true
end

awesome = Awesome.new

awesome.email = "valid@email.com"
awesome.valid? # => true

awesome.email = "invalid_email"
awesome.valid? # => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
