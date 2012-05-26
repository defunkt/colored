require 'test/unit'
require File.dirname(__FILE__) + '/../lib/colored'

class TestColor < Test::Unit::TestCase
  
  def test_rainbow
    assert_equal "\e[34mh\e[36me\e[32ml\e[35ml\e[31mo\e[0m", "hello".rainbow
  end
  
  def test_rainbow_with_modifiers
    assert_equal "\e[1m\e[4m\e[31mu\e[33mn\e[34md\e[36me\e[32mr\e[35ml\e[31mi\e[33mn\e[34me\e[36m \e[32mb\e[35mo\e[31ml\e[33md\e[34m \e[36mr\e[32ma\e[35mi\e[31mn\e[33mb\e[34mo\e[36mw\e[0m\e[0m\e[0m", "underline bold rainbow".underline.bold.rainbow
  end
  
  def test_one_color
    assert_equal "\e[31mred\e[0m", "red".red
  end

  def test_two_colors
    assert_equal "\e[34m\e[31mblue\e[0m\e[0m", "blue".red.blue
  end

  def test_background_color
    assert_equal "\e[43mon yellow\e[0m", "on yellow".on_yellow
  end

  def test_hot_color_on_color_action
    assert_equal "\e[31m\e[44mred on blue\e[0m", "red on blue".red_on_blue 
  end

  def test_modifier
    assert_equal "\e[1mway bold\e[0m", "way bold".bold
  end

  def test_modifiers_stack
    assert_equal "\e[4m\e[1munderlined bold\e[0m\e[0m", "underlined bold".bold.underline
  end

  def test_modifiers_stack_with_colors
    assert_equal "\e[36m\e[4m\e[1mcyan underlined bold\e[0m\e[0m\e[0m", "cyan underlined bold".bold.underline.cyan
  end

  def test_eol
    assert_equal "\e[2Knothing to see here really.", "nothing to see here really.".to_eol
  end

  def test_eol_with_with_two_colors
    assert_equal "\e[34m\e[31m\e[2Kblue\e[0m\e[0m", "blue".red.blue.to_eol
  end

  def test_eol_with_modifiers_stack_with_colors
    assert_equal "\e[36m\e[4m\e[1m\e[2Kcyan underlined bold\e[0m\e[0m\e[0m", "cyan underlined bold".bold.underline.cyan.to_eol
  end
end
