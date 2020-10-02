Getting Started with the Slate Skyscanner API documentation
-----------------------------------------------------------
### Production address

The docs can be found at [skyscanner.github.io/slate](https://skyscanner.github.io/slate/)

### Getting Set Up

1. Clone *this repository* to your hard drive with `git clone https://github.com/Skyscanner/slate.git`
2. Create a new branch
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# on Mac make sure you have Ruby 2.2 + Middleman installed
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up

# OR with docker
docker-compose up
```


You can now see the docs at ```http://localhost:4567```

> Please note that if you are on a MAC with MacOS Sierra you will need to insure you have Ruby 2.2+ and the latest Middleman


### Add an API endpoint to the docs

1. Create a new file in the ```includes``` folder: e.g. ```_new_api.md```

2. Write your documentation in markdown. For all markdown syntax please see the official Slate docs: [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax).

3. Add a link to your new documentation file in ```index.html.erb```

```
includes:
  - authentication
  - getting_started
  - flights_browse_quotes
  - flights_browse_routes
  - flights_browse_dates
  - flights_browse_grid
  - flights_live_prices
  - car_hire
  - <new_api>
  - localisation
  - places
  - redirects
  - referrals
  - flights_generic
  - flights_dayView
  - flights_browseView
  - flights_calendarMonthView
  - flights_multiCity
  - hotels_generic
  - hotels_dayView
  - cars_generic
  - cars_dayView
  - response_codes
search: false
---
```

### Regenerating the documentation

Every time when [referrals-api](https://github.skyscannertools.net/partnerinsights/referrals-api) project change involves schema change, API documentation has to be regenerated.
In order to do this

1. Make sure you have installed jsonschema2md: ```npm install -g @adobe/jsonschema2md```

2. Get latest master of [referrals-api](https://github.skyscannertools.net/partnerinsights/referrals-api) project next to this project

3. Run ```./generate_referral_service_docs.sh``` script in this project directory

4. Commit changes as described below

### Publishing

1. Create a merge request  

2. Merge into master

3. There's no 3 anymore. Github will automatically deploy to Github Pages from master



Contributors
--------------------

This Skyscanner documentation was built by [Sam Heyman](sam.heyman@skyscanner.net).



Official Slate README
---------------------



<p align="center">
  <img src="https://raw.githubusercontent.com/slatedocs/img/main/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://github.com/slatedocs/slate/actions?query=workflow%3ABuild+branch%3Amain"><img src="https://github.com/slatedocs/slate/workflows/Build/badge.svg?branch=main" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><img src="https://raw.githubusercontent.com/slatedocs/img/main/screenshot-slate.png" width=700 alt="Screenshot of Example Documentation created with Slate"></p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://slatedocs.github.io/slate">slatedocs.github.io/slate</a>.</em></p>

Features
------------

* **Clean, intuitive design** — With Slate, the description of your API is on the left side of your documentation, and all the code examples are on the right side. Inspired by [Stripe's](https://stripe.com/docs/api) and [PayPal's](https://developer.paypal.com/webapps/developer/docs/api/) API docs. Slate is responsive, so it looks great on tablets, phones, and even in print.

* **Everything on a single page** — Gone are the days when your users had to search through a million pages to find what they wanted. Slate puts the entire documentation on a single page. We haven't sacrificed linkability, though. As you scroll, your browser's hash will update to the nearest header, so linking to a particular point in the documentation is still natural and easy.

* **Slate is just Markdown** — When you write docs with Slate, you're just writing Markdown, which makes it simple to edit and understand. Everything is written in Markdown — even the code samples are just Markdown code blocks.

* **Write code samples in multiple languages** — If your API has bindings in multiple programming languages, you can easily put in tabs to switch between them. In your document, you'll distinguish different languages by specifying the language name at the top of each code block, just like with GitHub Flavored Markdown.

* **Out-of-the-box syntax highlighting** for [over 100 languages](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers), no configuration required.

* **Automatic, smoothly scrolling table of contents** on the far left of the page. As you scroll, it displays your current position in the document. It's fast, too. We're using Slate at TripIt to build documentation for our new API, where our table of contents has over 180 entries. We've made sure that the performance remains excellent, even for larger documents.

* **Let your users update your documentation for you** — By default, your Slate-generated documentation is hosted in a public GitHub repository. Not only does this mean you get free hosting for your docs with GitHub Pages, but it also makes it simple for other developers to make pull requests to your docs if they find typos or other problems. Of course, if you don't want to use GitHub, you're also welcome to host your docs elsewhere.

* **RTL Support** Full right-to-left layout for RTL languages such as Arabic, Persian (Farsi), Hebrew etc.

Getting started with Slate is super easy! Simply press the green "use this template" button above and follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [sample docs](https://slatedocs.github.io/slate/).

Getting Started with Slate
------------------------------

To get started with Slate, please check out the [Getting Started](https://github.com/slatedocs/slate/wiki#getting-started)
section in our [wiki](https://github.com/slatedocs/slate/wiki).

We support running Slate in three different ways:
* [Natively](https://github.com/slatedocs/slate/wiki/Using-Slate-Natively)
* [Using Vagrant](https://github.com/slatedocs/slate/wiki/Using-Slate-in-Vagrant)
* [Using Docker](https://github.com/slatedocs/slate/wiki/Using-Slate-in-Docker)

Companies Using Slate
---------------------------------

* [NASA](https://api.nasa.gov)
* [Sony](http://developers.cimediacloud.com)
* [Best Buy](https://bestbuyapis.github.io/api-documentation/)
* [Travis-CI](https://docs.travis-ci.com/api/)
* [Greenhouse](https://developers.greenhouse.io/harvest.html)
* [WooCommerce](http://woocommerce.github.io/woocommerce-rest-api-docs/)
* [Dwolla](https://docs.dwolla.com/)
* [Clearbit](https://clearbit.com/docs)
* [Coinbase](https://developers.coinbase.com/api)
* [Parrot Drones](http://developer.parrot.com/docs/bebop/)
* [Scale](https://docs.scaleapi.com/)

You can view more in [the list on the wiki](https://github.com/slatedocs/slate/wiki/Slate-in-the-Wild).

Questions? Need Help? Found a bug?
--------------------

If you've got questions about setup, deploying, special feature implementation in your fork, or just want to chat with the developer, please feel free to [start a thread in our Discussions tab](https://github.com/slatedocs/slate/discussions)!

Found a bug with upstream Slate? Go ahead and [submit an issue](https://github.com/slatedocs/slate/issues). And, of course, feel free to submit pull requests with bug fixes or changes to the `dev` branch.

Contributors
--------------------

Slate was built by [Robert Lord](https://lord.io) while at [TripIt](https://www.tripit.com/). The project is now maintained by [Matthew Peveler](https://github.com/MasterOdin) and [Mike Ralphson](https://github.com/MikeRalphson).

Thanks to the following people who have submitted major pull requests:

- [@chrissrogers](https://github.com/chrissrogers)
- [@bootstraponline](https://github.com/bootstraponline)
- [@realityking](https://github.com/realityking)
- [@cvkef](https://github.com/cvkef)

Also, thanks to [Sauce Labs](http://saucelabs.com) for sponsoring the development of the responsive styles.

Special Thanks
--------------------
- [Middleman](https://github.com/middleman/middleman)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/edgecase/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
