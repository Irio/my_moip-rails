MyMoipRails
===========

Currently under active development.

[![Gem Version](https://badge.fury.io/rb/my_moip-rails.png)](http://badge.fury.io/rb/my_moip-rails)

**Bundler - Gemfile**
```ruby
gem 'my_moip-rails'
```

**Contributing**

[![Build Status](https://secure.travis-ci.org/Irio/my_moip-rails.png)](http://travis-ci.org/Irio/my_moip-rails)
[![Dependency Status](https://gemnasium.com/Irio/my_moip-rails.png)](https://gemnasium.com/Irio/my_moip-rails)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Irio/my_moip-rails)

Any patch are welcome, even removing extra white spaces.

1. Open a pull request.
2. Done.


Payment notifications (NASP)
----------------------------

Do you need to perform an action when a payment is set as done (money already in your account)?

Create a controller inherited from `MyMoipRails::PurchasesController` and set its route.

*app/controllers/purchases_controller.rb*
```ruby
class PurchasesController < MyMoipRails::PurchasesController
  def notification
    done do
      # Do whathever you want.
      # Will be useful to check params[:valor] and params[:cod_moip]
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
