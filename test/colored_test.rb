require 'test/unit'
require File.dirname(__FILE__) + '/../lib/colored'

class TestColor < Test::Unit::TestCase
  def test_one_color
    assert_equal "\e[31mred\e[0m", "red".red
    assert_equal "\e[31m100\e[0m", 100.red
    assert_equal "\e[31m100.001\e[0m", 100.001.red
  end

  def test_two_colors
    assert_equal "\e[34m\e[31mblue\e[0m\e[0m", "blue".red.blue
    assert_equal "\e[34m\e[31m505\e[0m\e[0m", 505.red.blue
    assert_equal "\e[34m\e[31m505.223\e[0m\e[0m", 505.223.red.blue
  end

  def test_background_color
    assert_equal "\e[43mon yellow\e[0m", "on yellow".on_yellow
    assert_equal "\e[43m1920\e[0m", 1920.on_yellow
    assert_equal "\e[43m19.2\e[0m", 19.2.on_yellow
  end

  def test_hot_color_on_color_action
    assert_equal "\e[31m\e[44mred on blue\e[0m", "red on blue".red_on_blue 
    assert_equal "\e[31m\e[44m38\e[0m", 38.red_on_blue 
    assert_equal "\e[31m\e[44m38.38\e[0m", 38.38.red_on_blue 

  end

  def test_modifier
    assert_equal "\e[1mway bold\e[0m", "way bold".bold
    assert_equal "\e[1m35\e[0m", 35.bold
    assert_equal "\e[1m35.467\e[0m", 35.467.bold
  end

  def test_modifiers_stack
    assert_equal "\e[4m\e[1munderlined bold\e[0m\e[0m", "underlined bold".bold.underline
    assert_equal "\e[4m\e[1m129\e[0m\e[0m", 129.bold.underline
    assert_equal "\e[4m\e[1m129.29\e[0m\e[0m", 129.29.bold.underline
  end

  def test_modifiers_stack_with_colors
    assert_equal "\e[36m\e[4m\e[1mcyan underlined bold\e[0m\e[0m\e[0m", "cyan underlined bold".bold.underline.cyan
    assert_equal "\e[36m\e[4m\e[1m954\e[0m\e[0m\e[0m", 954.bold.underline.cyan
    assert_equal "\e[36m\e[4m\e[1m954.55\e[0m\e[0m\e[0m", 954.55.bold.underline.cyan
  end

  def test_eol
    assert_equal "\e[2Knothing to see here really.", "nothing to see here really.".to_eol
    #assert_equal "\e[2K456", 456.to_eol
    #assert_equal "\e[2K456.82", 456.82.to_eol
  end

  def test_eol_with_with_two_colors
    assert_equal "\e[34m\e[31m\e[2Kblue\e[0m\e[0m", "blue".red.blue.to_eol
  end

  def test_eol_with_modifiers_stack_with_colors
    assert_equal "\e[36m\e[4m\e[1m\e[2Kcyan underlined bold\e[0m\e[0m\e[0m", "cyan underlined bold".bold.underline.cyan.to_eol
  end
end
