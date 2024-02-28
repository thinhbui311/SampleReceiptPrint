require "csv"

class Csv::Export
  attr_reader :raw_data, :attributes, :header

  def initialize raw_data, headers, attributes
    @raw_data = raw_data
    @header = headers
    @attributes = attributes
  end

  def process
    CSV.generate do |csv|
      csv << header

      raw_data.each do |data|
        csv << attributes.map{ |attr| data.public_send(attr) }
      end
    end
  end
end
