setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/test-netz98-n8n-addon
  mkdir -p $TESTDIR
  export PROJNAME=test-netz98-n8n-addon
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev start -y >/dev/null
}

health_checks() {
  # wait until the service is started
  sleep 10
  # Do something useful here that verifies the add-on
  ddev exec "curl -s http://n8n:5678" | grep n8n.io
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  if ddev restart; then
    ddev logs -s n8n
  fi
  health_checks
}

@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get netz98/ddev-n8n with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get netz98/ddev-n8n
  if ddev restart >/dev/null; then
    ddev logs -s n8n
  fi
  health_checks
}
