#!/usr/bin/env ruby
begin
  gem 'minitest', '>= 5.0.0'
  require_relative '../../test/test_helper'
  require_relative 'hello_world'
rescue Gem::LoadError => e
  puts "\nMissing Dependency:\n#{e.backtrace.first} #{e.message}"
  puts 'Minitest 5.0 gem must be installed for the xRuby track.'
rescue LoadError => e
  puts "\nError:\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class HelloWorldTest < Minitest::Test
  def test_no_name
    assert_equal 'Hello, World!', HelloWorld.hello, <<-MSG
    When given no name, it should greet the world!
    MSG
  end

  def test_sample_name
    assert_equal 'Hello, Alice!', HelloWorld.hello('Alice'), <<-MSG
    When given "Alice" it should greet Alice!
    MSG
  end

  def test_other_sample_name
    assert_equal 'Hello, Bob!', HelloWorld.hello('Bob'), <<-MSG
    When given "Bob" it should greet Bob!
    MSG
  end

  def test_no_strange_name
    assert_equal 'Hello, !', HelloWorld.hello(''), <<-MSG
    When given an empty string it should have a space
    and punctuation, though admittedly this is strange.
    MSG
  end
end

__END__

*****************************************************
You got an error, which is exactly as it should be.
This is the first step in the Test-Driven Development
(TDD) process.

The most important part of the error is

   cannot load such file

It's looking for a file named hello_world.rb that doesn't
exist yet.

To fix the error, create an empty file named hello_world.rb
in the same directory as the hello_world_test.rb file.

Then run the test again.

For more guidance as you work on this exercise, see
GETTING_STARTED.md.
*****************************************************
