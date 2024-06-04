import React from "react";

type HelloProps = {
  name: String
}

const Hello = ({ name }: HelloProps) => {
  if (name === undefined) {
    return (
      <h1>Hello from HotwireReact!</h1>
    )
  }
  
  return (
    <h1>Hello, { name }!</h1>
  )
}

export default Hello