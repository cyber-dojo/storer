require_relative './../hex_mini_test'
require_relative './../../src/storer_post_adapter'

class ClientTestBase < HexMiniTest

  def kata_exists?(kata_id)
    @json = storer.kata_exists?(kata_id)
  end

  def create_kata(manifest)
    @json = storer.create_kata(manifest)
  end

  # - - - - - - - - - - - - - - - - - - - - - - -

  def storer; StorerPostAdapter.new; end

  def json; @json; end
  def status; json['status']; end
  def stdout; json['stdout']; end
  def stderr; json['stderr']; end

  # - - - - - - - - - - - - - - - - - - - - - - -

  def success; 0; end

  def assert_success; assert_equal success, status, json.to_s; end

  def assert_stdout(expected); assert_equal expected, stdout, json.to_s; end
  def assert_stderr(expected); assert_equal expected, stderr, json.to_s; end
  def assert_status(expected); assert_equal expected, status, json.to_s; end

end
