resource "aws_route53_record" "roboshop_records" {
  for_each = var.instances
  zone_id  = "Z09423303UD7JE5COLBZI"
  name     = "${each.key}-${var.environment}.${var.domain}"
  type     = "A"
  ttl      = "1"
  records  = [aws_instance.roboshop_instances[each.key].private_ip]
}

resource "aws_route53_record" "frontend-record" {
  count   = contains(keys(var.instances), "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop_instances["frontend"].public_ip]

}
