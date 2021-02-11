FROM ruby:2.7
# このDockerfileのメタデータを記述
# MAINTAINERはdeprecateになった
LABEL maintainer="Tomohiro Hagino <marspeoplehg@gmail.com>"|

# fishのフォントのインストール
# RUN git clone https://github.com/powerline/fonts.git && \
#    fonts/install.sh && \
#    chmod -R 777 ~/.local/share/fonts

# Warning: apt-key output should not be parsed (stdout is not a terminal)とか出る対策
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# webpackerに必要なyarnのダウンロード
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# 必要なパッケージのインストール,myappにファイルコピー
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn vim
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY . /myapp

COPY launch.sh /usr/bin/
RUN chmod +x /usr/bin/launch.sh

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Bundlerの設定
# 失敗したネットワーク要求を再試行する回数。デフォルトは3
# bundlerが並行してインストールできるgemの数。デフォルトは1
RUN bundle config --global retry 5 \
  && bundle config --global jobs 4
# bundle config --global path vendor/bundle

# 文字コードの設定
# 日本語を受け付けるように設定(rails consoleで日本語を使うなど) => LANG=C.UTF-8
# 設定したロケールの値をC.UTF-8で上書きする => LC_ALL=C.UTF-8
# 文字コードのカテゴリをutf-8に設定 => LC_CTYPE="utf-8"
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LC_CTYPE="utf-8"

# 使用するエディタ
ENV EDITOR vim

# nginxでpuma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/public

# タイムゾーン
ENV TZ="Asia/Tokyo"

# fishのインストール,テーマbobthefish
# RUN apt-get update --quiet && \
#    apt-get install --quiet --yes software-properties-common && \
#    add-apt-repository --yes ppa:fish-shell/release-3 && \
#    apt-get install --quiet --yes fish && \
#    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher && \
#    fish -c "fisher add oh-my-fish/theme-bobthefish" && \
#    apt-get install -y fonts-powerline

# SHELL ["fish", "--command"]
# RUN chsh -s /usr/bin/fish
# ENV SHELL /usr/bin/fish

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]

# CMD ["entrypoint.sh"]
# EXPOSE 3000
