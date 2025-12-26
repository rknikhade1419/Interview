data "aws_vpc" "vpc_available"{
    filter{
        name = "tag:Name"
        value = ["tcw_vpc"]
    }
}

data "aws_subnet_ids" "available_db_subnet"{
    vpc_id = data.aws_vpc.vpc_available.id
    filter {
        name = "tag=Name"
        values = ["tag_database*"]
    }
}

data "aws_availability_zones" "available"{
    state = "available"
}

data "aws_security_group" "tcw_sg"{
    fiter = {
        name = "tag:Name"
        values = ["tcw_security_group"]
    }
}