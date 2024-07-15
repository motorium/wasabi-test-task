variable region {
    type        = string
    default     = "us-east-1"
}


variable bucket_name {
    type        = string
}

variable users {
    type = list(object({
        name   = string
        policy = string
    }))
}

variable access_key {
    type        = string
}

variable secret_key {
    type        = string
    sensitive   = true
}
