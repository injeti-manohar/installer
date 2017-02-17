resource "openstack_compute_instance_v2" "etcd_node" {
  count           = "${var.etcd_count}"
  name            = "etcd_node_${count.index}"
  image_id        = "${var.image_id}"
  flavor_id       = "${var.flavor_id}"
  key_pair        = "${openstack_compute_keypair_v2.k8s_keypair.name}"
  security_groups = ["${openstack_compute_secgroup_v2.etcd_group.name}"]

  metadata {
    role = "etcd"
  }

  user_data    = "${file("${path.module}/userdata-etcd.yml")}"
  config_drive = false
}

resource "openstack_compute_secgroup_v2" "etcd_group" {
  name        = "etcd_group"
  description = "security group for etcd: SSH and etcd client / cluster"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 2379
    to_port     = 2380
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}
