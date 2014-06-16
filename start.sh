#!/bin/bash
#http://54.72.73.47/
#http://www.skuola42.tk/
kill `cat tmp/pids/server.pid`
rails s -p80&
