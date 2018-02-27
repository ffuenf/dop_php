<a href="http://www.ffuenf.de" title="ffuenf - code • design • e-commerce"><img src="https://github.com/ffuenf/Ffuenf_Common/blob/master/skin/adminhtml/default/default/ffuenf/ffuenf.png" alt="ffuenf - code • design • e-commerce" /></a>

dop_php
========
[![GitHub tag](https://img.shields.io/github/tag/ffuenf/dop_php.svg)](https://github.com/ffuenf/dop_php)
[![Build Status](https://img.shields.io/travis/ffuenf/chef-automysqlbackup.svg)](https://travis-ci.org/ffuenf/dop_php)
[![PayPal Donate](https://img.shields.io/badge/paypal-donate-blue.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=J2PQS2WLT2Y8W&item_name=Chef%3a%20dop_php&item_number=dop_php&currency_code=EUR)

dop_php installs php and supports several modules in sub-recipes.
opposed to the [php community cookbook](https://github.com/opscode-cookbooks/php), it supports fpm, composer out-of-the-box


Dependencies
------------

This cookbook depends on the following community cookbooks.

* apt
* git
* php
* build-essential
* dotdeb
* composer
* [redisio](https://github.com/brianbianco/redisio)

Platform
--------

The following platforms are supported and tested:

* Debian 8.x
* Debian 9.x
* Ubuntu 14.04.x
* Ubuntu 16.04.x

Other Debian family distributions are assumed to work.

Development
-----------
1. Fork the repository from GitHub.
2. Clone your fork to your local machine:

        $ git clone git@github.com:USER/dop_php.git

3. Create a git branch

        $ git checkout -b my_bug_fix

4. **Write tests**
5. Make your changes/patches/fixes, committing appropriately
6. Run the tests: `rake style`, `rake spec`, `rake integration:vagrant`
7. Push your changes to GitHub
8. Open a Pull Request

Testing
-------

The following Rake tasks are provided for automated testing of the cookbook:

```
$ rake -T
rake integration:cloud    # Run Test Kitchen with cloud plugins
rake integration:vagrant  # Run Test Kitchen with Vagrant
rake spec                 # Run ChefSpec examples
rake style                # Run all style checks
rake style:chef           # Lint Chef cookbooks
rake style:ruby           # Run Ruby style checks
rake travis               # Run all tests on Travis
```
See TESTING.md for detailed information.

License and Author
------------------

- Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)

- Copyright:: 2018, ffuenf

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
