########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.6"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# Enterprise Application Service Instance
########################################################################################################################

module "ease" {
  source            = "../../"
  ease_name         = var.prefix
  resource_group_id = module.resource_group.resource_group_id
  tags              = var.resource_tags
}
