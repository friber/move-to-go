# coding: iso-8859-1
require 'spec_helper'
require 'move-to-go'

describe MoveToGo::EmailHelper do
    it "should validate a common email address" do
        # given
        import_email = "apl@lundalogik.se"

        # when, then
        MoveToGo::EmailHelper.is_valid?(import_email).should eq true
    end

    it "should validate an address with firstname.lastname" do
        MoveToGo::EmailHelper.is_valid?("firstname.lastname@example.com").should eq true
    end

    it "should validate an address with lots of subdomains" do
        MoveToGo::EmailHelper.is_valid?("firstname.lastname@sub1.sub2.example.com").should eq true
    end

    it "should validate an address with some special chars" do
        MoveToGo::EmailHelper.is_valid?("firstname-lastname+=@sub1.sub2.example.com").should eq true
    end

    it "should validate an address with no top level domain" do
        MoveToGo::EmailHelper.is_valid?("firstname@example").should eq true
    end

    it "should not validate an invalid address" do
        MoveToGo::EmailHelper.is_valid?("hubbabubba").should eq false
    end

    it "should not validate an address with swedish chars" do
        MoveToGo::EmailHelper.is_valid?("info.bor�s@example.se").should eq false
    end
end
