for pip3_package in $(pip3 list 2> /dev/null | awk '{print $1}')
do
    printf "\t\t%s\n" "✓✓ $pip3_package"
    sudo -H pip3 install --ignore-install "$pip3_package" --upgrade "$pip3_package"
done

