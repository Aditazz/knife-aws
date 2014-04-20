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

require 'chef/knife/aws_base'

class Chef
  class Knife
    class AwsImagesList < Knife

      include Knife::AwsBase

      banner "knife aws images list (options)"

      def run

        validate!

        images_list = [
          ui.color('Image Id', :bold),
          ui.color('Architecture', :bold),
          ui.color('Block Device Mapping', :bold),
          ui.color('Location', :bold),
          ui.color('Owner Id', :bold),
          ui.color('State', :bold),
          ui.color('Type', :bold),
          ui.color('Is Public', :bold),
          ui.color('Kernel Id', :bold),
          ui.color('Platform', :bold),
          ui.color('Product Codes', :bold),
          ui.color('Ramdisk Id', :bold),
          ui.color('Root Device Type', :bold),
          ui.color('Root Device Name', :bold),
          ui.color('Tags', :bold)
        ]	
        connection.images.sort_by(&:id).each do |image|
          images_list << image.id
          images_list << image.architecture.to_s
          images_list << image.block_device_mapping.to_s
          images_list << image.location.to_s
          images_list << image.owner_id.to_s
          images_list << image.state.to_s
          images_list << image.type.to_s
          images_list << image.is_public.to_s
          images_list << image.kernel_id.to_s
          images_list << image.platform.to_s
          images_list << image.product_codes.to_s
          images_list << image.ramdisk_id.to_s
          images_list << image.root_device_type.to_s
          images_list << image.root_device_name.to_s
          images_list << image.tags.values.join(',')
        end
        puts ui.list(images_list, :columns_across, 15)
      end
    end
  end
end
