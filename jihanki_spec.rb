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
    its(:total) { should == 0 }
  end

  context "自販機に入る場合" do
    [10, 50, 100, 500, 1000].each do |num|
      context "#{num}円を入力したら#{num}円と表示" do
        before { @jihanki.input(num) }
        its(:total) { should eq num }
      end
    end
  end
  
  context "自販機に入らない場合" do
    [1, 5, 2000, 5000, 10000].each do |num|
      context "#{num}円を入力したら0円と表示" do
        before { @jihanki.input(num) }
        its(:total) { should eq 0 }
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
      its(:total) { should eq 120 }
      its(:otsuri) { should eq 0 }
    end	

    context "想定外のもの" do
      before do
        @jihanki = Jihanki.new
        [2000, 100, 10, 1, 10, 1000, 5].each do |num|
          @jihanki.input(num)
        end
      end
      subject { @jihanki }
      its(:total) { should eq 1120 }
      its(:otsuri) { should eq 2006 }
    end
  end

  context "払い戻し" do
      before do
        @jihanki = Jihanki.new
        [100, 10, 10, 50, 1000].each do |num|
          @jihanki.input(num)
        end
      end
      subject { @jihanki }
      its(:harai_modoshi) { should eq 1170 }
      its(:total) { should eq 0 }
      its(:otsuri) { should eq 1170 }
  end
end