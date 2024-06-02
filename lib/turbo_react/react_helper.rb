module TurboReact
  module ReactHelper
    def component(name, props = {})
      content_tag(:div, nil, data: { controller: 'react', react_component_value: name, react_props_value: props.to_json })
    end
  end
end