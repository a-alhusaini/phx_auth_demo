# The hand written phoenix auth demo

This is a simple auth implementation I did with phoenix. It needed a few constraints which are

- No phoenix generators (except for migrations)
- No built in auth generator
- No auth libraries

# Why?

I needed to brush up my aush skills. Let's face it. You're not going to learn things just by reading about them on the OWASP website (by the way you should read the official OWASP website when you can). You'll only learn if you try things out in practice.

It was also an excuse to spend some time learning how Plug works.

# Conclusion

I wasn't able to create all the features I wanted since this was taking too long. I decided to stop when it became obvious that I won't actually refresh my skills by further implementation.

## What I did

- Added auth by cookie.
- Sign in via email. The system would create a record in the db with a magic_link token. That token would then be encrypted and sent to the user through his email. Then when the user clicks the link the system would decode the message using Phoenix.Token and check if the token is in the magic_links table. If so, it adds the user email to the session cookie. If not, you get a 403.
- Tests!!!
- Started working on a frontend with Next.js 13 and got to play with the new `/app` directory

## What I got wrong and lessons learned

- I got bogged down by the details. I was looking at ways to prevent csrf attacks from happenning before I had login implemented! This is sheer insanity but I still somehow find myself doing this from time to time... _Don't fall into this trap_
- Encrypted the magic link token. Encrypting the token for the magic link adds a layer of unnecessary complexity to the project that shouldn't be there. The main attack vector for magic link sign up is that the link could get stolen. If the token is encrypted that does not help to defend against that.
- A new philosophy of testing: It is true that tests can drive development but that is only true when you understand the requirements. Because I was the boss here the requirements were changing on a moment to moment basis. I used tests as milestones but did not write the tests first because I'm still convinced that does not make sense... It is hard to write tests when you don't know what your code will even look like. And attempting it only gave me a headache. I've given TDD lots of chances to persuade me that it is a good idea. But so far it has failed every time. I'll probably give it another go in a few months.

## How do I run this?

This is a standard phoenix app. FOllow the usual steps. For the fronend. Go to the `frontend` directory and run `npm i && npm run dev`. Now, your version is up and running.
