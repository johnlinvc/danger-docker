FROM ruby:2.4-alpine
RUN apk update && \
    apk add git
ENV JENKINS_URL http://localhost
RUN mkdir /app
WORKDIR /app
COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
RUN bundle install
CMD ["bundle", "exec", "danger"]
