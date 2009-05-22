require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'
require 'rubygems/doc_manager'

class Gem::DocManager
  ##
  # Is the ri documentation installed?

  def ri_installed?
    File.exist?(File.join(@doc_dir, "ri"))
  end
end

class Gem::Commands::AtodeYomuCommand < Gem::Command
  include Gem::VersionOption

  def initialize
    super 'atode_yomu', 'Cleverly installs rdoc and ri for the latest versions of already installed gems',
        :generate_rdoc     => true,
        :generate_ri       => true

    add_option('--all',
               'Generate RDoc/RI documentation for',
               'the latest versions of installed gems') do |value, options|
      options[:all] = value
    end

#     add_version_option
  end

  def arguments # :nodoc:
    'GEMNAME       gem to generate documentation for (unless --all)'
  end

  def usage # :nodoc:
    "#{program_name} [args]"
  end

  def execute
    if options[:all] then
      specs = Gem::SourceIndex.from_installed_gems.latest_specs
    else
      gem_name = get_one_gem_name
      dep = Gem::Dependency.new gem_name
      specs = Gem::SourceIndex.from_installed_gems.latest_specs.search dep
    end

    if specs.empty?
      fail "Failed to find gem #{gem_name} to generate RDoc"
    end

    specs.each do |spec|
      doc_manager = Gem::DocManager.new spec
      if options[:generate_ri]
        if !doc_manager.ri_installed? && File.exist?(File.join(spec.full_gem_path, 'lib'))
          doc_manager.generate_ri
        else
          say "skip installing ri for #{spec.name} #{spec.version}..."
        end
      end

      if options[:generate_rdoc]
        if !doc_manager.rdoc_installed? && File.exist?(File.join(spec.full_gem_path, 'lib'))
          doc_manager.generate_rdoc
        else
          say "skip installing rdoc for #{spec.name} #{spec.version}..."
        end
      end
    end if options[:generate_ri] || options[:generate_rdoc]
    Gem::DocManager.update_ri_cache if options[:generate_ri]

    true
  end
end
