class ChefsTest < ActiveSupport::TestCase

  def setup do
    @chef = Chef.create(chefName = "Bob", email = "bob@gmail.com", password = "password")
  end

  test "name must be present" do
    @chef = Chef.new(chefName = "", email ="")
    assert_not @chef.valid?
  end

  test "email must be present" do
    @chef = Chef.new(chefName = "Bobby", email = "")
    assert_not @chef.valid?
  end

  test "email must be valid" do
    @chef = Chef.new(chefName = "bobby", email = "bobby@example")
    assert_not @chef.valid?
  end

  test "name shouldn't be more than 100 characters" do
    @chef = Chef.new(chefName = "a"x101, email = "aaaa@example.com")
    assert_not @chef.valid?
  end

  test "name and email should be unique" do
    @chef = Chef.create(chefName = "BOB", email = "BOB@gmail.com")
    assert_not @chef.valid?
  end

end
