module TicketMaster::Provider
  module Mantis
    class Project < TicketMaster::Provider::Base::Project
      def initialize(*object)
        if object.first
          object = object.first
          unless object.is_a? Hash
            @system_data = {:client => object}
            hash = {:id => object.id.to_i, 
                    :name => object.name,
                    :description => object.description,
                    :updated_at => nil,
                    :created_at => nil}
          else
            hash = object
          end
          super(hash)
        end
      end
    
      def self.find(*options)
        if options[0].first.is_a? Array
          self.find_all.select do |project| 
            project if options.first.any? { |id| project.id == id }
          end
        elsif options[0].first.is_a? Hash
          find_by_attributes(options[0].first)
        else
          self.find_all
        end
      end

      def self.find_by_attributes(attributes = {})
        search_by_attribute(self.find_all, attributes)
      end

      def self.find_all(with_subprojects = true)
        projects = $mantis.projects.list
        array_to_projects(projects)
      end

      def self.find_by_id(id)
        self.find_all.select { |project| project.id == id }.first
      end
      
      def ticket!(*options)
        options[0].merge!(:project_id => id) if options.first.is_a?(Hash)
        provider_parent(self.class)::Ticket.create(*options)
      end

      private

      def self.array_to_projects(array)
        result = []
        array.each do |hash|
          result << Project.new(hash)
          puts hash.inspect

          if hash[:subprojects].kind_of?(Hash) and hash[:subprojects][:item].kind_of?(Array)
            result << array_to_projects(hash[:subprojects][:item])
          end
        end
        result.flatten.uniq
      end
    end
  end
end