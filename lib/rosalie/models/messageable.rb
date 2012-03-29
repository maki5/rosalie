module Rosalie
  module Models
    module Messageable
      def self.included(mod)
        mod.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_messageable
          has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
          has_many :received_messages, :class_name => "Message", :foreign_key => "recipient_id"

          include Rosalie::Models::Messageable::InstanceMethods
        end

        def has_user
          belongs_to :author, :class_name => "User"
          belongs_to :recepient, :class_name => "User"
        end
      end

      module InstanceMethods
        def send_message(users, subject, body)
          users.each do |p|
            Message.create(:author => self, :recipient => p, :subject => subject, :body => body)
          end
        end
      end

    end
  end
end
