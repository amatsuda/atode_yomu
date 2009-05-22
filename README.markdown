AtodeYomu
========

Installs rdoc and ri for latest versions of already installed gems only if the docs are not installed yet.

  gem atode_yomu rails

   or

  gem atode_yomu --all

  # maybe only "atode" will be enough


Recommended Usage:
------------

Put the following line to your ~/.gemrc to skip installing the docs for gem by default.

gem: --no-rdoc --no-ri

You can install these docs at any time by running this plugin command (gem atode --all).
This may save much of your time on daily gem installing and updating.


Installation:
------------

    gem sources -a http://gems.github.com
    gem install amatsuda-atode_yomu


Requirements:
------------
Use rubygems 1.3.2 or higher.



What's Atode?:
------------
"atode" means "later" in Japanese.


Akira Matsuda
