module TicketMaster::Provider
  module Mantis
    class Ticket < TicketMaster::Provider::Base::Ticket
      def initialize(*object)
        if object.first
          object = object.first
          unless object.is_a? Hash
            @system_data = { :client => object }
            hash = {
              :id => object.id.to_i, 
              :status => object.status[:name],
              :priority => object.priority[:name],
              :title => object.summary,
              :created_at => object.date_submitted,
              :updated_at => object.last_updated,
              :description => object.description
            }
          else
            hash = object
          end
          super(hash)
        end
      end

      def id
        self[:id].to_i
      end

      def updated_at
        normalize_datetime(self[:updated_at])
      end

      def created_at
        normalize_datetime(self[:created_at])
      end

      def self.find_by_id(project_id, id)
        self.new $mantis.issues.by_id(id)
      end

      def self.create(*options)
        attributes = options.first
        
        id = $mantis.issues.create({
          :summary => attributes[:title],
          :description => attributes[:description],
          :category => attributes[:category],
          :project => attributes[:project_id]
        })
        
        return nil if id.nil? or id.nil?
        return self.new(:id => id)
      end
            
      private
      
      def normalize_datetime(datetime)
        Time.mktime(datetime.year, datetime.month, datetime.day, datetime.hour, datetime.min, datetime.sec)
      end
    end
  end
end