MyMoipRails
===========

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
    super

    done do
      # Do whathever you want. Check params variable.
    end
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
