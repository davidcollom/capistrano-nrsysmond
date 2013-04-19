Dir[File.join(File.dirname(__FILE__), 'capistrano-nrsysmond', '*')].each do |file|
  require file
end