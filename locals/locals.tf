locals {
  final_name = "${var.Project}-${var.environment}"
  ec2_tags = merge(
    var.common_tags,
    {
      version     = "1.1"
      environment = var.environment
     
    }
  )
}
