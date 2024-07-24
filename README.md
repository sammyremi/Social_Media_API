##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.2.2](https://github.com/sammyremi/Social_Media_API)
- Rails [7.1.3]
- Postgresql [14]

##### 1. Check out the repository

```bash
git clone https://github.com/sammyremi/Social_Media_API.git
```

##### 2. Create database.yml file

open database.yml file and edit the database configuration as required.
configure as required for your postgresql database.

```bash
    config/database.yml

    username:
    password:
    host:

```


##### 3. Create and setup the database

Run the following commands to create and setup the database and migration.

```ruby
rails credentials:edit
bundle install
rails db:create
rails db:migrate
rails db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000