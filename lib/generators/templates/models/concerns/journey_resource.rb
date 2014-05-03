class JourneyResource < ActiveResource::Base

  def self.set_username(u)
  	@@username = u
  end
  
  def self.set_password(p)
  	@@password = p
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

  end

  self.format = :json
  self.include_root_in_json = true
  self.site = "https://run-testing.journeyapps.com/api/v1/_datamodel.json"
  self.user = @@username
  self.password = @@password
end
