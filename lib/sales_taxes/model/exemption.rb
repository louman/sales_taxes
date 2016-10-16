require 'yaml'

class Exemption
  CONFIG = YAML.load_file('config.yml')

  def initialize(item)
    @item = item
  end

  def included?
    CONFIG['exemptions'].map { |key, value| value.select {|exemption| @item.description.include?(exemption) } }.reject!(&:empty?).any?
  end

end