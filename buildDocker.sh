# !/bin/bash
RELEASE_TAG=$(git describe --tags HEAD)

echo "Start build docker"
docker build -t app:${RELEASE_TAG} .
docker run -it app:${RELEASE_TAG}

echo "Start createTicket.sh"
sh createTicket.sh
echo "Start runTests.sh"
sh runTests.sh
echo "Docker started. Tests done."