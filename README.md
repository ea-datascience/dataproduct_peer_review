dataproduct_peer_review
=======================

This is the peer reviewed project for the data product course in coursera

## Installation instructions

In order to install this application you need to install shiny in your server:

install.package("shiny")

You also will need to install d3network, for the proper visualization of the graphs. For this, you'll have to need the devtools:

install.packages("devtools")

Once this is done, you can proceed with:

install_github('christophergandrud/d3Network')

This is going to install d3Network.

Additionally you will need to install the igraph library, in case you don't have it in your system.

install.packages("igraph")

Now you are ready to run this Shiny application :)
