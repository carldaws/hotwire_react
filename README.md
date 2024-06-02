# TurboReact

TurboReact is a Ruby gem that seamlessly integrates React into Rails 7 projects using esbuild. 

It allows you to create React components in the app/javascript/components directory and include them in your Rails views with a <%= component "ComponentName" %> helper. 

This gem is designed to work alongside Hotwire/Turbo, providing a useTurboFetch hook to allow React components to send JSON to Rails controllers and receive back and render TurboStreams.

## Features

- **Easy Integration**: Add React components to your Rails views effortlessly.
- **Hotwire/Turbo Compatibility**: Use the useTurboFetch hook for seamless integration with TurboStreams.
- **JavaScript and TypeScript Support**: Write your components in either JavaScript or TypeScript.
- **Automatic Setup**: Installs react and react-dom (and types and TypeScript, if using) and sets up your project with necessary files.


## Installation

Create a new Rails 7 project using esbuild:

```
rails new my_app -j esbuild
```

Add this line to your application's Gemfile:

```
gem 'turbo_react'
```

And then execute:

```
bundle install
```

Next, run the install generator:

```
rails generate turbo_react:install:js # for JavaScript
rails generate turbo_react:install:ts # for TypeScript
```

This will install the necessary JavaScript dependencies and copy the required files into your app/javascript directory.

## Usage

### Creating React Components

Create a React component in app/javascript/components, an example component is already created for you:

```tsx
import React from "react";

type HelloProps = {
  name: String
}

const Hello = ({ name }: HelloProps) => {
  if (name === undefined) {
    return (
      <h1>Hello from TurboReact!</h1>
    )
  }
  
  return (
    <h1>Hello, { name }!</h1>
  )
}

export default Hello
```

Make sure you add this component to the components/index.ts:

```ts
import Hello from "./Hello";

interface Components {
  [key: string]: ({}: any) => React.JSX.Element;
}

const components: Components = {
  Hello,
  // Add other components here
};

export default components;
```

### Including Components in Rails Views

Now you can use the component in a Rails view:

```rb
<%= component "Hello" %>
```

### Components with Props

You can pass props (if required by your components) as follows:

```rb
<%= component "Hello", { name: @name } %>
```

### The useTurboFetch hook

With the useTurboFetch hook you can continue to use TurboStreams to update page content as you would in a standard Rails application. Create a React form that uses the hook like so:

```tsx
import React, { useState, FormEvent, ChangeEvent } from "react";
import useTurboFetch from "../hooks/useTurboFetch";

const MessageForm = () => {
  const [content, setContent] = useState('');
  const { turboFetch } = useTurboFetch();

  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    turboFetch(event.currentTarget.action, "POST", { message: { content } });
    setContent('');
  }

  const handleMessageChange = (event: ChangeEvent<HTMLInputElement>) => {
    setContent(event.target.value);
  }

  return (
    <form action="/messages" onSubmit={handleSubmit}>
      <input type="text" value={content} onChange={handleMessageChange}/>
      <button type="submit">Submit</button>
    </form>
  )
}

export default MessageForm
```

Here turboFetch replaces the standard fetch call.

## Configuration

By default, TurboReact will automatically configure your Rails application. If you need to customize the setup, you can modify the generated files in the app/javascript directory.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/carldaws/turbo_react.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
