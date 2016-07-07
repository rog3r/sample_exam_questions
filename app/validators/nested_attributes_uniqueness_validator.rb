class NestedAttributesUniquenessValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.map(&options[:field]).collect{|v| v.to_s.strip}.uniq.size == value.size
      # record.errors[attribute] << (options[:message] || 'must be unique')
      duplicates = value - Hash[value.map{|obj| [obj[options[:field]].to_s.strip, obj]}].values

      # marca os itens duplicados no form
      duplicates.each { |obj| obj.errors[options[:field]] << I18n.t('errors.messages.taken') }
      # injeta as mensagens de erro do nested no objeto pai sem duplicidades
      duplicates.uniq{|x| x.try(options[:field])}.each { |obj| record.errors[attribute] <<  "(#{options[:field]}): #{obj.try(options[:field])} #{I18n.t('errors.messages.taken')}" }

    end

  end

end