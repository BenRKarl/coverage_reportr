require "spec_helper"

describe User do
  it "has an email address" do
    new_user = User.create(username: "newguy", email: "newguy@hello.com", password: "abcdefghij", password_confirmation: "abcdefghij")

    expect(new_user.email).to eq("newguy@hello.com")
  end
end
