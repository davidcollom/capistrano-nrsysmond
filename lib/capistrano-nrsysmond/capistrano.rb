Capistrano::Configuration.instance(:must_exist).load do

  _cset(:newrelic_licencekey) {
    abort  <<-ERROR
            define :newrelic_licencekey

            This can be done via:
              config/deploy.rb:
                set :newrelic_licencekey, 'sakjfhsdjkgd'
              $ cap deploy -s newrelic_licencekey=325398572395
    ERROR
  }

  namespace :newrelic do
    desc 'Installs the newrelic sysmond'
    namespace :sysmond do
      task :default do
        install::default
      end
      namespace :uninstall do
        task :default do
          abort "nrsysmond not found?" unless remote_file_exists? '/etc/newrelic/nrsysmond.cfg'
          debian if remote_file_exists? '/etc/debian_version'
          redhat if remote_file_exists? '/etc/redhat-release'
        end
        task :debian do
          sudo 'rm -f /etc/apt/sources.list.d/newrelic.list && apt-get remove newrelic-sysmond'
        end
        task :redhat do
          sudo "yum uninstall -y newrelic-sysmond newrelic-repo-5-3.noarch.rpm"
        end
        before :default, '::newrelic::sysmond::stop'
      end
      namespace :install do
        task :default do
          unless remote_file_exists? '/etc/newrelic/nrsysmond.cfg'
            debian if remote_file_exists? '/etc/debian_version'
            redhat if remote_file_exists? '/etc/redhat-release'
          end
        end
        task :debian do
          run "echo \"deb http://apt.newrelic.com/debian/ newrelic non-free\" > /tmp/newrelic.list"
          sudo "cp /tmp/newrelic.list /etc/apt/sources.list.d/newrelic.list"
          run 'wget -O- http://download.newrelic.com/548C16BF.gpg 2>/dev/null | sudo apt-key add -'
          run "#{sudo} apt-get update && #{sudo} apt-get install newrelic-sysmond"
          configure
        end
        task :redhat do
          sudo "rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/$(uname -m)/newrelic-repo-5-3.noarch.rpm || true"
          sudo "yum install -y newrelic-sysmond"
          configure
        end
      end
      desc 'configure the newrelic-sysmond service with the :newrelic_licencekey'
      task :configure do
        sudo "/usr/sbin/nrsysmond-config --set license_key=#{newrelic_licencekey}"
        restart
      end

      %W{stop start restart}.each do |com|
        desc "#{com}'s the newrelic-sysmond service"
        task com.to_sym do
          sudo "/etc/init.d/newrelic-sysmond #{com}"
        end
      end

      def remote_file_exists?(path)
        results = []

        invoke_command("if [ -e '#{path}' ]; then echo -n 'true'; fi") do |ch, stream, out|
          results << (out == 'true')
        end

        results == [true]
      end
    end
  end
end
