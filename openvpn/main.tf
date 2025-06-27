
resource "aws_security_group" "openvpn" {
  name        = "openvpn"
  description = "openvpn to connect laptop"
  vpc_id      =  "vpc-05575e7af3e27fa8b"
}

# vpn connection to open 22,443,943,1194 ports 
resource "aws_security_group_rule" "vpn_ports" {
  count             = length(var.vpn_ports)
  type              = "ingress"
  from_port         = var.vpn_ports[count.index]
  to_port           = var.vpn_ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.openvpn.id 
}

variable "vpn_ports" {
  default = [22, 443, 943, 1194]
}

resource "aws_key_pair" "openvpn" {
    key_name   = "openvpn"
    public_key = file("C:\\Users\\mahes\\OneDrive\\Pictures\\DevOps\\suri.pub")
}

resource "aws_instance" "vpn" {
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.openvpn.id]
  key_name                = aws_key_pair.openvpn.key_name
  user_data               = file("openvpn.sh")
  tags    =    {
    Name = "OpenVPN"
  }
}