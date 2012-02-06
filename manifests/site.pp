import "classes/*.pp"

node default {
  include common
  include webserver
  include php
}