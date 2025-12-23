locals {
  group_name = "GITHUB-${var.project_code}-rg"
  base_tags = {
    for k, v in {
      project_name = var.project_name
      env          = var.env
      project_code = var.project_code
      location     = var.location
    } : k => v if v != null
  }
  merged_tags = merge(
    local.base_tags,
    var.tags != null ? var.tags : {},
    { Name = local.group_name }
  )
  base_tag_filters = [
    for key, value in {
      project_name = var.project_name
      env          = var.env
      project_code = var.project_code
      location     = var.location
      } : value == null ? null : {
      Key    = key
      Values = [value]
    }
  ]
  tag_filters = [for tf in local.base_tag_filters : tf if tf != null]
}

resource "aws_resourcegroups_group" "this" {
  name        = local.group_name
  description = "Resource group for project ${var.project_code}"
  resource_query {
    query = jsonencode({
      ResourceTypeFilters = ["AWS::AllSupported"]
      TagFilters          = local.tag_filters
    })
  }
  tags = local.merged_tags
}