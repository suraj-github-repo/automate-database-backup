# S3 bucket name
BUCKET=intelliconvo-qa/backup/
BACKUPBUCKET=intelliconvo-qa/backup/

# Linux user account
USER=ubuntu

# Backup directory
DEST=/home/$USER/workspace/devops/mongodb/

# Dump z2p & poststodos
DATE=`date +"%d_%b_%Y_%H%M"`
MONGOFILE='/home/ubuntu/workspace/devops/mongodb/db_backup_${DATE}.db'
HOST='localhost'
DATABASE='intelliconvo'
#USER='root'
AUTH_DB='admin'
PASSWORD='rootpswd'
CONNECTION_STRING="mongodb://root:rootpswd@13.126.209.38:37017/?authMechanism=SCRAM-SHA-1&authSource=admin"

echo $CONNECTION_STRING
mongodump -h $HOST -u ${USER} -p${PASSWORD} --authenticationDatabase $AUTH_DB -d ${DATABASE} --out=${MONGOFILE}.gz

# File name
TIME=`/bin/date --date='+5 hour 30 minutes' '+%d-%m-%Y-%I-%M-%S-%p'`

# Tar file of backup directory
TAR=$DEST/../$TIME.tar

# Create tar of backup directory
/bin/tar cvf $TAR -C $DEST .

# Upload tar to s3
/usr/bin/aws s3 cp $TAR s3://$BUCKET
#/usr/bin/aws s3 cp $TAR s3://$BACKUPBUCKET

# Remove tar file locally
/bin/rm -f $TAR

# Remove backup directory
/bin/rm -rf $DEST

# All done
echo "Backup available at https://s3.amazonaws.com/$BUCKET/$TIM..."
