import React, { useState, useEffect } from "react";
import { Turbo } from "@hotwired/turbo-rails";

const useTurboFetch = () => {
  const [token, setToken] = useState<string | null | undefined>(null);

  useEffect(() => {
    const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');
    setToken(csrfToken);
  }, []);

  const turboFetch = async (url: string, method: "GET" | "POST" | "PUT" | "PATCH" | "DELETE", body: Object) => {
    if (!token) {
      console.error("CSRF token is not set");
      return;
    }

    try {
      const response = await fetch(url, {
        method: method,
        headers: {
          Accept: "text/vnd.turbo-stream.html",
          "X-CSRF-Token": token,
          "Content-Type": "application/json"
        },
        body: JSON.stringify(body)
      });

      if (!response.ok) {
        throw new Error("Network response failed");
      }

      const responseText = await response.text();
      Turbo.renderStreamMessage(responseText);
    } catch (error) {
      if (error instanceof Error) {
        console.log(error.message);
      } else {
        console.log("An unknown error occurred");
      }
    }
  };

  return { turboFetch };
}

export default useTurboFetch;
