
variable "account_name" {
  type        = string
  description = "Account name tag"
  default     = null
}

variable "project_name" {
  type        = string
  description = "Project name tag"
  default     = null
}

variable "env" {
  type        = string
  description = "Environment tag (e.g., dev, staging, prod)"
  default     = null
}

variable "project_code" {
  type        = string
  description = "Short project code used in naming (required for group name)"
  default     = null
}

variable "location" {
  type        = string
  description = "Location/region tag"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to the resource group"
  default     = null
}

variable "aws_region" {
  type        = string
  description = "AWS region for the provider (defaults to us-east-1 if null)"
  default     = null
}

