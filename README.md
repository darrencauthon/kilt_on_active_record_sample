## Kilt on Active Record???

Seems to work fine.  The magic is here:

1.  The definition of a table that can store data. "Things" is the same as "Objects".

https://github.com/darrencauthon/kilt_on_active_record_sample/blob/68387532906096c91ed3faaf1794fb4ce33cfcbf/db/migrate/20140320041243_create_things.rb

2.  The "thing" model.  Note that data is serialized as a hash.

https://github.com/darrencauthon/kilt_on_active_record_sample/blob/68387532906096c91ed3faaf1794fb4ce33cfcbf/app/models/thing.rb

3. Here's a monkey patch on the database object, replacing the interactions with equivalent operations on Thing.

https://github.com/darrencauthon/kilt_on_active_record_sample/blob/68387532906096c91ed3faaf1794fb4ce33cfcbf/config/initializers/kilt.rb#L3
