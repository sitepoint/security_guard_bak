# SecurityGuard

This gem is a collection of useful tools for auditing data and performing security checks.

## Installation

Add this line to your application's Gemfile:

    gem 'security_guard'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install security_guard

## Usage

### Executable

There is an `sguard` command if you intend to use security_guard as a command line tool. Please refer to the help option for its usage.

    sguard -h

### Country IPs

Returns a list of the IPs from given country and IP dictionaries. Useful for auditing IPs from higher risk nations.

```ruby
country_ips = SecurityGuard::CountryIps.new
country_ips.countries = ['Australia', 'United States']
country_ips.ips = ['4.4.4.4', '8.8.8.8', '203.206.0.1']
country_ips.result # => ['203.206.0.1']
```

You may also pass country and IP data as a line-delimited file by appending `_from_file` at the end of the attributes:

```ruby
country_ips.countries_from_file = '/path/to/the/file'
country_ips.ips_from_file = '/path/to/the/file'
```

## Contributing

1. Fork it
2. Make sure you add documentation to README.md
3. Make sure you test all your code
4. Do your magic!
5. Create a new Pull Request

## Author

- [Fred Wu](http://fredwu.me/)

Brought to you by [SitePoint](http://www.sitepoint.com/).
