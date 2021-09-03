FROM elixir:1.12

RUN apt-get update && \
    apt-get install -y inotify-tools

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

RUN mix local.hex --force && \
    mix archive.install hex phx_new 1.6.0-rc.0 --force && \
    mix local.rebar --force
    
WORKDIR /app

CMD ["mix", "phx.server"]
