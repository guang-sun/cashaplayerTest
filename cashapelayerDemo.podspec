Pod::Spec.new do |s|
s.name         = 'cashapelayerDemo'
s.version      = '1.0.1'
s.summary      = '测试使用'
s.homepage     = 'https://github.com/guang-sun'
s.license      = 'MIT'
s.authors      = {'DG' => ''}
s.platform     = :ios, '6.0'
s.source       = {:git => 'https://github.com/guang-sun/cashaplayerTest.git', :tag => '1.0.0'}
s.source_files = "recouse/*.{h,m}"

s.requires_arc = true

end
