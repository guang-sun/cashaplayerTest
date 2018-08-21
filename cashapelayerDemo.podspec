Pod::Spec.new do |s|
s.name         = 'cashaplayerTest'
s.version      = '1.0.0'
s.summary      = '测试使用'
s.homepage     = 'hhttps://github.com/guang-sun'
s.license      = 'MIT'
s.authors      = {'DG' => ''}
s.platform     = :ios, '6.0'
s.source       = {:git => 'https://github.com/guang-sun/cashaplayerTest.git', :tag => s.version}
s.source_files = 'cashaplayerTest/**/*'
s.requires_arc = true

end
