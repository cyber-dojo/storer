require_relative 'test_base'

class StorerKataManifestTest < TestBase

  def self.hex_prefix
    '33DD9'
  end

  #- - - - - - - - - - - - - - - - - - - - - - - -

  test 'E2A',
  'new-style kata not involving renaming (dolphin, 20 lights)' do
    kata_id = '420B05BA0A'
    assert dir(kata_id).exists?
    @manifest = storer.kata_manifest(kata_id)
    assert_equal expected_keys.sort, @manifest.keys.sort
    assert_id kata_id
    assert_created [2017,10,25,13,31,50]
    assert_display_name 'Java, JUnit'
    assert_exercise '(Verbal)'
    assert_filename_extension('.java')
    assert_image_name 'cyberdojofoundation/java_junit'
    assert_language 'Java-JUnit'
    assert_max_seconds 10
    assert_runner_choice 'stateless'
    assert_tab_size 4
  end

  #- - - - - - - - - - - - - - - - - - - - - - - -

  test 'E2B',
  'new-style kata not involving renaming (snake, 0 lights)' do
    kata_id = '420F2A2979'
    assert dir(kata_id).exists?
    @manifest = storer.kata_manifest(kata_id)
    assert_equal expected_keys.sort, @manifest.keys.sort
    assert_id kata_id
    assert_created [2017,8,2,20,46,48]
    assert_display_name 'PHP, PHPUnit'
    assert_exercise 'Anagrams'
    assert_filename_extension('.php')
    assert_image_name 'cyberdojofoundation/php_phpunit'
    assert_language 'PHP-PHPUnit'
    assert_max_seconds 10
    assert_runner_choice 'stateful'
    assert_tab_size 4
  end

  #- - - - - - - - - - - - - - - - - - - - - - - -

  test 'E2C',
  'old-style kata involving renaming (buffalo, 36 lights)' do
    kata_id = '421F303E80'
    assert dir(kata_id).exists?
    old = raw_manifest(kata_id)
    assert_equal 'C', old['language']
    @manifest = storer.kata_manifest(kata_id)
    assert_equal expected_keys.sort, @manifest.keys.sort
    assert_id kata_id
    assert_created [2013,2,18,13,22,10]
    assert_display_name 'C (gcc), assert'
    assert_exercise 'Calc_Stats'
    assert_filename_extension('.c')
    assert_image_name 'cyberdojofoundation/gcc_assert' # ?
    assert_language 'C (gcc)-assert'
    assert_max_seconds 10
    assert_runner_choice 'stateful'
    assert_tab_size 4
  end

  #- - - - - - - - - - - - - - - - - - - - - - - -

  #puts JSON.pretty_generate(@manifest)

  private # = = = = = = = = = = = = = = =

  def dir(kata_id)
    outer = kata_id[0..1]
    inner = kata_id[2..-1]
    disk["#{cyber_dojo_katas_root}/#{outer}/#{inner}"]
  end

  def raw_manifest(kata_id)
    JSON.parse(dir(kata_id).read('manifest.json'))
  end

  # - - - - - - - - - - - - - - - - - - - -

  def assert_id(expected)
    assert_equal expected, id, 'id'
  end

  def assert_created(expected)
    assert_equal expected, created, 'created'
  end

  def assert_display_name(expected)
    assert_equal expected, display_name, 'display_name'
  end

  def assert_exercise(expected)
    assert_equal expected, exercise, 'exercise'
  end

  def assert_filename_extension(expected)
    assert_equal expected, filename_extension, 'filename_extension'
  end

  def assert_image_name(expected)
    assert_equal expected, image_name, 'image_name'
  end

  def assert_language(expected)
    assert_equal expected, language, 'language'
  end

  def assert_max_seconds(expected)
    assert_equal expected, max_seconds, 'max_seconds'
  end

  def assert_runner_choice(expected)
    assert_equal expected, runner_choice, 'runner_choice'
  end

  def assert_tab_size(expected)
    assert_equal expected, tab_size, 'tab_size'
  end

  # - - - - - - - - - - - - - - - - - - - -

  def id
    @manifest[__method__.to_s]
  end

  def created
    @manifest[__method__.to_s]
  end

  def display_name
    @manifest[__method__.to_s]
  end

  def exercise
    @manifest[__method__.to_s]
  end

  def filename_extension
    @manifest[__method__.to_s]
  end

  def image_name
    @manifest[__method__.to_s]
  end

  def language
    @manifest[__method__.to_s]
  end

  def max_seconds
    @manifest[__method__.to_s]
  end

  def runner_choice
    @manifest[__method__.to_s]
  end

  def tab_size
    @manifest[__method__.to_s]
  end

  # - - - - - - - - - - - - - - - - - - - -

  def expected_keys
    %w(
      id
      created
      display_name
      exercise
      filename_extension
      highlight_filenames
      image_name
      language
      lowlight_filenames
      max_seconds
      progress_regexs
      runner_choice
      tab_size
      visible_files
    )
  end

end