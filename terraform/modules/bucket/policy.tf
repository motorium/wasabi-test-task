resource "wasabi_policy" "read_only" {

    name = "${var.bucket_name}-ro-policy"

    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Action = ["s3:Get*", "s3:List*"],
            Effect = "Allow",
            Resource = [
            "arn:aws:s3:::${var.bucket_name}",
            "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
        ]
    })
}

resource wasabi_policy read_write {
    
    name = "${var.bucket_name}-rw-policy"

    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Action = ["s3:ListBucket", "s3:*Object"],
            Effect = "Allow",
            Resource = [
            "arn:aws:s3:::${var.bucket_name}",
            "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
        ]
    })
}

resource wasabi_user_policy_attachment attachment {
    for_each = { for user in var.users : user.name => user }
    user       = each.value.name
    policy_arn = each.value.policy == "read-only" ? wasabi_policy.read_only.arn : wasabi_policy.read_write.arn

}
