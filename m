Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEC410E83E
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:40 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nOxQ0-000WkG-Nn
 for igt-dev@lists.freedesktop.org; Tue, 01 Mar 2022 08:59:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Mar 2022 08:59:27 +0100
Message-Id: <20220301075929.125733-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
References: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 7/9] scripts/run-tests.sh: add code coverage
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

When the Kernel is built with GCOV_KERNEL and one or more drivers are
built with GCOV_PROFILE enabled[1], the Kernel will collect code
coverage usage at the same time as a test runs.

Add support at run-tests.sh to collect usage data and store them on
.info files.

That actually require two new options:

-c <test_name>: will store the tests under test_name.info;
-k <kernel_tree>: Points to the source code of the built Kernel.

The Kernel tree can be a partial tree, provided that it contains at
least all *.h files used by the drivers, plus the *.c files that were
built with gcov support enabled.

[1] See https://01.org/linuxgraphics/gfx-docs/drm/dev-tools/gcov.html

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/run-tests.sh | 52 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index 8399b6d15aa9..6986232e8eb4 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -29,6 +29,11 @@ RESULTS="$ROOT/results"
 PIGLIT=`which piglit 2> /dev/null`
 IGT_RUNNER=
 IGT_RESUME=
+IGT_KERNEL_TREE=
+COV_ARGS=
+COV_PER_TEST=
+LCOV_CMD="lcov"
+KERNEL_TREE=
 USE_PIGLIT=0
 RUNNER=
 RESUME=
@@ -84,6 +89,15 @@ function find_runner_binary # basename
 	return 1
 }
 
+function find_lcov_binary # basename
+{
+	if command -v $LCOV_CMD &> /dev/null; then
+		return 0
+	fi
+
+	return 1
+}
+
 function download_piglit {
 	git clone https://anongit.freedesktop.org/git/piglit.git "$ROOT/piglit"
 }
@@ -96,10 +110,10 @@ function execute_runner # as-root <runner> <args>
 	shift
 	local sudo
 
-	export IGT_TEST_ROOT IGT_CONFIG_PATH
+	export IGT_TEST_ROOT IGT_CONFIG_PATH IGT_KERNEL_TREE
 
 	if [ "$need_root" -ne 0 -a "$EUID" -ne 0 ]; then
-		sudo="sudo --preserve-env=IGT_TEST_ROOT,IGT_CONFIG_PATH"
+		sudo="sudo --preserve-env=IGT_TEST_ROOT,IGT_CONFIG_PATH,IGT_KERNEL_TREE"
 	fi
 
 	$sudo $runner "$@"
@@ -108,8 +122,14 @@ function execute_runner # as-root <runner> <args>
 function print_help {
 	echo "Usage: run-tests.sh [options]"
 	echo "Available options:"
+	echo "  -c <capture_script>"
+	echo "                  capture gcov code coverage using the <capture_script>."
+	echo "  -P              store code coverage results per each test. Should be"
+	echo "                  used together with -k option"
 	echo "  -d              download Piglit to $ROOT/piglit"
 	echo "  -h              display this help message"
+	echo "  -k <kernel_dir> Linux Kernel source code directory used to generate code"
+	echo "                  coverage builds."
 	echo "  -l              list all available tests"
 	echo "  -r <directory>  store the results in directory"
 	echo "                  (default: $RESULTS)"
@@ -134,11 +154,14 @@ function print_help {
 	echo "Useful patterns for test filtering are described in the API documentation."
 }
 
-while getopts ":dhlr:st:T:vx:Rnpb:" opt; do
+while getopts ":c:dhk:lPr:st:T:vx:Rnpb:" opt; do
 	case $opt in
+		c) COV_ARGS="$COV_ARGS --collect-code-cov --collect-script $OPTARG " ;;
 		d) download_piglit; exit ;;
 		h) print_help; exit ;;
+		k) IGT_KERNEL_TREE="$OPTARG" ;;
 		l) LIST_TESTS="true" ;;
+		P) COV_ARGS="$COV_ARGS --coverage-per-test"; COV_PER_TEST=1 ;;
 		r) RESULTS="$OPTARG" ;;
 		s) SUMMARY="html" ;;
 		t) FILTER="$FILTER -t $OPTARG" ;;
@@ -172,6 +195,18 @@ if [ "x$PIGLIT" == "x" ]; then
 	PIGLIT="$ROOT/piglit/piglit"
 fi
 
+if [ "x$COV_ARGS" != "x" ]; then
+	if [ "$USE_PIGLIT" -eq "1" ]; then
+		echo "Cannot collect code coverage when running tests with Piglit. Use igt_runner instead."
+		exit 1
+	fi
+
+	if ! $(find_lcov_binary); then
+		echo "Can't check code coverage, as 'lcov' is not installed"
+		exit 1
+	fi
+fi
+
 RUN_ARGS=
 RESUME_ARGS=
 LIST_ARGS=
@@ -201,15 +236,20 @@ else
 fi
 
 if [ "x$LIST_TESTS" != "x" ]; then
-	execute_runner 0 $RUNNER $LIST_ARGS $FILTER
+	execute_runner 0 $RUNNER $LIST_ARGS $FILTER $COV_ARGS
 	exit
 fi
 
 if [ "x$RESUME_RUN" != "x" ]; then
-	execute_runner 1 $RESUME $RESUME_ARGS "$RESULTS"
+	if [ "x$COV_ARGS" != "x" -a "x$COV_PER_TEST" == "x" ]; then
+		echo "Can't continue collecting coverage tests. Next time, run"
+		echo "$0 with '-P' in order to generate separate code coverage results".
+		exit 1
+	fi
+	execute_runner 1 $RESUME $RESUME_ARGS $COV_ARGS "$RESULTS"
 else
 	mkdir -p "$RESULTS"
-	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $VERBOSE $FILTER
+	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER
 fi
 
 if [ "$SUMMARY" == "html" ]; then
-- 
2.35.1
