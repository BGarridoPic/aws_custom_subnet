
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["brian-vpc-exersises"] 
  }
}

resource "aws_subnet" "main" {
  vpc_id = data.aws_vpc.selected.id

  cidr_block = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)

  tags = merge(
    {
      "Name"        = var.subnet_name
      "Owner"       = var.owner_tag
      "Environment" = upper(var.environment_tag)
    },
    var.subnet_tags
  )
}