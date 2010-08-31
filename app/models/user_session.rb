class UserSession < Authlogic::Session::Base  
  
  attr_accessor :to_key
  
end