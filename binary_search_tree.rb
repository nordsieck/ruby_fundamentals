class BinarySearchTree
  @head
  @size

  attr_reader :size

  def initialize
    return clear!
  end

  # Make the tree empty
  def clear!
    @head = Node.new
    @size = 0
    return self
  end

  # Does the tree contain the element e?
  def contains?(e, node = @head)
    return false if node.value == nil
    case e <=> node.value
    when -1 then return contains?(e, node.lchild)
    when 0  then return true
    when 1  then return contains?(e, node.rchild)
    end
  end

  # Is the tree empty?
  def empty?
    return @size == 0
  end

  #add the element e to the tree.  Do nothing if e already exists in the tree.
  def add(e, node = @head)
    if node.value == nil
      node.value = e
      node.lchild = Node.new
      node.rchild = Node.new
      @size += 1
    elsif node.value > e
      add e, node.lchild
    elsif node.value < e
      add e, node.rchild
    end
    return self
  end
      
  def remove(e, node = @head)
    return nil if node.value == nil
    if node.value > e then remove e, node.lchild
    elsif node.value < e then remove e, node.rchild
    else #node.value == e
      if node.lchild.value == nil && node.rchild.value == nil
        node.value = nil
        node.rchild = nil
        node.lchild = nil
      elsif node.lchild.value == nil
        node.value = node.rchild.value
        node.lchild = node.rchild.lchild
        node.rchild = node.rchild.rchild
      elsif node.rchild.value == nil
        node.value = node.lchild.value
        node.lchild = node.lchild.lchild
        node.rchild = node.lchild.rchild
      else
        node.value = node.rchild.value
        current_node = node.rchild
        current_node = current_node.lchild while current_node.lchild.value != nil
        current_node.lchild = node.lchild
        node.rchild = node.rchild.rchild
        node.lchild = node.rchild.lchild
      end
      @size -= 1
      e
    end
  end

  class Node
    @lchild
    @rchild
    @value

    attr_accessor :lchild, :rchild, :value
  end
end
