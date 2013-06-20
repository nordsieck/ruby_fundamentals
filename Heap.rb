class Heap
  @data

  def initialize
    @data = []
    return self
  end

  # Get the number of elements in the heap
  def size
    return @data.size
  end

  # Eliminate all of the elements from the heap
  def clear
    @data = []
    return self
  end

  # Add the element e to the Heap
  def push(e)
    idx = @data.size
    @data.push e
    percolate_up
  end

  # Get the top element from the heap
  def peek
    raise IndexError.new if @data.size == 0
    return @data[0]
  end

  # Remove and return the top element from the heap
  def pop
    raise IndexError.new if @data.size == 0
    ret = @data[0]
    @data[0] = @data[@data.size - 1]
    @data = @data.take(@data.size - 1)
    percolate_down
    return ret
  end

  # Turn an array into a heap
  def heapify(array)
    @data = array
    puts "array: " + array.to_s
    (0..(@data.size / 2 - 1)).to_a.reverse.each { |i| percolate_down i }
    return self
  end

  private

  # Ensure heap correctness when an element was inserted at the base of the heap
  def percolate_up(idx = @data.size - 1)
    return self if idx == 0
    parent = (idx - 1) / 2
    if @data[idx] < @data[parent]
      temp = @data[idx]
      @data[idx] = @data[parent]
      @data[parent] = temp
      return percolate_up(parent)
    end
    return self
  end

  # Ensure heap correctness when an element was inserted at the top of the heap
  def percolate_down(idx = 0)
    puts "idx: " + idx.to_s + ", @data: " + @data.to_s
    return self if idx > (@data.size / 2 - 1)
    child = idx * 2 + 1
    child += 1 if (child != @data.size - 1) && (@data[child] > @data[child + 1])
    if @data[idx] > @data[child]
      temp = @data[idx]
      @data[idx] = @data[child]
      @data[child] = temp
      return percolate_down(child)
    end
    return self
  end
end
