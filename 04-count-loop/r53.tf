resource "aws_route53_record" "roboshop_records" {
  count   = length(var.instances)
  zone_id = "Z09423303UD7JE5COLBZI"
  name    = "${var.instances[count.index]}-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop_instances[count.index].private_ip]
}

resource "aws_route53_record" "frontend-record" {
  count   = contains(var.instances, "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop_instances[index(var.instances, "frontend")].public_ip]

}
