# frozen_string_literal: true

require_relative 'node'

class LinkedList # rubocop:disable Style/Documentation
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size(current = @head, counter = 1)
    return counter if current.next_node.nil?

    size(current.next_node, counter + 1)
  end

  def at(index, node = @head)
    return node if index.zero?

    at(index - 1, node.next_node)
  end

  def pop
    current_node = @head
    current_node = current_node.next_node until curent_node.next_node == @tail
    current_node.next_node = nil
    @tail = curent_node
  end

  def contains?(value)
    current_node = @head
    until current_node == @tail
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    current_node.value == value
  end
end

list = LinkedList.new
list.append(5)
list.append(7)
list.append(1)
