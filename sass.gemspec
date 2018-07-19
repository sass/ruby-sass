require 'rubygems'

# Note that Sass's gem-compilation process requires access to the filesystem.
# This means that it cannot be automatically run by e.g. GitHub's gem system.
# However, a build server automatically packages the master branch
# every time it's pushed to; this is made available as a prerelease gem.
SASS_GEMSPEC = Gem::Specification.new do |spec|
  spec.rubyforge_project = 'sass'
  spec.name = 'sass'
  spec.summary = "A powerful but elegant CSS compiler that makes CSS fun again."
  spec.version = File.read(File.dirname(__FILE__) + '/VERSION').strip
  spec.authors = ['Natalie Weizenbaum', 'Chris Eppstein', 'Hampton Catlin']
  spec.email = 'sass-lang@googlegroups.com'
  spec.description = <<-END
      Sass makes CSS fun again. Sass is an extension of CSS, adding
      nested rules, variables, mixins, selector inheritance, and more.
      It's translated to well-formatted, standard CSS using the
      command line tool or a web-framework plugin.
    END

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'sass-listen', '~> 4.0.0'

  spec.add_development_dependency 'yard', '~> 0.8.7.6'
  spec.add_development_dependency 'redcarpet', '~> 3.3'
  spec.add_development_dependency 'nokogiri', '~> 1.6.0'
  spec.add_development_dependency 'minitest', '>= 5'

  s.metadata = {
    'source_code_uri' => 'https://github.com/sass/ruby-sass'
  }

  readmes = Dir['*'].reject{ |x| x =~ /(^|[^.a-z])[a-z]+/ || x == "TODO" }
  spec.executables = ['sass', 'sass-convert', 'scss']
  spec.files = Dir['rails/init.rb', 'lib/**/*', 'bin/*', 'test/**/*',
    'extra/**/*', 'Rakefile', 'init.rb', '.yardopts'] + readmes
  spec.homepage = 'http://sass-lang.com/'
  spec.has_rdoc = false
  spec.test_files = Dir['test/**/*_test.rb']
  spec.license = "MIT"

  spec.post_install_message = <<END

Ruby Sass is deprecated and will be unmaintained as of 26 March 2019.

* If you use Sass as a command-line tool, we recommend using Dart Sass, the new
  primary implementation: https://sass-lang.com/install

* If you use Sass as a plug-in for a Ruby web framework, we recommend using the
  sassc gem: https://github.com/sass/sassc-ruby#readme

* For more details, please refer to the Sass blog:
  http://sass.logdown.com/posts/7081811

END
end
