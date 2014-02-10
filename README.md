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
class Person
  include HumanName::Methods.new(:first_name, :last_name)

  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
end

person = Person.new('John', 'Doe')
person.human_name     # => #<HumanName:0x007fe590825b68 @first_name="John", @last_name="Doe">
person.full_name      # => 'John Doe'
person.name_initials  # => 'J. D.'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
