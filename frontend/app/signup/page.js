"use client";

import { useState } from "react";

export default function Signup() {
  const [email, setEmail] = useState("");

  return (
    <form
      onSubmit={async (e) => {
        e.preventDefault();

        let res = await fetch("/api/signup/email", {
          method: "post",
          body: JSON.stringify({ email: email }),
          credentials: "same-origin",
        });
        res = await res.text();

        console.log(res);
      }}
    >
      <label htmlFor="email">Enter email address</label>
      <input
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        type="email"
        name="email"
        id="email"
      />
      <input type="submit" value="submit!" />
    </form>
  );
}
