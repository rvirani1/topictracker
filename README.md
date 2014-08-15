Any of them should have user accounts:
* Have a name and email
* Should be able to log in
  * Easier: assume users are trustworthy
  * Better: look at something like Devise

### Topic Tracker

This should allow people to post topics that they are interested in, and vote for ones that they are interested in.

* Topics
  * Have a title and description
  * Can be created by any logged in user, can only be edited by the poster
  * Users can :+1: topics they are interested in
  * Bonus: support markdown formatting in the description
* Search
  * Can find topics by: most upvoted, by a string in descriptions
* Going further
  * Allow users to comment on topics
  * Support login with github / facebook / etc.
  * Topics have categories / tags that can be used for filtering / searching