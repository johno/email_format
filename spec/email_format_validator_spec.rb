require 'spec_helper'

describe EmailFormatValidator do

  let(:fake_model) { FakeModel.new }

  context "with valid emails" do

    let(:valid_emails) { %w(valid@email.com another.valid@email.email.net) }

    it "should be happy" do
      valid_emails.each do |email|
        fake_model.email = email
        expect(fake_model.valid?).to be_true
      end
    end
  end

  context "with invalid emails" do

    let(:invalid_emails) { %w(invalid_email@
                              another_invalid_email@@email.email
                              invalid
                              bad@email@here
                              @bad_email
                              another@bad,email) }

    it "shouldn't be happy" do
      invalid_emails.each do |email|
        fake_model.email = email
        expect(fake_model.valid?).to be_false
      end
    end
  end

  context "with allow_blank: true" do

    let(:fake_model)   { FakeModelWithBlankEmail.new }
    let(:blank_emails) { ['', nil, ' '] }

    it "should allow blank emails" do
      blank_emails.each do |blank_email|
        fake_model.email = blank_email
        expect(fake_model.valid?).to be_true
      end
    end
  end
end
