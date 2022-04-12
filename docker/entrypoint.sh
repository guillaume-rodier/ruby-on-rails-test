#!/bin/bash

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /wakeo_test/tmp/pids/server.pid
rm -f tmp/pids/server.pid

# prepare DB if necessary
bundle exec rails db:create db:migrate db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
bundle exec rails s --binding 0.0.0.0
