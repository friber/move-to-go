
module FruitToLime
    class Deal
        include SerializeHelper, ModelHasCustomFields, ModelHasTags

        attr_accessor :id, :integration_id, :name, :description, :probability, :value, :order_date, :offer_date, :customer,
        :responsible_coworker, :customer_contact

        attr_reader :custom_fields

        def serialize_variables
            [ :id, :integration_id, :name, :description, :probability, :value, :offer_date, :order_date ].map {
                |p| {
                    :id => p,
                    :type => :string
                }
            } +
                [
                 { :id => :customer, :type => :organization_reference },
                 { :id => :responsible_coworker, :type => :coworker_reference },
                 { :id => :customer_contact, :type => :person_reference },
                 { :id => :custom_fields, :type => :custom_fields },
                 { :id => :tags, :type => :tags },
                 { :id => :status, :type => :deal_status }
                ]
        end

        def serialize_name
            "Deal"
        end

        def initialize()
        end

        def to_s
            return "deal[id=#{@id}, integration_id=#{@integration_id}]"
        end

        def validate
            error = String.new

            if @name.nil? || @name.empty?
                error = "A name is required for deal.\n#{serialize()}"
            end

            return error
        end

    end
end