class jenkins::install {

    yumrepo {'jenkins_repo':
        ensure => present,
        name => 'Jenkins-stable',
        baseurl => 'http://pkg.jenkins.io/redhat-stable',
        gpgcheck => 1        
    }

    exec { 'jenkins_repo_key':
        command   => '/bin/rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key',
        unless    => '/bin/rpm -q jenkins',
        subscribe => Yumrepo['jenkins_repo'],
        require   => Yumrepo['jenkins_repo']
    }

    package { 'epel-repo':
        name   => 'epel-release',
        ensure => present,
        source => 'https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm'
    }

    $packages = [ 'jenkins', 'java-1.8.0-openjdk', 'nginx', 'git' ]

    package { $packages:
        ensure    => present,
        require   => [ Yumrepo['jenkins_repo'], Package['epel-repo'] ]
    }
}
