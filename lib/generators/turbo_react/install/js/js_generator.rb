module TurboReact
  module Generators
    module Install
      class JsGenerator < Rails::Generators::Base
        source_root File.expand_path('templates', __dir__)

        def copy_setup_script
          copy_file "setup_turbo_react.sh", "bin/setup_turbo_react.sh"
          chmod "bin/setup_turbo_react.sh", 0755
        end

        def copy_react_controller
          copy_file "controllers/react_controller.js", "app/javascript/controllers/react_controller.js"
        end

        def copy_turbo_hook
          copy_file "hooks/useTurboFetch.jsx", "app/javascript/hooks/useTurboFetch.jsx"
        end

        def copy_example_component
          copy_file "components/Hello.jsx", "app/javascript/components/Hello.jsx"
        end

        def copy_components_index
          copy_file "components/index.js", "app/javascript/components/index.js"
        end

        def add_yarn_dependencies
          run "bin/setup_turbo_react.sh"
        end
      end
    end
  end
end
