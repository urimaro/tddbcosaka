# encoding: UTF-8

require "rubygems"
require "rspec"
require_relative "jihanki"

describe "自販機" do
  before do
    @jihanki = Jihanki.new
  end
  subject { @jihanki }

  context "何もしないときに0円を表示" do
    its(:display) { should == 0 }
  end

  context "自販機に入る場合" do
    [10, 50, 100, 500, 1000].each do |num|
      context "#{num}円を入力したら#{num}円と表示" do
        before { @jihanki.input(num) }
        its(:display) { should eq num }
      end
    end
  end
  
  context "自販機に入らない場合" do
    [1, 5, 2000, 5000, 10000].each do |num|
      context "#{num}円を入力したら0円と表示" do
        before { @jihanki.input(num) }
        its(:display) { should eq 0 }
      end
    end
  end

  context "複数回入金する場合" do
    context "想定内のもの" do
      before do
        @jihanki = Jihanki.new
        [100, 10, 10].each do |num|
          @jihanki.input(num)
        end
      end
      subject { @jihanki }
      its(:display) { should eq 120 }
      its(:getOtsuri) { should eq 0 }
    end	

    context "想定外のもの" do
      before do
        @jihanki = Jihanki.new
        [2000, 100, 10, 1, 10, 1000, 5].each do |num|
          @jihanki.input(num)
        end
      end
      subject { @jihanki }
      its(:display) { should eq 1120 }
      its(:getOtsuri) { should eq 2006 }
    end
  end
end