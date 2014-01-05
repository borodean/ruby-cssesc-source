version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name     = 'cssesc-source'
  s.version  = version
  s.summary  = 'JavaScript source code for cssesc'

  s.license  = 'MIT'

  s.author   = 'Vadim Borodean'
  s.email    = 'borodean@gmail.com'
  s.homepage = 'http://github.com/borodean/ruby-cssesc-source'

  s.files = Dir['lib/**/*', 'vendor/**/*']
end
