#
# Author:: Charles Gardner (<cgardner2020@gmail.com>)
# Fri 18 Apr 2014 04:23:43 PM PDT 
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'chef/knife/ec2_base'

class Chef
  class Knife
    class Ec2VpcList < Knife

      include Knife::Ec2Base

      banner "knife ec2 vpcs list (options)"

      def run

        validate!

        vpcs_list = [
          ui.color('VpcId', :bold),
          ui.color('State', :bold),
          ui.color('CidrBlock', :bold),
          ui.color('DhcpOptionsId', :bold),
          ui.color('InstanceTenancy', :bold),
          ui.color('Tags', :bold)
        ]
        connection.vpcs.sort_by(&:id).each do |vpc|
          vpcs_list << vpc.id
          vpcs_list << vpc.state
          vpcs_list << vpc.cidr_block
          vpcs_list << vpc.dhcp_options_id
          vpcs_list << vpc.tenancy
          vpcs_list << vpc.tags.join(",")
        end
        puts ui.list(vpcs_list, :columns_across, 6)
      end
    end
  end
end
