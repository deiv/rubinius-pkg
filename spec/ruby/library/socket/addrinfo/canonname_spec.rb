require File.expand_path('../../../../spec_helper', __FILE__)
require File.expand_path('../../fixtures/classes', __FILE__)
require 'socket'

describe "Addrinfo#canonname" do

  before :each do
    @addrinfos = Addrinfo.getaddrinfo("localhost", 80, :INET, :STREAM, nil, Socket::AI_CANONNAME)
  end

  it "returns the canonical name for a host" do
    @addrinfos.map {|a| a.canonname }.should include("localhost")
  end

end
