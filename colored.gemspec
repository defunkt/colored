Gem::Specification.new do |s|
  s.name              = "colored"
  s.version           = "1.2"
  s.date              = "2010-02-10"
  s.summary           = "Add some color to your life."
  s.homepage          = "http://github.com/defunkt/colored"
  s.email             = "chris@ozmm.org"
  s.authors           = ["Chris Wanstrath"]
  s.has_rdoc          = false
  s.require_path      = "lib"
  s.files             = %w( README Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("test/**/*")
  s.description       = <<-desc
  >> puts "this is red".red
 
  >> puts "this is red with a blue background (read: ugly)".red_on_blue

  >> puts "this is red with an underline".red.underline

  >> puts "this is really bold and really blue".bold.blue

  >> logger.debug "hey this is broken!".red_on_yellow     # in rails

  >> puts Color.red "This is red" # but this part is mostly untested
  desc
end
