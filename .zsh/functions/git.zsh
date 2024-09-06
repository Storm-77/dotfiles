
rcl(){

    if [ -n "${1+x}" ]; then
        sesh clone -d $REPOS_DIR $1
    else
        echo "No repo link provided"
    fi
}

rbcl() {
    if [ -z "$1" ]; then
        echo "Usage: rbcl <repository-url>"
        return 1
    fi

    # Extract the repository name from the URL
    repo_name=$(basename "$1" .git)
    repo_path="$REPOS_DIR/$repo_name"
    # Clone the repository
    git clone --bare "$1" $repo_path
    sesh connect $repo_path
    
}
