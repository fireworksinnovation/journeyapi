require 'active_resource'
class JourneyResource < ActiveResource::Base

  def self.set_username(u)
  	@@username = u
    self.user = @@username
  end
  
  def self.set_password(p)
  	@@password = p
    self.password = @@password
  end

  def self.set_environment(e)
  	@@environment = case e
  	when :testing
  		"run-testing"
  	when :staging
  		"run-staging"
  	when :production
  		"run"
  	else
  		raise "environment should be :testing, :staging or :production"
  	end
    self.site = "https://#{@@environment}.journeyapps.com/api/v1/"
  end

  self.format = :json
  self.include_root_in_json = true

end
