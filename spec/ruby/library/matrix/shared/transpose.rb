require File.expand_path('../../fixtures/classes', __FILE__)
require 'matrix'

describe :matrix_transpose, :shared => true do
  it "returns a transposed matrix" do
    Matrix[[1, 2], [3, 4], [5, 6]].send(@method).should == Matrix[[1, 3, 5], [2, 4, 6]]
  end

  ruby_bug "redmine:1532", "1.8.7" do
    it "can transpose empty matrices" do
      m = Matrix[[], [], []]
      m.send(@method).send(@method).should == m
    end
  end

  ruby_bug "redmine #5307", "1.9.3" do
    describe "for a subclass of Matrix" do
      it "returns an instance of that subclass" do
        MatrixSub.ins.send(@method).should be_an_instance_of(MatrixSub)
      end
    end
  end
end
