# frozen_string_literal: true

require_relative "turbo_react/version"
require_relative "turbo_react/react_helper"

module TurboReact
  class Railtie < Rails::Railtie
    initializer "turbo_react.view_helpers" do
      ActionView::Base.send :include, ReactHelper
    end
  end
end
