module TicketMaster::Provider
  module Mantis
    include TicketMaster::Provider::Base
    
    def self.new(auth = {})
      TicketMaster.new(:mantis, auth)
    end
    
    def authorize(auth = {})
      @authentication ||= TicketMaster::Authenticator.new(auth)
      
      auth = @authentication
      if auth.url.empty? or auth.username.empty? or auth.password.empty?
        raise "Please provide url, username and password"
      end
      
      $mantis = ::Mantis::Session.new auth.url, auth.username, auth.password
      
      savon = $mantis.savon_client
      savon.http.auth.ssl.verify_mode = :none
    end
    
    def raw_session
      $mantis
    end
    
    def project(*options)
      if options.first.is_a? String
        options[0] = options[0].to_i
      end
      if options.first.is_a? Fixnum
        Project.find_by_id(options.first)
      elsif options.first.is_a? Hash
        Project.find_by_attributes(options.first).first
      end
    end
        
    def projects(*options)
      Project.find(options)
    end
    
    def valid?
      self.projects.list
      true
    rescue
      false
    end
  end
end
