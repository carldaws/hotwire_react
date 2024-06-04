module HotwireReact
  module Generators
    module Install
      class TsGenerator < Rails::Generators::Base
        source_root File.expand_path('templates', __dir__)

        def copy_setup_script
          copy_file "setup_hotwire_react.sh", "bin/setup_hotwire_react.sh"
          chmod "bin/setup_hotwire_react.sh", 0755
        end

        def copy_ts_config
          copy_file "tsconfig.json", "tsconfig.json"
        end

        def copy_react_controller
          copy_file "controllers/react_controller.ts", "app/javascript/controllers/react_controller.ts"
        end

        def copy_turbo_hook
          copy_file "hooks/useTurboFetch.tsx", "app/javascript/hooks/useTurboFetch.tsx"
        end

        def copy_turbo_types
          copy_file "types/turbo.d.ts", "app/javascript/types/turbo.d.ts"
        end

        def copy_example_component
          copy_file "components/Hello.tsx", "app/javascript/components/Hello.tsx"
        end

        def copy_components_index
          copy_file "components/index.ts", "app/javascript/components/index.ts"
        end

        def add_yarn_dependencies
          run "bin/setup_hotwire_react.sh"
        end
      end
    end
  end
end
