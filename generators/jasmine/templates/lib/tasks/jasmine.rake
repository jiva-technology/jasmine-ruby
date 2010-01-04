namespace :jasmine do
  require 'jasmine'

  desc "Run continuous integration tests"
  require "spec"
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:ci) do |t|
    t.spec_opts = ["--color", "--format", "specdoc"]
    t.verbose = true
    t.spec_files = ['spec/javascripts/support/jasmine_rails_spec.rb']
  end
    task :server do
      require 'spec/javascripts/support/jasmine_rails_config'
      
      puts "your tests are here:"
      puts "  http://localhost:8888/run.html"

      JasmineRailsConfig.new.start_server
    end

end

desc "Run specs via server"
task :jasmine => ['jasmine:server']
