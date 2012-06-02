# encoding: UTF-8

require "rubygems"
require "rspec"
require_relative "jihanki"

describe "自販機" do
  before do
    @jihanki = Jihanki.new
  end
  
  subject { @jihanki.display }

  context "何もしないときに0円を表示" do
    it { should == 0 }
  end

  context "自販機に入る場合" do
    [10, 50, 100, 500, 1000].each do |num|
      context "#{num}円を入力したら#{num}円と表示" do
        before { @jihanki.input(num) }
        it { should eq num }
      end
    end
  end
  
  context "自販機に入らない場合" do
    [1, 5, 2000, 5000, 10000].each do |num|
      context "#{num}円を入力したら0円と表示" do
        before { @jihanki.input(num) }
        it { should eq 0 }
      end
    end
  end
end