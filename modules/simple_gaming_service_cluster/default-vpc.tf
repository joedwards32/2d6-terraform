# Default VPC data

data aws_vpc default {
  default = true
}

data aws_subnet_ids current {
  vpc_id = data.aws_vpc.default.id
}

locals {
  subnet_ids = tolist(data.aws_subnet_ids.current.ids)
}
