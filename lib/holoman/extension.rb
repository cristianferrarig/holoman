# Extension namespace
module Holoman
  class Extension < ::Middleman::Extension
    option :docs_source,       'source/assets'  'relative path to your source files'
    option :docs_destination,  'source'         'relative path where you want the documentation to be built'
    option :docs_assets,       'source/layouts' 'The assets needed to build the docs (header & footer)'
    option :docs_index,        'basics'         'Mark which category should be the index page.'
    option :docs_dependencies, ''               'Any other asset folders that need to be copied to the destination folder'

    def initialize(app, options_hash={}, &block)
      # Call super to build options from the options_hash
      super

      # Require libraries only when activated

      # set up your extension
      # puts options.my_option
    end

    def before_configuration

    end

    def after_configuration
      # Do something
    end

    def before_build

    end

    def after_build
      # Do something
    end

    # A Sitemap Manipulator
    # def manipulate_resource_list(resources)
    # end

    # module do
    #   def a_helper
    #   end
    # end

  end
end
