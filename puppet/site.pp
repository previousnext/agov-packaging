# The default node definition.

node default {

  ##
  # Hiera.
  #   Implement all the hiera things!
  ##

  # Base classes.
  hiera_include("classes")

  ##
  # Misc.
  ##

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

}
