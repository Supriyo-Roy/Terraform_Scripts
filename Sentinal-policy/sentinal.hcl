import "tfplan/v2" as tfplan

# Define the allowed instance types
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

# Function to check if all nodes have labels
nodes_have_labels = func() {
    all_nodes = tfplan.filter_resources("kubernetes_node")
    all_nodes_with_labels = all_nodes.filter( r -> length(r.applied.metadata.labels) > 0 )
    all_nodes_with_labels.length() == all_nodes.length()
}

# Main rule to enforce both instance type restriction and node label requirement
main = rule {
    instance_types_allowed() and nodes_have_labels()
}

