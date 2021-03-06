class LinkedList
  @size
  @head
  attr_reader :size

  def initialize
    return clear!
  end

  # is the linked list empty?
  def empty?
    return @size == 0
  end

  # add element e at index idx
  def add(e, idx = 0)
    raise IndexError.new if idx > @size
    raise IndexError.new if idx < 0
    n = Node.new
    n.value = e
    if idx == 0
      n.child = @head
      @head = n
    else
      current = @head
      (idx - 1).times{ |i| current = current.child }
      n.child = current.child
      current.child = n
    end
    @size += 1
    return self
  end

  # get the element at index idx
  def get(idx = 0)
    raise IndexError.new if idx >= size
    current = @head
    idx.times{ |i| current = current.child }
    return current.value
  end

  # remove the element at index idx
  def remove(idx = 0)
    raise IndexError.new if idx >= size
    raise IndexError.new if idx < 0
    if idx == 0
      @head = @head.child
    else
      current = @head
      (idx - 1).times{ |i| current = current.child }
      current.child = current.child.child
    end
    @size -= 1
    return self
  end

  def clear!
    @size = 0
    @head = nil
    return self
  end

  private

  class Node
    attr_accessor :child, :value
    @child
    @value
  end
end
