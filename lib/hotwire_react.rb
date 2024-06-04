# frozen_string_literal: true

require_relative "hotwire_react/version"
require_relative "hotwire_react/react_helper"

module HotwireReact
  class Railtie < Rails::Railtie
    initializer "hotwire_react.view_helpers" do
      ActionView::Base.send :include, ReactHelper
    end
  end
end
