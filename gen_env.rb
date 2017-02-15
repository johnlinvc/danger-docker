#!/usr/bin/env ruby
ci = ENV['CI_TYPE']
case ci
when "TRAVIS"
  keys = %W{HAS_JOSH_K_SEAL_OF_APPROVAL TRAVIS_PULL_REQUEST TRAVIS_REPO_SLUG TRAVIS_PULL_REQUEST DANGER_GITHUB_API_TOKEN}
  env = keys.map{|k| [k,ENV[k]]}.to_h
when "JENKINS"
  env = {
    JENKINS_URL: "http://localhost",
    GIT_URL: "https://github.com/johnlinvc/danger-docker",
    ghprbPullId: ENV["TRAVIS_PULL_REQUEST"],
    DANGER_GITHUB_API_TOKEN: ENV["DANGER_GITHUB_API_TOKEN"]
  }
end
env.each{|k,v| puts "#{k}=#{v}"}
