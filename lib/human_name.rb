require "forwardable"
require "human_name/version"
require "human_name/methods"
require "human_name/defaults"

class HumanName
  attr_reader :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end

  def first_name
    (@first_name || '').strip
  end

  def last_name
    (@last_name || '').strip
  end

  def full_name
    non_blank_names.join(' ')
  end

  def name_initials
    non_blank_names.map { |n| "#{n[0]}." }.join(' ')
  end

  private

  def non_blank_names
    [first_name, last_name].delete_if(&:empty?)
  end
end
