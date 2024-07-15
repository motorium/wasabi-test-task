output created_users {
    value = [for user in wasabi_user.users : user.name]
}