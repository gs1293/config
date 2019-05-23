for pip_package in $(pip list 2> /dev/null | awk '{print $1}')
do
    printf "\t\t%s\n" "✓✓ $pip_package"
    sudo -H pip install --ignore-install "$pip_package" --upgrade "$pip_package"
done

