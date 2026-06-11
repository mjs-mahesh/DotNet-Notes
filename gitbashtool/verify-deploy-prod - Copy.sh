declare -A projects=( ["lp-svc-employer"]="0c23f53" ["lp-svc-leave"]="b0c45ef" ["lp-svc-lis"]="3622b3d" ["lp-svc-lookup"]="0ad23c6" ["lp-svc-note"]="3965c0f" ["lp-svc-omni"]="39aee52" ["lp-svc-pem"]="f5dc71b" ["lp-svc-plan"]="e6afbb4" ["lp-svc-task"]="14520b8" ["lp-svc-wizard"]="ea57560")

if [ -z "$1" ]
  then
    echo "Parameter prod/pp2/pp3/cs must be supplied"
    exit 1;
fi

if [ -z "$2" ]
  then
    echo "Parameter rs/saas must be supplied"
    exit 1;
fi

for project in "${!projects[@]}"
do
    if [ $(curl -s https://$2-$project-$1.alsprod.aws.alight.com/info | grep -c ${projects[$project]}) -eq 1 ]
    then
        echo $project ${projects[$project]} ===DEPLOYED OK===
    else
        echo $project ${projects[$project]} ***NOT DEPLOYED***
    fi
done