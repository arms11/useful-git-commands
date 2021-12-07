####
# DISCLAIMER: Below are all the Git commands I have used in my personal or professional projects. They are here for anyone's benefit.
# I take no responsibility of how it works on local environments and may not be up-to-date.
# Please use it at your own risk. 
####

# This is the command you should always use to keep your repo structure up-to-date
git fetch --all –prune
 
# Tracking the remote branch is complicated in SourceTree considering we have too many! This solution will take care of that issue!
# Only applicable to JIRA and Atlassian Users using SourceTree
git branch -r | grep -w "<JIRA Number>"

# creates a local branch and also performs checkout
git checkout -b <BRANCH_NAME>

# Checkout is easy! Please make sure to grab the branch name beginning either of the three listed words
# Way too personal! Only applies to those who have some prefix to the branch names
git checkout <remote branch> = <remote branch> = feature/.. bugfix/..featurepack/...

# This pulls all the changes from master OR main to your branch. Always do this before the final check-in!
git pull origin <master | main>

# Use it for cherry-picking. I do this when I need to pick commit that belongs to one branch and need to go to another.
git cherry-pick <COMMIT NUMBER> 
 
# Rebasing only if you want to squash commits in the back-ported branch. Use this to at least modify the message if not squashing the commits.
git rebase -i HEAD~<number of commits>
 
# Always add meaningful message that helps reviewers reviewing the commit as well you when you come back to it after long time!!!
git commit -m "<MESSAGE>" 
 
# Push the changes to the remote tracking branch from local.
git push origin  

# Branch Rebasing Strategy….
 
git fetch --all --prune
git rebase origin/master 
# Resolve any conflicts
git push --force origin HEAD:<REMOTE_BRANCH_NAME>

# https://coderwall.com/p/x3jmig/remove-all-your-local-git-branches-but-keep-master 
# Helps me delete everything except master and the branch I am currently in, just in case.
# USE THIS CAUTIOUSLY!!!
git branch | grep -E -v "(master|\*)" | xargs git branch -D

# This is when you royally messed up!!! 
# One last forgiveness git has for ya!!!
# When reset --hard was done on uncommitted changes that you want to retain
git fsck --lost-found
git show <blob hash>

# Rebase for branch created from release branch (i.e. release/19.3.0.0)
# Rebasing from anything other than master/main
git rebase -i origin/release/19.3.0.0

# Revert the file to its original state as it is in master
# This will keep the file in staged mode. It will need to committed back and pushed to the remote to revert it appropriately.
git checkout origin/master <LOCAL_PHYSICAL_PATH_TO_FILE>

# Reverting Commit(s):
# create a new branch
git revert -n 577d3517f6b # Commit Hash
# stage your commit and push update to branch
# create revert pr. You have to be careful if it has multiple commits and you have to revert the commits in reverse order (bottom up). 

# Remove the file completely from the history!!! Handy when you just want to start clean!!!
# Worked for me, however as the note suggest, please BE CAREFUL!!!
# Ref: https://stackoverflow.com/a/43762489
git filter-branch --tree-filter 'rm -f <path_to_file>' HEAD
git push origin --force --all

