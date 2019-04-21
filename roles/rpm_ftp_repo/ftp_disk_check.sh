#!/bin/bash

tobytes() {
  for v in "${@:-$(</dev/stdin)}"
  do  
    echo $v | awk \
      'BEGIN{IGNORECASE = 1}
       function printpower(n,b,p) {printf "%u\n", n*b^p; next}
       /[0-9]$/{print $1;next};
       /K(iB)?$/{printpower($1,  2, 10)};
       /M(iB)?$/{printpower($1,  2, 20)};
       /G(iB)?$/{printpower($1,  2, 30)};
       /T(iB)?$/{printpower($1,  2, 40)};
       /KB$/{    printpower($1, 10,  3)};
       /MB$/{    printpower($1, 10,  6)};
       /GB$/{    printpower($1, 10,  9)};
       /TB$/{    printpower($1, 10, 12)}'
  done
}

total=0; for size in $(yum repoinfo all | grep -i repo-size | sed 's/\s*//g' | awk -F ':' '{ print $2 }'); do let total="$total + $(tobytes $size)"; done;
space=$(df -h /var | tail -1 | awk '{ print $4 }' | tobytes)

echo "Total repo size         : $total"
echo "Available space in /var : $space"

if [ $space -lt $total ];
then
  echo "Not enough space in /var to pull repos"
  exit 1
fi

