MyMoipRails
===========

Contributing to MyMoipRails
----------------------

[![Build Status](https://secure.travis-ci.org/Irio/my_moip-rails.png)](http://travis-ci.org/Irio/my_moip-rails)
[![Dependency Status](https://gemnasium.com/Irio/my_moip-rails.png)](https://gemnasium.com/Irio/my_moip-rails)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Irio/my_moip-rails)

Any patch are welcome, even removing extra blank spaces.

1. Open a pull request.
2. Done.

Using
-----

Currently under active development.

**Bundler - Gemfile**
```ruby
gem 'my_moip-rails'
```

**Payment notifications (NASP)**

Do you need to perform a action when a payment is set as done (money already in your account)?

*app/controllers/purchases_controller.rb*
```ruby
class PurchasesController < MyMoipRails::PurchasesController
  def notification
    done do
      # Do whathever you want. Check params variable.
    end

    super
  end
end
```

*config/routes.rb*
```ruby
post 'purchases/notification'
```

License
-------

This project rocks and uses MIT-LICENSE.
