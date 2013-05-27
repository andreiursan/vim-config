########################################################################
###
### Anrei Ursan's Vim Setup
### Based on https://github.com/bleything/dotvim/blob/master/Rakefile
###
### Git Hubs: http://github.com/andreiursan/vim-config
### Internet Electronic Mail: hello@andreiursan.com
###
########################################################################

require 'pathname'

task :default do
  puts "Hi! All this Rakefile can do right now is update the bundles:"
  puts # blank line
  puts "  $ rake update:bundles"
end

desc 'Update everything!'
task :update => [ 'update:bundles' ]

namespace :update do

  BUNDLES = {
    # plugins
    :ctrlp         => "git://github.com/kien/ctrlp.vim.git",
    :ack           => "git://github.com/mileszs/ack.vim.git",
    :rails         => "git://github.com/tpope/vim-rails.git",
    :bundler       => "git://github.com/tpope/vim-bundler.git",
    :rake          => "git://github.com/tpope/vim-rake.git",
    :surround      => "git://github.com/tpope/vim-surround.git",
    :fugitive      => "git://github.com/tpope/vim-fugitive.git",
    :css_color     => "git://github.com/ap/vim-css-color.git",
    :nerdtree      => "git://github.com/scrooloose/nerdtree.git",
    :nerdcommenter => "git://github.com/scrooloose/nerdcommenter.git",
    :tabular       => "git://github.com/godlygeek/tabular",
    :bufexplorer   => "http://www.vim.org/scripts/download_script.php?src_id=20031",
    :taglist       => "http://www.vim.org/scripts/download_script.php?src_id=19574",

    # syntax definitions
    :syntax_git       => "git://github.com/tpope/vim-git.git",
    :syntax_haml_sass => "git://github.com/tpope/vim-haml.git",

    # color schemes
    :colors_vividchalk => "git://github.com/tpope/vim-vividchalk.git"
  }

  desc "update any bundles defined in the Rakefile"
  task :bundles do

    bundle_home = Pathname.new( ENV['HOME'] ) + '.vim' + 'bundle'
    mkdir_p bundle_home

    BUNDLES.sort_by {|k,v| k.to_s }.each do |bundle, location|
      target_path = bundle_home + bundle.to_s

      puts "*" * 72
      puts "*** Instaling #{bundle} to #{target_path} from #{location}"
      puts # blank line

      rm_rf target_path

      case location.match( /^(.*?):/ )[1]
      when 'git'
        sh "git clone #{location} #{target_path} > /dev/null"
        rm_rf target_path + '.git'
      when 'http'
        mkdir_p target_path
        sh "cd #{target_path} && curl -s '#{location}' | tar zx -"
      end

      docdir = target_path + 'doc'
      if docdir.exist?
        puts "doc dir exists; tagging"
        sh "vim -u NONE -esX -c 'helptags #{docdir}' -c quit"
      end

      puts # blank line
    end
  end # task :bundles

end # namespace :update

