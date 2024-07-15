variable region {
    type        = string
    default     = "us-east-1"
}

variable access_key {
    type        = string
}

variable secret_key {
    type        = string
    sensitive   = true
}

variable users_list {
    type = list(string)
}
