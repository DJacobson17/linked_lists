# frozen_string_literal: true

require_relative 'node'

class LinkedList # rubocop:disable Style/Documentation
  attr_accessor :head, :tail

  def initialize
    @head = nil
  end

  def append(value, tail = @tail)
    new_node = Node.new(value, nil)
    tail.next_node = new_node unless tail.nil?
    @tail = new_node
    @head ||= new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
    @tail ||= new_node
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
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    until current_node == @tail
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    current_node.value == value
  end

  def find(value, current_node = @head, index = 0)
    until current_node == @tail
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s(current_node = @head, string = '')
    until current_node == nil
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    "#{string} nil"
  end

  def insert_at(value, index, current_node = @head, current_index = 1)
    if index.zero?
      prepend(value)
    else
      until current_index == index
        current_node = current_node.next_node
        current_index += 1
      end
      new_node = Node.new(value, current_node.next_node)
      current_node.next_node = new_node
    end
  end

end

list = LinkedList.new
list.append(5)
list.prepend(7)
list.prepend(9)
list.append(23)
list.insert_at(20, 2)
puts list.to_s
