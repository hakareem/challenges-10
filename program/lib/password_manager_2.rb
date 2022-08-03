class PasswordManager2
  def initialize 
    @services = {} 
  end

def unique_password?(password) # checks if password is uniq
  !@services.any? {|service_name, service_properties| service_properties.password == password}
end

def unique_service?(service) # checks if service is uniq
  !@services.any? {|service_name, service_properties| service_properties.service == service}
end

  def add(service, password) # adds service & password
    unique_password?(password) && unique_service?(service) ?  @services[service] = ServiceManager.new(service,password) : false
  end

  def remove(service)
    @services.delete(service) # deletes a service 
  end

  def services
    return @services.keys # returns all services
  end

  def password_for(service)
    return @services[service].password # returns the password for a given service
  end

  def update(service,password) # updates service password
    unique_password?(password) ? @services[service].password = password : false
  end

  def chronological_sorting(*arg) # sorts by added on date
    output = @services.sort_by {|service, service_properties| service_properties.date}.to_h.keys
    arg.length == 1 ? output : output.reverse
  end

  def alphabetical_sorting(*args) # sorts by service name
    output = @services.sort_by {|service, service_properties| service_properties.service}.to_h.keys
    args.length == 1 ? output : output.reverse
  end

  def sort_by(*args) # calls sorting helper functions 
    args[0] == "service" ? alphabetical_sorting(*args) : chronological_sorting(*args)
  end
end

class ServiceManager # object of services 

  attr_accessor :service, :password, :date
  
  def initialize(service,password)
    @service = service
    @password = password
    @date = Time.now
  end
end
