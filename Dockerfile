FROM ruby:2.4-alpine
RUN apk update && \
    apk add git \
    python \
    g++ \
    make \
    aspell \
    aspell-en
ENV JENKINS_URL http://localhost
WORKDIR /app

#Python stuffs
COPY ./get-pip.py /app/
RUN python get-pip.py
COPY ./requirements.txt /app/
RUN pip install -r requirements.txt

#Ruby stuffs
COPY ./Gemfile.docker /app/Gemfile
COPY ./Gemfile.lock /app/
RUN bundle install

CMD ["bundle", "exec", "danger"]
