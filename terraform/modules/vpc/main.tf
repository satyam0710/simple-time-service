# VPC resources

resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name        = var.name,
      Environment = var.environment
    },
    var.tags
  )
}

# Internet Gateway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = merge(
    {
      "Name" = format(
        "%s-igw-%s",
        var.name, var.environment
      )
    },
    var.tags
  )
}

#  Private Route Table
resource "aws_route_table" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id = aws_vpc.default.id

  tags = merge(
    {
      "Name" = format(
        "%s-private-route-table-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags
  )
}

#  Private Route 

resource "aws_route" "private" {
  count = length(var.private_subnet_cidr_blocks)

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default[count.index].id
}

#  Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id

  tags = merge(
    {
      "Name" = format(
        "%s-public-route-table",
        var.name
      )
    },
    var.tags
  )
}

# Public Route

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Private Subnet
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    {
      "Name" = format(
        "%s-private-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.private_subnet_tags
  )

}

# Public Subnet 

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = format(
        "%s-public-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.public_subnet_tags
  )
}

# Private Route table Association
resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

# Public Route table Association

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# NAT resources
resource "aws_eip" "nat" {
  count = length(var.public_subnet_cidr_blocks)
}

# NAT Gateway

resource "aws_nat_gateway" "default" {
  depends_on = [aws_internet_gateway.default]

  count = length(var.public_subnet_cidr_blocks)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id


  tags = merge(
    {
      "Name" = format(
        "%s-nat-gateway-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags
  )

}
