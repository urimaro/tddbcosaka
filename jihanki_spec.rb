# encoding: UTF-8

require "rubygems"
require "rspec"
require_relative "jihanki"

describe "自販機" do
  before do
    @jihanki = Jihanki.new
  end
  context "何もしないときに0円を表示" do
    it { @jihanki.display.should == 0 }
  end

  context "自販機に入る場合" do
    context "10円を入力したら10円と表示" do
      before { @jihanki.input(10) }
      it { @jihanki.display.should == 10 }
    end

    context "50円を入力したら50円と表示" do
      before { @jihanki.input(50) } 
      it { @jihanki.display.should == 50 }
    end

    context "100円を入力したら100円と表示" do
      before { @jihanki.input(100) }
      it { @jihanki.display.should == 100 }
    end

    context "500円を入力したら500円と表示" do
      before { @jihanki.input(500) }
      it { @jihanki.display.should == 500 }
    end

    context "1000円を入力したら1000円と表示" do
      before { @jihanki.input(1000) }
      it { @jihanki.display.should == 1000 }
    end
  end
  
  context "自販機に入らない場合" do
    context "1円を入力したら0円と表示" do
      before { @jihanki.input(1) }
      it { @jihanki.display.should == 0 }
    end

    context "5円を入力したら0円と表示" do
      before { @jihanki.input(5) }
      it { @jihanki.display.should == 0 }
    end

    context "2000円を入力したら0円と表示" do
      before { @jihanki.input(2000) }
      it { @jihanki.display.should == 0 }
    end

    context "5000円を入力したら0円と表示" do
      before { @jihanki.input(5000) }
      it { @jihanki.display.should == 0 }
    end

    context "10000円を入力したら0円と表示" do
      before { @jihanki.input(10000) }
      it { @jihanki.display.should == 0 }
    end
  end
end