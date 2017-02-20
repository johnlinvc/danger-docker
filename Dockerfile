FROM ruby:2.4-alpine
RUN apk update && \
    apk add git \
    python \
    g++ \
    make \
    aspell \
    aspell-en
ENV JENKINS_URL http://localhost
RUN mkdir /app
WORKDIR /app

#Python stuffs
COPY ./get-pip.py /app/
RUN python get-pip.py
RUN pip install pip-tools
COPY ./requirements.txt /app/
RUN pip-sync

#Ruby stuffs
COPY ./Gemfile.docker /app/Gemfile
COPY ./Gemfile.lock /app/
RUN bundle install

CMD ["bundle", "exec", "danger"]
