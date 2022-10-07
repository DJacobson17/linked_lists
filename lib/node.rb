# frozen_string_literal: true

class Node # rubocop:disable Style/Documentation
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end