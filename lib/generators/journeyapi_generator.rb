class JourneyapiGenerator < Rails::Generators::NamedBase
  argument :username
  argument :password
  source_root File.expand_path('../templates', __FILE__)

  def generate_objects
    template "models/concerns/journey_resource.rb", "app/models/concerns/journey_resource.rb"
    schema['objects'].each do |k, v|
      @object_name = v['name']
      @attributes = v['attributes'].values
      template "models/journey/journey_class.rb.erb", "app/models/#{file_name}.rb"
    end
  end

  private
  def env
    'run-testing'
  end

  def schema
    uri = URI.parse("https://#{env}.journeyapps.com/api/v1/_datamodel.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    request.basic_auth(username, password)
    response = http.request(request)
    JSON.parse(response.body)
  end

  def class_name
    @object_name.camelize
  end

  def file_name
    @object_name
  end

  def attributes
    @attributes
  end
end