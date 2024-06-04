import Hello from "./Hello";

interface Components {
  [key: string]: ({}: any) => React.JSX.Element;
}

const components: Components = {
  Hello,
  // Add other components here
};

export default components;
