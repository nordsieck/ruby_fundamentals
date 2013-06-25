class AVLTree
  @size
  @head
  attr_reader :size

  def initialize
    return clear!
  end

  # Is the tree empty?
  def empty?
    return @size == 0
  end

  # Make the tree empty
  def clear!
    @head = Node.new
    @size = 0
    self
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

  private

  def rotate(parent, child)
    if child.equal? parent.lchild

    elsif child.equal? parent.rchild

    end
  end

  class Node
    @lchild
    @rchild
    @value
    @height

    attr_accessor :lchild, :rchild, :value, :height
  end
end
