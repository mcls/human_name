# HumanName

TODO: Write a gem description

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

  def initalize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
end

person = Person.new('John', 'Doe')
person.full_name      # => 'John Doe'
person.name_initials  # => 'J. D.'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
