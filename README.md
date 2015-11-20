# Greenhouse integration demo

This is a Ruby/Rails app that implements the 5 different integration options, ranging from the simplest to the most advanced integration route (which involves using the API).  The more you're looking to customize the user experience, the more you'll need to rely on our Job Board API, and the more involved the integration will be.

### Running

To run locally, clone this repo:

```
git clone https://github.com/capablemonkey/greenhouse-integration-demo.git
```

Then, install dependencies:

```
bundle install
```

Run the server:

```
rails s
```

Finally, head over to [http://localhost:3000](http://localhost:3000).

### Configuration

By default, it'll use a toy job board and sample API credentials.  If you'd like to use your own, just edit the `config.rb` file.