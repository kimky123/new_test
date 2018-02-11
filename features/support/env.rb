require 'rspec'
require 'pry'

gem_name = "gem_test"
path = $LOAD_PATH.find{|path| path.include? "features" && gem_name}
fail "Did not find a matching load path for #{gem_name}" unless path

feature_path = path + "/**/*.feature"
all_features = Dir.glob(feature_path)
default_dir = Dir.pwd
Dir.chdir('features')
Dir.mkdir('temp_features') unless File.exist?('temp_features')
Dir.chdir('temp_features')
all_features.each do |feature|
  File.open(feature.split('/').last,'w'){|file| file.write(File.read(feature))}
end
Dir.chdir(default_dir)

step_def_path = path + "/step_definitions/**/*.rb"
all_step_defs = Dir.glob(step_def_path)
all_step_defs.each {|step_def| require(step_def)}