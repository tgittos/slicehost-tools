Slicehost Tools
===============

A series of tools to help with administering a Slicehost instance.

Before you start
----------------

You need to create a config.rb file containing the following globals:

- SLICE_PUBLIC_IP: the public IP of your slice (for DNS configuration)
- SITE_URL: the Slicehost api url, with your api key and everything

And you also need to move the "base" file into your sites-available folder for your chosen web server

Dependencies
------------

- nginx (although it could be modified to run with any HTTP server)

Note
----

These tools are really for my personal use - I've put them up incase I have to nuke my slice.
