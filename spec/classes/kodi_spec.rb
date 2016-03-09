require 'spec_helper'

describe 'kodi' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "kodi class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with package_name" do
          let :params do
            {
              :package_name => 'foo',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('foo').with_ensure('present') }
        end

        context "kodi class with package_ensure" do
          let :params do
            {
              :package_ensure => 'absent',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('absent') }
        end

        context "kodi class with ppa string" do
          let :params do
            {
              :ppa => 'ppa:team-foo/ppa',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-foo/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with ppa array" do
          let :params do
            {
              :ppa => [ 'ppa:team-foo/ppa', 'ppa:team-foo/unstable' ],
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-foo/ppa') }
          it { is_expected.to     contain_apt__ppa('ppa:team-foo/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with unstable true" do
          let :params do
            {
              :unstable => true,
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with ppa string and unstable true" do
          let :params do
            {
              :ppa      => 'ppa:team-foo/ppa',
              :unstable => true,
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-foo/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with nightly true" do
          let :params do
            {
              :nightly => true,
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with ppa string and nightly true" do
          let :params do
            {
              :ppa     => 'ppa:team-foo/ppa',
              :nightly => true,
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to     contain_apt__ppa('ppa:team-foo/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.not_to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.to     contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with unstable true and nightly true" do
          let :params do
            {
              :nightly  => true,
              :unstable => true,
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('kodi') }
          it { is_expected.to contain_class('kodi::install') }

          it { is_expected.to contain_apt__ppa('ppa:team-xbmc/ppa') }
          it { is_expected.to contain_apt__ppa('ppa:team-xbmc/unstable') }
          it { is_expected.to contain_apt__ppa('ppa:team-xbmc/xbmc-nightly') }

          it { is_expected.to contain_package('kodi').with_ensure('present') }
        end

        context "kodi class with package_name failure" do
          let :params do
            {
              :package_name => {},
            }
          end

          it { expect { is_expected.to contain_package('kodi') }.to raise_error(Puppet::Error, /{} is not a string\.  It looks to be a Hash/) }
        end

        context "kodi class with ppa failure" do
          let :params do
            {
              :ppa => {},
            }
          end

          it { expect { is_expected.to contain_apt__ppa('ppa:team-xbmc/ppa') }.to raise_error(Puppet::Error, /\$ppa must be a string or array\./) }
        end

        context "kodi class with unstable failure" do
          let :params do
            {
              :unstable => "not a bool",
            }
          end

          it { expect { is_expected.to contain_apt__ppa('ppa:team-xbmc/ppa') }.to raise_error(Puppet::Error, /"not a bool" is not a boolean\./) }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'kodi class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('kodi') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
