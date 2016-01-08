# Sucks-Rocks (2015 Edition)
This is my attempt to go over Gary Bernhardt's "Sucks Rocks" series in the year 2015. There are a few differences to be noted, mostly with RSpec syntax and RBing being a turd

## bing integration
I ended up having to use the `bing-search` gem instead of `rbing`, though
thankfully the API was very simple to wrap

# TODO
Still trying to figure out how to have my isolated tests that mock CachedScore
run OK while having my tests on the real CachedScore run against AR/the database

.... for some reason this is really hard right now
