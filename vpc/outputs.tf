output "region" {
    value = "var.region"
}
output "vpc1" {
    value = "aws_vpc.vpc1.id"
}

output "publicsubnet1" {
    value = "aws_subnet.publicsubnet1.id"
}

output "publicsubnet2" {
    value = "aws_subnet.publicsubnet2.id"
}

output "websubnet1" {
    value = "aws_subnet.websubnet1.id"
}

output "websubnet2" {
    value = "aws_subnet.websubnet2.id"
}

output "dbsubnet1" {
    value = "aws_subnet.dbsubnet1.id"
}

output "dbsubnet2" {
    value = "aws_subnet.dbsubnet2.id"
}