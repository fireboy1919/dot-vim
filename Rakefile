PWD = ENV['PWD']

def install_in(path)
  files = %w{ .vim .tmux .vimrc  .tmux.conf }
  files.each do |f|
    target = File.join path, f
    source = File.join PWD, f
    if(File.exists?(target))
       puts "#{target} already exists - not added."
    else
      %x(ln -s #{source} #{target})
    end
  end

  append_files = %w{ .bashrc }

  append_files.each do |f|
    target = File.join path, f
    source = File.join PWD, f
    open(target,'a') do |file|
      file.puts "source '#{source}'"
    end
  end
end

desc "Installs the .vim and .vimrc files"
task :install do
  puts "Where to install? [#{ENV['HOME']}]"
  %x(git submodule init)
  %x(git submodule update)
  root = $stdin.gets.chomp 
  root = root.empty? ? ENV['HOME'] : root
  install_in root
  %x(vim +PluginInstall +qall)
end

namespace :install do
  desc "Installs using the default paths, with no user input"
  task :no_user_input do
    install_in ENV['HOME']
  end
end

task :default => :install
