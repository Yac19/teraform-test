resource "aws_lb" "Yac-LB" {
  name               = local.elb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Yacine-security-group-for-LB.id]
  subnets            = [data.aws_subnet.public-subnet-1.id, data.aws_subnet.public-subnet-2.id]
}

resource "aws_lb_target_group" "main-tg" {
  name     = local.elb_tg
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "main-tg-attach" { # Relie le target group du LB à l'instance qui sera créer (webserver)
  target_group_arn = aws_lb_target_group.main-tg.arn
  target_id        = aws_instance.Yac-instance.id
  port             = 80
}

resource "aws_lb_listener" "main" { # Le listerner écoute sur le port 80 et redirige le flux au load balancer
  load_balancer_arn = aws_lb.Yac-LB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main-tg.arn
  }
}