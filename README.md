# ParsingArticles

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/parsing_articles`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parsing_articles'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parsing_articles

## Usage
	Firstly you should configurate you facebook settings(if you want to get news from facebook pages). You should set your APP_ID and APP_KEY(you can find them on https://developers.facebook.com/)
		TO Do that you should code:
			ParsingArticles::GetArticles.config_facebook(APP_ID, APP_KEY)

	Next You can use it to parse artcles from facebook:
		@articles_facebook = ParsingArticles::Parse.new(url).get_array
	The last command returns array with articles

	Of course you can simply use either .Facebook class or .Rss class

	



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/parsing_articles.
