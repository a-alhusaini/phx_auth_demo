"use client";

import { useState } from "react";

export default function Signup() {
  const [email, setEmail] = useState("");
  const [firstName, setFirstName] = useState("");
  const [familyName, setFamilyName] = useState("");

  return (
    <form
      onSubmit={async (e) => {
        e.preventDefault();

        let res = await fetch("/api/signup/email", {
          method: "post",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            email: email,
            first_name: firstName,
            family_name: familyName,
          }),
          credentials: "same-origin",
        });
        res = await res.text();

        console.log(res);
      }}
    >
      <label htmlFor="first_name">First name</label>
      <input
        value={firstName}
        onChange={(e) => setFirstName(e.target.value)}
        id="first_name"
        name="first name"
        type="text"
      />
      <label htmlFor="family_name">Family Name</label>
      <input
        value={familyName}
        onChange={(e) => setFamilyName(e.target.value)}
        id="family_name"
        type="text"
      />
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
