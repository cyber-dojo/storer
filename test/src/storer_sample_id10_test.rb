require_relative 'test_base'

class StorerSampleId10Test < TestBase

  def self.hex_prefix
    'B564B'
  end

  def hex_setup
    @old_env_var = ENV['CYBER_DOJO_KATAS_ROOT']
    # these tests must be completely isolated from each other
    ENV['CYBER_DOJO_KATAS_ROOT'] = "/tmp/cyber-dojo/#{test_id}/katas"
  end

  def hex_teardown
    ENV['CYBER_DOJO_KATAS_ROOT'] = @old_env_var
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - -

  test '1DF',
  'sample_id10_returns_a_randomly_selected_10_digit_kata_id' do
    # test rig has inserted katas named 'old/red' 42.. 1F.. 5A..
    sampled = 100.times.collect { storer.sample_id10 }.sort.uniq
    assert sampled.include?('420BD5D5BE')
    assert sampled.include?('1F00C1BFC8')
    assert sampled.include?('5A0F824303')
    assert sampled.include?('7E53732F00')    
  end

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  private

  def stubbed_make_katas(kata_ids)
    external.id_generator = IdGeneratorStub.new
    id_generator.stub(*kata_ids)
    kata_ids.size.times { make_kata }
  end

end
