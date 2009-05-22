# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'atode_yomu'
  s.version = '0.0.1'
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.authors = ['Akira Matsuda']
  s.date = '2009-05-22'
  s.description = 'A gem plugin that cleverly installs rdoc and ri for the latest versions of already installed gems',
  s.email = 'ronnie@dio.jp'
  s.files = [
    'MIT-LICENSE',
    'README.markdown',
    'VERSION.yml',
    'lib/rubygems/commands/atode_yomu_command.rb',
    'lib/rubygems_plugin.rb'
  ]
  s.homepage = 'http://github.com/amatsuda/atode_yomu'
  s.require_paths = ['lib']
  s.rubygems_version = '1.3.2'
  s.summary = 'A gem plugin to install rdoc and ri cleverly anytime LATER'
end
