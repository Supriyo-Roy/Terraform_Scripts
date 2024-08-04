# Ensure Nodes Have Labels

import "tfplan/v2" as tfplan

# Function to check if all nodes have labels
nodes_have_labels = func() {
    all_nodes = tfplan.filter_resources("kubernetes_node")
    all_nodes_with_labels = all_nodes.filter( r -> length(r.applied.metadata.labels) > 0 )
    all_nodes_with_labels.length() == all_nodes.length()
}

# Main rule to enforce the node label requirement
main = rule {
    nodes_have_labels()
}
