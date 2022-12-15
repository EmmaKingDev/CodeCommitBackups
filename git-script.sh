i=1;
for repo in "$@" #arguments passed on buildspec.yml
do
    echo "repository - $i: $repo";
    git clone codecommit::eu-central-1://$repo #CHANGE TO YOUR REGION
    dt=$(date '+%d-%m-%Y-%H:%M:%S');
    echo "$dt" 
    zip -yr $dt-$repo-backup.zip ./
    aws s3 cp $dt-$repo-backup.zip s3://test-codecommit-backups #pre-existing S3 bucket
    i=$((i + 1));
done