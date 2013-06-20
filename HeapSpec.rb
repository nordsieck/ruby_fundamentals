require 'Heap'

describe Heap, "#size" do
  it "returns the number of elements in the heap" do
    heap = Heap.new
    5.times { heap.push 'a' }
    heap.size.should eq(5)
  end
end

describe Heap, "#clear" do
  it "empties the heap of elements" do
    heap = Heap.new
    5.times { heap.push 'a' }
    heap.size.should eq(5)
    heap.clear
    heap.size.should eq(0)
    expect { heap.peek }.to raise_exception(IndexError)
  end
end

describe Heap, "#push" do
  it "adds an element to the heap" do
    heap = Heap.new
    heap.size.should eq(0)
    heap.push 'b'
    heap.size.should eq(1)
    heap.peek.should eq('b')
    heap.push 'a'
    heap.size.should eq(2)
    heap.peek.should eq('a')
    heap.push 'c'
    heap.size.should eq(3)
    heap.peek.should eq('a')
  end
end

describe Heap, "#peek" do
  it "returns the element at the top of the heap" do
    heap = Heap.new
    expect { heap.peek }.to raise_exception(IndexError)
    ('a'..'e').to_a.reverse.each { |c| heap.push c }
    heap.peek.should eq('a')
    heap.clear
    ('a'..'e').to_a.each { |c| heap.push c }
    heap.peek.should eq('a')
  end
end

describe Heap, "#pop" do
  it "removes and returns the elemnt at the top of the heap" do
    heap = Heap.new
    expect { heap.pop }.to raise_exception(IndexError)
    ('a'..'e').each { |c| heap.push c }
    ('a'..'e').each { |c| heap.pop.should eq(c) }
  end
end

describe Heap, "#heapify" do
  it "turns the passed in array into a heap" do
    heap = Heap.new
    heap.heapify(('a'..'e').to_a.reverse)
    ('a'..'e').each { |c| heap.pop.should eq(c) }
  end
end
