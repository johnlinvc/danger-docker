#!/usr/bin/env ruby
ci = ENV['CI_TYPE']
case ci
when "TRAVIS"
  keys = %W{HAS_JOSH_K_SEAL_OF_APPROVAL TRAVIS_REPO_SLUG TRAVIS_PULL_REQUEST}
  env = keys.map{|k| [k,ENV[k]]}.to_h
when "JENKINS"
  pr_id = ENV["TRAVIS_PULL_REQUEST"].to_i > 0 ? ENV["TRAVIS_PULL_REQUEST"] : ""
  env = {
    JENKINS_URL: "http://localhost",
    GIT_URL: "https://github.com/johnlinvc/danger-docker",
    ghprbPullId: pr_id
  }
end

env[:DANGER_GITHUB_API_TOKEN]=ENV["DANGER_GITHUB_API_TOKEN"]
env.each{|k,v| puts "#{k}=#{v}"}
