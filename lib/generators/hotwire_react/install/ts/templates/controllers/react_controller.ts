import { Controller } from "@hotwired/stimulus";
import React from "react";
import ReactDOM from "react-dom/client";
import components from "../components";

// Connects to data-controller="react"
export default class extends Controller {
  static values = {
    component: String,
    props: Object
  }

  declare componentValue: string;
  declare propsValue: Object;

  connect() {
    const componentName = this.componentValue;
    const root = ReactDOM.createRoot(this.element);

    const component = components[componentName];
    if (component) {
      root.render(React.createElement(component, this.propsValue, null));
    } else {
      console.error(`Component ${componentName} not found`)
    }
  }
}
