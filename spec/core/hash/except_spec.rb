require_relative '../../spec_helper'

ruby_version_is "3.0" do
  describe "Hash#except" do
    before :each do
      @hash = { a: 1, b: 2, c: 3 }
    end

    it "returns a new duplicate hash without arguments" do
      ret = @hash.except
      ret.should_not equal(@hash)
      ret.should == @hash
    end

    it "returns a hash without the requested subset" do
      @hash.except(:c, :a).should == { b: 2 }
    end

    it "ignores keys not present in the original hash" do
      @hash.except(:a, :chunky_bacon).should == { b: 2, c: 3 }
    end

    if RUBY_VERSION >= "3.0.0"
      it "returns an instance of Hash" do
        klass = Class.new(Hash)
        h = klass.new
        h[:bar] = 12
        h[:foo] = 42
        r = h.except(:foo)
        r.should == {bar: 12}
        r.class.should == Hash
      end
    else
      it "returns an instance of Hash" do
        klass = Class.new(Hash)
        h = klass.new
        h[:bar] = 12
        h[:foo] = 42
        r = h.except(:foo)
        r.should == {bar: 12}
        r.class.should == klass
      end
    end
  end
end
