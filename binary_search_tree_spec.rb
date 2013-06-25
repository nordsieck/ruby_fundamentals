require './binary_search_tree'

describe BinarySearchTree do

  before(:each) do
    @bst = BinarySearchTree.new
    @bst.add 'b'
  end

  describe "#clear!" do
    it "makes the binary search tree empty" do
      @bst.empty?.should be false
      @bst.clear!
      @bst.empty?.should be true
    end
  end

  describe "#empty?" do
    context "when the list is empty" do
      it "returns true" do
        @bst.clear!
        @bst.empty?.should be true
      end
    end

    context "when the list is not empty" do
      it "returns false" do
        @bst.empty?.should be false
      end
    end
  end

  describe "#add" do
    context "when the tree is empty" do
      it "adds the element to the tree" do
        @bst.clear!
        @bst.add 'a'
        @bst.size.should be 1
        @bst.contains?('a').should be true
      end
    end

    context "when thet tree is not empty" do
      context "and the element is not equal to an element already in the tree" do
        it "adds the element to the tree" do
          @bst.add 'a'
          @bst.contains?('a').should be true
          @bst.contains?('b').should be true
          @bst.size.should be 2
        end
      end

      context "and the element is equal to an element already in the tree" do
        it "silently does nothing" do
          @bst.add 'b'
          @bst.contains?('b').should be true
          @bst.size.should be 1
        end
      end
    end
  end

  describe "#remove" do
    context "when the tree is empty" do
      it "returns nil" do
        @bst.clear!
        @bst.remove('b').should be_nil
        @bst.size.should be 0
      end
    end

    context "when the tree is not empty" do
      context "and the element is in the tree" do
        context "and the node has no children" do
          it "removes the element from the tree and returns the element" do
            @bst.remove('b').should eq 'b'
            @bst.size.should be 0
          end
        end
        
        context "and the node has only an lchild" do
          it "replaces the element with its lchild and returns the element" do
            @bst.add 'a'
            @bst.remove('b').should eq 'b'
            @bst.size.should be 1
          end
        end
        
        context "and the node has only an rchild" do
          it "replaces the element with its rchild and returns the element" do
            @bst.add 'c'
            @bst.remove('b').should eq 'b'
            @bst.size.should be 1
          end
        end
        
        context "and the node has both an rchild and an lchild" do
          it "replaces the element with its rchild, merges the lchild and returns the element" do
            @bst.add 'a'
            @bst.add 'c'
            @bst.remove('b').should eq 'b'
            @bst.size.should be 2
          end
        end
      end
      
      context "and the element is not in the tree" do
        it "returns nil" do
          @bst.remove('c').should be_nil
          @bst.size.should be 1
        end
      end
    end
  end
end
