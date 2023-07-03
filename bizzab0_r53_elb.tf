resource "aws_elb" "bizzabo" {
  name            = "bizzabo"
  subnets         = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
  security_groups = [aws_security_group.bizzabo_sg.id]


  listener {
    instance_port     = 443
    instance_protocol = "http"
    lb_port           = 443
    lb_protocol       = "http"
  }
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  #  instances                   = 
  #  idle_timeout                = 400
  #  connection_draining         = true
  #  connection_draining_timeout = 400


}

resource "aws_route53_zone" "private" {
  name = "test.com"

  vpc {
    vpc_id = aws_vpc.vpc_main.id
  }
}


resource "aws_route53_record" "bizza" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "bizzabo.${aws_route53_zone.private.name}"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_elb.bizzabo.dns_name]
  #records = [aws_elb.bizzabo[0].dns_name, aws_elb.bizzabo[1].dns_name]
}