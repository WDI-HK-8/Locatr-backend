# This file is used by Rack-based servers to start the application.

require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins '*'
    resource '*',
             :headers => :any,
             :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
             :methods => [:get, :post, :delete, :put, :options]
  end
end