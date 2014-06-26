guard 'sprockets', destination: 'build', asset_paths: %w(app vendor), minify: true  do
  watch (%r{^app/.*}){ |m| 'app/index.js' }
end

guard 'sass', input: 'css', output: 'build' do
  watch %r{^css/(.+\.s[ac]ss)$}
end