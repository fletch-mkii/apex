## Synopsis

Apex allows a user to locate the star at their zenith from any point on Earth.
This is accomplished by acquiring a coordinate location from their IP address
by utilizing the Ruby Geocoder gem.

## Motivation

The goal of this project is the simply to inspire interest in astronomy.  Hopefully
visitors to the site will find the information available to them interesting, and
will lead them to doing some of their own research beyond what Apex can provide.

## API Reference

The astronomical information for this applciation is gathered using NASA's
Exoplanets API (http://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html)
For this project only data from the exoplanets table was used, although this
might be expanded to include other tables in the future.

## Installation

Before running this applcation, make sure to have the bundler gem installed, and
then run `bundle install` to make sure all the dependencies from the gemfile are
installed.

Setting up the database is the only other important prerequisite to running the
application, and can be done by issuing the following set of rake commands:

`rake db:create`
`rake db:migrate`
`rake db:seed`
OR, in one command:
`rake db:reset`

The seed (or reset) command will take some time and require an internet connection,
as the seeder file is where a request to NASA's API is made in order to populate
the database with the relevant information.

## Caveats

The Geocoder gem does not acquire an IP address outside of production that will
retrieve coordinates other than 0 degrees latitude and 0 degrees longitude.  In
order to ensure locations are correctly selected via this gem, IP addresses will
have to be entered manually in development/test, or double checked after being
pushed to a production environment.
