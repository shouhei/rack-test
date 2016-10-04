require "sinatra"
require "better_errors"
use BetterErrors::Middleware
BetterErrors.application_root = __dir__

get "/" do
  @message = "Hello World"
  erb :index
end
