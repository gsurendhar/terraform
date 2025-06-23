module "ec2" {
    source          = "../modules"
    sg_ids          = var.sg_ids
    tags            = var.tags
    instance_type   = var. instance_type
}