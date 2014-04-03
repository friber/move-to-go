module FruitToLime
    module ModelHasCustomFields
        def set_custom_value(value)
            @custom_values = [] if @custom_values==nil
            custom_value = CustomValue.new()
            custom_value.value = value
            @custom_values.push custom_value
            return custom_value 
        end
        def set_custom_field(obj)
            value = obj[:value]
            custom_field_reference = CustomFieldReference.new(obj)
            set_custom_value(value).field = custom_field_reference
            return custom_field_reference
        end
    end

    module ModelHasTags
        def add_tag(str)
            @tags = [] if @tags == nil
            @tags.push(Tag.new(str))
        end
    end
end
