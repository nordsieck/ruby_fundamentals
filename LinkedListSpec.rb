require 'LinkedList'

describe LinkedList, "#clear" do
  it "removes the contents of the linked list" do
    list = LinkedList.new
    5.times { list.add 'a' }
    list.clear
    list.size.should eq(0)
    expect { list.get }.to raise_exception(IndexError)
  end
end

describe LinkedList, "#add" do
  it "adds the element e to the linked list at index idx" do
    list = LinkedList.new
    (0..5).each { |i| list.add(i) }
    list.size.should eq(6)
    expect { list.add(7, 7) }.to raise_exception(IndexError)
    list.add(6, 6)
    list.size.should eq(7)
    list.add("a", 1)
    list.get(1).should eq("a")
  end
end

describe LinkedList, "#get" do
  it "gets the element from the linked list at index idx" do
    list = LinkedList.new
    (0..5).each { |i| list.add(i) }
    (0..5).each { |i| list.get(i).should eq(5 - i) }
    expect { list.get(list.size) }.to raise_exception(IndexError)
  end
end

describe LinkedList, "#remove" do
  it "removes the element from the linked list at index idx" do
    list = LinkedList.new
    (0..5).each { |i| list.add(i) }
    expect { list.remove(list.size) }.to raise_exception(IndexError)
    list.size.should eq(6)
    list.get.should eq(5)
    list.remove()
    list.size.should eq(5)
    list.get.should eq(4)
    list.get(1).should eq(3)
    list.remove(1)
    list.get(1).should eq(2)
    list.size.should eq(4)
  end
end
