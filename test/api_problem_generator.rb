require 'test_helper'
require 'api_problem'

class CellGeneratorTest < Rails::Generators::TestCase
  p "asflkasflksadjflaksdjfl;k"
  destination File.join(Rails.root, "tmp")
  setup :prepare_destination
  tests ::Cells::Generators::CellGenerator

  test "create the standard assets" do
    run_generator %w(Blog post latest)

    assert_file "app/cells/blog_cell.rb", /class BlogCell < Cell::Rails/
    assert_file "app/cells/blog_cell.rb", /def post/
    assert_file "app/cells/blog_cell.rb", /def latest/
    assert_file "app/cells/blog/post.html.erb", %r(app/cells/blog/post.html.erb)
    assert_file "app/cells/blog/latest.html.erb", %r(app/cells/blog/latest.html.erb)
    assert_file "test/cells/blog_cell_test.rb"
  end
end
