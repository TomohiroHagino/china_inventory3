#現状では使用しなくなったが、一応とっておく。
#!/bin/bash
set -e

bundle install
yarn install

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

mkdir -p tmp/pids
mkdir -p tmp/sockets

# bundle exec puma -C config/puma.rb

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
