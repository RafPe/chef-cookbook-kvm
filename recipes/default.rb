#
# Cookbook Name:: kvm
# Recipe:: default
#
# Copyright (c) 2016 RafPe, All Rights Reserved.

bash "yum groupinstall Development tools" do
    user "root"
    group "root"
    code <<-EOC
      yum groupinstall "Development tools" -y
    EOC
    not_if "yum grouplist installed | grep 'Development tools'"
  end

%w(kvm virt-manager libvirt virt-install bridge-utils qemu-kvm libguestfs-tools genisoimage).each do |pkg|
  package pkg do
    action :install
  end
end

%w(xorg-x11-fonts-Type1 xorg-x11-fonts-misc python-pip python-bottle python-argparse python-jinja2 xauth dejavu-lgc-sans-fonts xorg-x11-xauth htop wget vim ntpdate).each do |pkg|
  package pkg do
    action :install
  end
end
