require 'holoman/extension'
require 'thor'

module Holoman
  class CLI < Thor
    include Thor::Actions
    include ExitCode

    namespace :default

    #source_root Holoman.root_path
    def self.source_root
      File.dirname(__FILE__)
    end

    # desc 'version', 'Show version'
    # def version
    #   say "Holoman #{Holoman::VERSION}"
    # end

    desc "clean", "Delete all .erb files on middleman"
    def clean
      source_path = "/Users/cristianferrari/Development/labs/middleman/holoman-test/"
      Dir.glob(source_path + "*.erb").sort.each do |f|
        remove_file f
      end
    end

    desc "generate", "Run Hologram and generate static html"
    def generate
      puts run('bundle exec hologram hologram.yml')
    end

    desc "migrate", "Migrate Hologram files to Middleman"
    def migrate
      base_path        = Dir.pwd
      source_path      = base_path + Holoman::Extension.app.options.my_option
      destination_path = base_path + "source/"

      Dir.glob(source_path + "*.html").sort.each do |f|
        filename = File.basename(f, File.extname(f))
        File.rename(f, destination_path + filename + File.extname(f) + ".erb")
      end
      remove_file source_path
      #Dir.delete(source_path)
    end

    desc "build", "Clean files, generate hologram and Migrate files to middleman"
    def build
      puts run('bundle exec holoman clean')
      puts run('bundle exec holoman generate')
      puts run('bundle exec holoman migrate')
    end

    desc "start", "Start Hologram watcher"
    def start
      autoconfig_guard
      autoconfig_hologram
      puts run("bundle exec guard")
    end

    # Fixes thor's banners when used with :default namespace
    def self.banner(command, namespace = nil, subcommand = false)
      "#{basename} #{command.formatted_usage(self, false, subcommand)}"
    end

    private

    desc "watcher", "Generate and Migration watcher"
    def watcher
      puts run('bundle exec guard --watchdir ../')
    end

    desc "autoconfig_guard", "Generate configuration file for Guard"
    def autoconfig_guard
      guardfile_path = Dir.pwd + "/Guardfile"
      puts guardfile_path
      template "templates/Guardfile", guardfile_path
    end

    desc "autoconfig_hologram", "Generate configuration file for Hologram"
    def autoconfig_hologram
      source_path          = "/Users/cristianferrari/Development/labs/middleman/holoman-test/"
      hologram_config_path = source_path + "hologram.yml"
      hologram_header_path = Dir.pwd + "/source/layouts/_header.html"
      hologram_footer_path = Dir.pwd + "/source/layouts/_footer.html"

      template "templates/hologram.yml", hologram_config_path
      copy_file "templates/_header.html", hologram_header_path
      copy_file "templates/_footer.html", hologram_footer_path
    end

  end
end
