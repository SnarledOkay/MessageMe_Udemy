module ApplicationHelper
    def flash_class(type)
        case type
        when 'notice' then 'alert-success'
        when 'alert' then 'alert-danger'
        else 'alert-secondary'
        end
    end
end
