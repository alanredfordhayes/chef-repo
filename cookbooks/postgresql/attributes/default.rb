case node['platform_family']
when 'debian'
  case node['platform']
  when 'ubuntu'
    case node['platform_version']
    when '12.04', '14.04', '16.04'

    end
  when 'debian'
    case node['platform_version']
    when '9.3', '9.2', '9.1'

    end
  end
when 'rhel'
  case node['platform']
  when 'centos'
    case node['platform_version']
    when '7.2.1511', '7.3.1611', '7.4.1708', '7.1.1503'
      default['postgresql']['packages'] = ['postgresql-server', 'postgresql-contrib']
      default['postgresql']['shell']['initdb'] = 'postgresql-setup initdb'
      default['postgresql']['data'] = '/var/lib/pgsql/data'
      default['postgresql']['pg_hba']['path'] = '/var/lib/pgsql/data/pg_hba.conf'
      default['postgresql']['pg_hba']['orginal'] = ' ident'
      default['postgresql']['pg_hba']['replacement'] = ' md5'
    end
  when 'oracle'
    case node['platform_version']
    when '7.4', '7.3', '7.2', '7.1'

    end
  end
end
