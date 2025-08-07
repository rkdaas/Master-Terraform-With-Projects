provider "aws" {
  region = "ap-south-1"
}
resource "aws_subnet" "example" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-south-1a"
  cidr_block                                     = "10.0.1.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "MySubnet"
  }
  tags_all = {
    Name = "MySubnet"
  }
  vpc_id = "vpc-0cfbb0bf415d56af0"
}

resource "aws_security_group" "example" {
  description = "Allow SSH"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "EC2-VPC-Basic-Setup-MySecurityGroup-svAouTprZhRY"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "MySG"
  }
  tags_all = {
    Name = "MySG"
  }
  vpc_id = "vpc-0cfbb0bf415d56af0"
}

resource "aws_route_table" "example" {
  vpc_id = "vpc-0cfbb0bf415d56af0"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0d1f124659f6a2066"
  }
  propagating_vgws = []
  tags     = {}
  tags_all = {}
}

resource "aws_route" "example" {
  carrier_gateway_id          = null
  core_network_arn            = null
  destination_cidr_block      = "10.0.0.0/16"
  destination_ipv6_cidr_block = null
  destination_prefix_list_id  = null
  egress_only_gateway_id      = null
  gateway_id                  = "local"
  local_gateway_id            = null
  nat_gateway_id              = null
  network_interface_id        = null
  route_table_id              = "rtb-025c31440cb424603"
  transit_gateway_id          = null
  vpc_endpoint_id             = null
  vpc_peering_connection_id   = null
}


resource "aws_internet_gateway" "example" {
  tags = {
    Name = "MyIGW"
  }
  tags_all = {
    Name = "MyIGW"
  }
  vpc_id = "vpc-0cfbb0bf415d56af0"
}


resource "aws_route_table_association" "example" {
  gateway_id     = null
  route_table_id = "rtb-025c31440cb424603"
  subnet_id      = "subnet-093699e27fbac2e3f"
}


resource "aws_vpc" "example" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  tags = {
    Name = "MyVPC"
  }
  tags_all = {
    Name = "MyVPC"
  }
}


resource "aws_instance" "example" {
  ami                                  = "ami-0e35ddab05955cf57"
  associate_public_ip_address          = true
  availability_zone                    = "ap-south-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  enable_primary_ipv6                  = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  key_name                             = "NewKey"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  private_ip                           = "10.0.1.52"
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = "subnet-093699e27fbac2e3f"
  tags = {
    Name = "CF-EC2"
  }
  tags_all = {
    Name = "CF-EC2"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-07d1deb62e8ad5f76"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}

