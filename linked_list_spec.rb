require './linked_list'

describe LinkedList do

  before(:each) do
    @list = LinkedList.new
    (0..5).each { |i| @list.add i }
  end

  describe "#clear!" do
    it "makes the linked list empty" do
      @list.empty?.should be false
      @list.clear!
      @list.empty?.should be true
    end
  end

  describe "#add" do
    context "when no index is specified" do
      it "adds an element to the beginning of the list" do
        @list.add 6
        @list.get.should be 6
      end
    end

    context "when the index specified is equal to the list size" do
      it "adds an element at end of the list" do
        @list.add(6, 6)
        @list.get(6).should be 6
      end
    end

    context "when the index specified is less than the list size" do
      context "and the index specified is not negative" do
        it "adds an element at the index specified" do
          @list.add('a', 2)
          @list.get(2).should eq 'a'
        end
      end

      context "and the index specified is negative" do
        it "raises an IndexError exception" do
          expect{ @list.add('a', -1) }.to raise_error IndexError
        end
      end
    end

    context "when the index specified is greater than the list size" do
      it "raises an IndexError exception" do
        expect{ @list.add('a', 20) }.to raise_exception IndexError
      end
    end
  end
  
  describe "#get" do
    it "gets the element from the beginning of the list if no index is specified" do
      @list.get.should be 5
    end

    it "gets the element at the index specified" do
      @list.get(1).should be 4
    end
  end

  describe "#empty?" do
    context "when the list is not empty" do
      it "returns false" do
        @list.empty?.should be false
      end
    end

    context "when the list is empty" do
      it "returns true" do
        @list.clear!
        @list.empty?.should be true
      end
    end
  end

  describe "#remove" do
    context "when no index is specified" do
      context "and the list is empty" do
        it "raises and IndexError exception" do
          @list.clear!
          expect{ @list.remove }.to raise_exception IndexError
        end
      end

      context "and the list is not empty" do
        it "removes the first element in the list" do
          @list.get.should be 5
          @list.remove
          @list.get.should be 4
        end
      end
    end

    context "when an index is specified" do
      context "and it is negative" do
        it "raises an IndexError exception" do
          expect{ @list.remove -1 }.to raise_exception IndexError
        end
      end

      context "and it is less than @size" do
        it "removes the elment at the specified index" do
          expect(@list.get 1).to be 4
          @list.remove 1
          expect(@list.get 1).to be 3
        end
      end

      context "and it is greater than or equal to @size" do
        it "raises an IndexError exception" do
          expect{ @list.remove 20 }.to raise_exception IndexError
          expect{ @list.remove @list.size }.to raise_exception IndexError
        end
      end
    end
  end
end
