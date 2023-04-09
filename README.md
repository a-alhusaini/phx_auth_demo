# Phoenix auth done from scratch

Simple auth implementation I did with phoenix. The requirements are:

- No phoenix generators (except for migrations)
- No built in auth generator
- No auth libraries

# Why?

I decided to brush up my auth skills. Let's face it. You're not going to learn things just by reading OWASP - which you should - You'll only learn if you try things out in practice.

It was also an excuse to play around with PlugS

# Conclusion

I couldn't create all the features I wanted. This was taking too long. I stopped when it became obvious more features won't refine my auth skills more.

## What I did

- Built Sign in with email. The app creates a record in the db with a magic_link token. That token is encrypted then sent to the user via email. When the user clicks the link the app decodes the message with Phoenix.Token and checks if the token is in the magic_links table. If any of this doesn't work. Trigger a 403.
- Experimented with Next.js 13's new `/app` directory

## What I got wrong: Lessons learned

- I outran my headlights. I was thinking about csrf attacks before I had login setup! This is sheer insanity but we're all guilty of doing it every now and then. _Don't fall into this trap_
- Encrypting the token for the magic link adds unneeded complexity that shouldn't be there. The main attack against magic link auth is that attackers can steal the token. Encryption doesn't help in that scenario.
- A new philosophy of testing: tests can drive development. Only when you know the requirements. I was the boss. That means the requirements were switching faster than an AC current. Tests are great milestones but you can't write the tests first. It doesn't make sense. It is hard to write tests when I don't know what my code will even look like. And doing it only gave me a headache. I keep giving TDD chances to to redeem itself. But so far it has failed - again - I'll give it another go in a few months.

## How to run the project

This is a phoenix app. Follow the usual steps. To start the frontend go to the `frontend` directory and run `npm i && npm run dev`.
