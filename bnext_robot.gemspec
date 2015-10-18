$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        =  'bnext_robot'
  s.version     =  '1.0.0'
  s.date        =  ''2015-10-18''
  s.executables << 'bnext_robot'
  s.summary     =  'Web scrapy for Business Next'
  s.description =  'Web scrapy for Business Next, including showing day/week rank and feeds extraction'
  s.authors     =  ['Jacky Pan', 'Angela Hung', 'Edison Lee', 'Tony Lee']
  s.email       =  ['jackypan000@gmail.com', 'angela.hung@iss.nthu.edu.tw', 'dfg1021@hotmail.com.tw', 'tony123930@yahoo.com.tw']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/SOA-Upstart4/Team-HW-1-Ideate-and-Scrape'
  s.license     =  'MIT'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'oga'
end
