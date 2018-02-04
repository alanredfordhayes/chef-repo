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
  case node['plaform']
  when 'centos'
    case node['platform_version']
    when '7.2.1511', '7.3.1611', '7.4.1708', '7.1.1503'

    end
  when 'oracle'
    case node['platform_version']
    when '7.4', '7.3', '7.2', '7.1'

    end
  end
end
