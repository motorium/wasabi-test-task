
resource wasabi_user users {
    for_each = toset(var.users_list)

    name = each.key
}


module "sales_bucket" {
    source      = "../../modules/bucket"

    access_key = var.access_key
    secret_key = var.secret_key    

    bucket_name = "sales-data-bucket-123321"
    region      = var.region
    users = [
    {
        name   = "alice"
        policy = "read-write"
    },
    {
        name   = "backup"
        policy = "read-only"
    },    
    {
        name   = "bob"
        policy = "read-write"
    }
    ]

}

module "marketing_bucket" {
    access_key = var.access_key
    secret_key = var.secret_key    

    source      = "../../modules/bucket"
    bucket_name = "marketing-data-bucket-123321"
    region      = var.region
    users = [
    {
        name   = "alice"
        policy = "read-write"
    },
    {
        name   = "bob"
        policy = "read-write"
    },
    {
        name   = "backup"
        policy = "read-only"
    }
    ]

}

module "engineering_bucket" {
    access_key = var.access_key
    secret_key = var.secret_key    

    source      = "../../modules/bucket"
    bucket_name = "engineering-data-bucket-123321"
    region      = var.region
    users = [
    {
        name   = "alice"
        policy = "read-only"
    },
    {
        name   = "bob"
        policy = "read-write"
    },
    {
        name   = "backup"
        policy = "read-only"
    }    
    ]

}

module "finance_bucket" {
    access_key = var.access_key
    secret_key = var.secret_key    

    source      = "../../modules/bucket"
    bucket_name = "finance-data-bucket-123321"
    region      = var.region
    users = [
    {
        name   = "charlie"
        policy = "read-write"
    },
    {
        name   = "bob"
        policy = "read-write"
    },
    {
        name   = "backup"
        policy = "read-only"
    }    
    ]

}


module "operations_bucket" {
    access_key = var.access_key
    secret_key = var.secret_key    

    source      = "../../modules/bucket"
    bucket_name = "operations-data-bucket-123321"
    region      = var.region
    users = [
    {
        name   = "charlie"
        policy = "read-only"
    },
    {
        name   = "bob"
        policy = "read-write"
    },
    {
        name   = "backup"
        policy = "read-only"
    }    
    ]

}

