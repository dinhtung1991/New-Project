resource "aws_lb" "network_load_balancer" {
  name                       = "${var.project_name}-nlb"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = toset(split(",", var.private-ec2-subnet_id))

  enable_deletion_protection = false

  tags = {
    name = "${var.project_name}-nlb"
  }
}

resource "aws_lb_target_group" "nlb_targert_group" {
  name_prefix = "${var.project_name}-tg"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"

  vpc_id = var.vpc_id
  
  health_check {
    enabled                 = true
    protocol                = "TCP"
    healthy_threshold       = 3
    unhealthy_threshold     = 3
    timeout                 = 10
    interval                = 30
  }

  lifecycle {
    create_before_destroy  = true
  }

  # number_of_instances      = "${var.private_instance_count}"
  # instances                = [ "${aws_instance.instance_01.id}", "${aws_instance.instance_02.id}" ]
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.network_load_balancer.arn
  port              = 8686
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_targert_group.arn
  }
}

resource "aws_lb_target_group_attachment" "lb_target_group_attachment_01" {    
  
  target_group_arn = aws_lb_target_group.nlb_targert_group.arn
  target_id        = "${var.target_id_01}"
  port             = 80
}
resource "aws_lb_target_group_attachment" "lb_target_group_attachment_02" {    
  target_group_arn = aws_lb_target_group.nlb_targert_group.arn
  target_id        = "${var.target_id_02}"
  port             = 80


}
