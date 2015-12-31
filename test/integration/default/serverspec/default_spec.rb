# Encoding: utf-8
require 'serverspec'

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end

case os[:family]
when 'windows'
  describe command('p4.exe') do
    its(:stderr) { should match(/flash client/) }
  end
else # linux
  describe command('p4') do
    its(:stderr) { should match(/flash client/) }
  end
end
