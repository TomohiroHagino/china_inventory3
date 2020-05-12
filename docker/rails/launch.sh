# プロジェクト作成時
# rails new . --force --no-deps --database=postgresqlのコメントアウトを外して対応する。
# scripts/launch.sh
bundle install
yarn install
# rails new . --force --no-deps --database=postgresql
bundle exec puma -C config/puma.rb