PULL = $(git pull)
EARLY_RELEASE=$(git tag -l | sort -r | tail -1 | head -n2 )
LAST_RELEASE=$(git tag -l | sort -r | head -n1)

CHANGELOG=$(git log ${EARLY_RELEASE}..${LAST_RELEASE} --pretty=format:"%h - %s (%an, %ar)")
echo "Changelog: ${CHANGELOG}"