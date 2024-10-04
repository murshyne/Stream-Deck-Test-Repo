if [ ! -f version.txt ]; then
    echo "0.1" > version.txt
    git init
    git remote add origin "insert url"
    echo "Initialized a new Git repository."
else
    version=$(cat version.txt)
    new_version=$(printf "%.1f" "$(echo "$version + 0.1" | bc)")
    echo "$new_version" > version.txt
fi
timestamp=$(date +%c)
git add .
git commit -m "Commit $new_version at: $timestamp"
git push origin main
echo "Committed with version $new_version."
