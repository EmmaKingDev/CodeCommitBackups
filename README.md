﻿# CodeCommitBackups

CodeBuild uses the Buildspec.yml to create an environment to run a git-script.sh script that creates git clones out of all the repositories and zip’s the files to an S3 bucket. The repositories are queried using AWS CLI in the buildspec.yml and then passed as arguments to the script. This way every time the script runs it has the current repository listing. The S3 bucket ‘codecommit-backups’ has paths to each repositories zip-files, names 'date-repositoryname-backup.zip'. The git-script.sh needs to reside in the root of the same CodeCommit repository where buildspec.yml is stored.

Can be hooked to AWS EventBridge to run for example once a week.
