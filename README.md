# HumanName

[![Gem
Version](https://badge.fury.io/rb/human_name.png)](http://badge.fury.io/rb/human_name)
[![Build
Status](https://travis-ci.org/mcls/human_name.png?branch=master)](https://travis-ci.org/mcls/human_name)

Never write `def full_name` again!

## Installation

Add this line to your application's Gemfile:

    gem 'human_name'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install human_name

## Usage

```ruby
require "rubygems"
require "human_name"

class Person
  # Assumes :first_name and :last_name methods exist
  include HumanName::Defaults

  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
end

person = Person.new("John", "Doe")
p person.human_name     # => #<HumanName:0x007fe590825b68 @first_name="John", @last_name="Doe">
p person.full_name      # => "John Doe"
p person.name_initials  # => "J. D."

class P3rs0n
  # You can also use custom methods
  include HumanName::Methods.new(:f_n4m3, :l_n4m3)

  def f_n4m3
    "John"
  end

  def l_n4m3
    "Doe"
  end
end

person = P3rs0n.new
p person.human_name     # => #<HumanName:0x007fe590825b68 @first_name="John", @last_name="Doe">
p person.full_name      # => "John Doe"
p person.name_initials  # => "J. D."
p person.human_name.first_name  # => "John"
p person.human_name.last_name   # => "Doe"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
