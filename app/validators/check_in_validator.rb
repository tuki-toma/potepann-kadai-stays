class CheckInValidator < ActiveModel::EachValidator
    def validate_each(record,attribute,value)
        if value.present? && value < Date.current
            record.errors.add(attribute, "今日以降の日付を入力してください")
        end
    end
end