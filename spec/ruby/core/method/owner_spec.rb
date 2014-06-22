require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "Method#owner" do
  it "returns the owner of the method" do
    "abc".method(:upcase).owner.should == String
  end

  it "returns the name even when aliased" do
    obj = MethodSpecs::Methods.new
    obj.method(:foo).owner.should == MethodSpecs::Methods
    obj.method(:bar).owner.should == MethodSpecs::Methods
  end

  it "returns the class/module it was defined in" do
    MethodSpecs::C.new.method(:baz).owner.should == MethodSpecs::A
    MethodSpecs::MySuper.new.method(:bar).owner.should == MethodSpecs::MyMod
  end

  describe "for a Method generated by respond_to_missing?" do
    it "returns the owner of the method" do
      @m = MethodSpecs::Methods.new
      @m.method(:handled_via_method_missing).owner.should == MethodSpecs::Methods
    end
  end
end
