 #Restrict Instance Size

 import "tfplan/v2" as tfplan

# Define the instance types that are allowed
allowed_instance_types = [
    "t2.micro",
    "t2.small",
    "t2.medium"
]

# Function to check if all instances are of allowed types
instance_types_allowed = func() {
    all_instances = tfplan.filter_resources("aws_instance")
    all_instances_types = all_instances.map( r -> r.applied.instance_type )
    all_instances_types.every(instance_type -> instance_type in allowed_instance_types)
}

# Main rule to enforce the instance type restriction
main = rule {
    instance_types_allowed()
}
