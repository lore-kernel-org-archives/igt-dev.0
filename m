Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEA299914
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 15:48:39 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id b142so5615441iof.10
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 08:48:39 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org,
	petri.latvala@intel.com
Date: Tue, 16 Aug 2022 10:47:50 -0500
Message-Id: <20220816154750.1366623-1-jfree@freebsd.org>
In-Reply-To: <YvtVqT6ENAUeIFEo@platvala-desk.ger.corp.intel.com>
References: <YvtVqT6ENAUeIFEo@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] Checked shebang changes against
 checkbashisms script
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

---
 scripts/code_cov_capture         |  4 +++-
 scripts/code_cov_gen_report      | 22 ++++++++++--------
 scripts/code_cov_selftest.sh     |  4 +++-
 scripts/generate_clear_kernel.sh | 40 ++++++++++++++++----------------
 scripts/run-tests.sh             | 22 +++++++++---------
 tests/generate_testlist.sh       |  6 ++---
 6 files changed, 52 insertions(+), 46 deletions(-)

diff --git a/scripts/code_cov_capture b/scripts/code_cov_capture
index 73c1567d..0503f284 100755
--- a/scripts/code_cov_capture
+++ b/scripts/code_cov_capture
@@ -1,7 +1,9 @@
 #!/bin/sh
 
-trap 'catch $LINENO' ERR
+set -e
+trap 'catch $LINENO' EXIT
 catch() {
+	[ $? -eq 0 ] && exit
 	echo "$0: error on line $1. Code coverage not stored." >&2
 	exit 1
 }
diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
index b6bc703f..ffc8142e 100755
--- a/scripts/code_cov_gen_report
+++ b/scripts/code_cov_gen_report
@@ -4,8 +4,10 @@ MERGED_INFO="merged"
 GATHER_ON_BUILD="code_cov_gather_on_build.sh"
 PARSE_INFO="code_cov_parse_info.pl"
 
-trap 'catch $LINENO' ERR
+set -e
+trap 'catch $LINENO' EXIT
 catch() {
+	[ $? -eq 0 ] && exit
 	echo "$0: error on line $1. HTML report not generated."
 	exit $1
 }
@@ -41,7 +43,7 @@ while [ "$1" != "" ]; do
 		MODE=tar.gz
 		;;
 	--kernel-source|-k)
-		if [ "$2" == "" ]; then
+		if [ "$2" = "" ]; then
 			usage 1
 		else
 			KSRC=$(realpath $2)
@@ -49,7 +51,7 @@ while [ "$1" != "" ]; do
 		fi
 		;;
 	--kernel-object|-O)
-		if [ "$2" == "" ]; then
+		if [ "$2" = "" ]; then
 			usage 1
 		else
 			KOBJ=$(realpath $2)
@@ -57,7 +59,7 @@ while [ "$1" != "" ]; do
 		fi
 		;;
 	--output-dir|-o)
-		if [ "$2" == "" ]; then
+		if [ "$2" = "" ]; then
 			usage 1
 		else
 			DEST_DIR=$(realpath $2)
@@ -65,7 +67,7 @@ while [ "$1" != "" ]; do
 		fi
 		;;
 	--read|-r)
-		if [ "$2" == "" ]; then
+		if [ "$2" = "" ]; then
 			usage 1
 		else
 			RESULTS=$(realpath $2)
@@ -76,7 +78,7 @@ while [ "$1" != "" ]; do
 		PARSE_ARGS="$PARSE_ARGS $1"
 		;;
 	--func-filters|--source-filters)
-		if [ "$2" == "" ]; then
+		if [ "$2" = "" ]; then
 			usage 1
 		else
 			PARSE_ARGS="$PARSE_ARGS $1 $2"
@@ -98,7 +100,7 @@ while [ "$1" != "" ]; do
 	shift
 done
 
-if [ "x$RESULTS" == "x" -o "x$KSRC" == "x" -o "x$DEST_DIR" == "x" -o "x$MODE" == "x" ]; then
+if [ "x$RESULTS" = "x" -o "x$KSRC" = "x" -o "x$DEST_DIR" = "x" -o "x$MODE" = "x" ]; then
 	echo "Missing a mandatory argument"
 	usage 1
 fi
@@ -137,7 +139,7 @@ if [ "$MODE" != "info" ]; then
 		echo -n "" >${MERGED_INFO}.info
 		for i in $RESULTS/*.tar.gz; do
 			TITLE=$(basename $i)
-			TITLE=${TITLE/.tar.gz/}
+			TITLE=$(basename $TITLE .tar.gz)
 
 			echo "Adding results from $i..."
 			tar xf $i
@@ -154,7 +156,7 @@ if [ "$MODE" != "info" ]; then
 		TITLE=${MERGED_INFO}
 	else
 		TITLE=$(basename $RESULTS)
-		TITLE=${TITLE/.tar.gz/}
+		TITLE=$(basename $TITLE .tar.gz)
 
 		echo "Adding results from $RESULTS..."
 		tar xf $RESULTS
@@ -176,7 +178,7 @@ else
 		cp $RESULTS .
 
 		TITLE=$(basename $RESULTS)
-		TITLE=${TITLE/.info/}
+		TITLE=$(basename $TITLE .info)
 	fi
 fi
 
diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
index 8d84b44c..c834fb5a 100755
--- a/scripts/code_cov_selftest.sh
+++ b/scripts/code_cov_selftest.sh
@@ -1,7 +1,9 @@
 #!/bin/sh
 
-trap 'catch $LINENO' ERR
+set -e
+trap 'catch $LINENO' EXIT
 catch() {
+	[ $? -eq 0 ] && exit
 	echo "===> ERROR: Code coverage selftest failed on $0:$1" >&2
         exit 1
 }
diff --git a/scripts/generate_clear_kernel.sh b/scripts/generate_clear_kernel.sh
index b000daed..99a32d27 100755
--- a/scripts/generate_clear_kernel.sh
+++ b/scripts/generate_clear_kernel.sh
@@ -25,7 +25,7 @@
 
 export ASSEMBLY_SOURCE=./lib/i915/shaders/clear_kernel
 
-function get_help {
+get_help() {
         echo "Usage: ${0} [options]"
         echo "Note: hsw_clear_kernel.c/ivb_clear_kernel.c automatically generated by this script should never be modified - it would be imported to i915, to use as it is..."
         echo " "
@@ -40,14 +40,14 @@ function get_help {
         echo " Usage example: \"./scripts/generate_clear_kernel.sh -g hsw -o hsw_clear_buffer.h -m ~/mesa/build/src/intel/tools/i965_asm\""
 }
 
-function include_array # $1=array_name - update Mesa output with desired format
+include_array() # $1=array_name - update Mesa output with desired format
 {
         array_declaration="static const u32 $(basename $1)_clear_kernel[] = {"
         close_array=";"
         sed -i "1s/.*/$array_declaration/" $output_file
         sed -i "$ s/$/$close_array/" $output_file
 }
-function prefix_header # $1=filename $2=comment
+prefix_header() # $1=filename $2=comment
 {
 	cat <<EOF
 // SPDX-License-Identifier: MIT
@@ -60,21 +60,21 @@ function prefix_header # $1=filename $2=comment
 EOF
 }
 
-function check_output_file #check output file
+check_output_file() #check output file
 {
         if [ "x$output_file" != "x" ]; then
                 if [ -f "$output_file" ]; then
-                        echo -e "Warning: The \"$output_file\" file already exist - choose another file\n"
+                        printf 'Warning: The "%s" file already exist - choose another file\n' "$output_file"
                         get_help
                         exit 1
                 fi
         else
                 # It is okay to overwrite default file created
-                echo -e "Output file not specified - using default file \"$gen_device-cb_assembled\"\n"
                 output_file="$gen_device-cb_assembled"
+		printf 'Output file not specified - using default file "%s"\n' "$output_file"
         fi
 }
-function asm_cb_kernel # as-root <args>
+asm_cb_kernel() # as-root <args>
 {
         check_output_file
 
@@ -82,22 +82,22 @@ function asm_cb_kernel # as-root <args>
         $mesa_i965_asm -g $gen_device -t c_literal  $input_asm_source -o $output_file
 
         if [ ! -f ${output_file} ]; then
-                echo -e "Failed to assemble CB Kernel with Mesa tool\n"
+                printf "Failed to assemble CB Kernel with Mesa tool\n"
                 get_help
                 exit 1
         fi
 
         # Generate header file
-        if [ "$gen_device" == "hsw" ]; then
-                echo "Generating gen7.5 CB Kernel assembled file \"hsw_clear_kernel.c\" for i915 driver..."
+        if [ "$gen_device" = "hsw" ]; then
+                printf 'Generating gen7.5 CB Kernel assembled file "hsw_clear_kernel.c" for i915 driver...'
 
                 i915_filename=hsw_clear_kernel.c
                 include_array $gen_device
                 prefix_header > $i915_filename
                 cat $output_file >> $i915_filename
 
-        elif [ "$gen_device" == "ivb" ]; then
-                echo "Generating gen7 CB Kernel assembled file \"ivb_clear_kernel.c\" for i915 driver..."
+        elif [ "$gen_device" = "ivb" ]; then
+                printf 'Generating gen7 CB Kernel assembled file "ivb_clear_kernel.c" for i915 driver...'
 
                 i915_filename=ivb_clear_kernel.c
                 include_array $gen_device
@@ -113,7 +113,7 @@ while getopts "hg:o:m:" opt; do
 		o) output_file="$OPTARG" ;;
                 m) mesa_i965_asm="$OPTARG" ;;
 		\?)
-			echo -e "Unknown option: -$OPTARG\n"
+			printf "Unknown option: -%s\n" "$OPTARG"
 			get_help
 			exit 1
 			;;
@@ -122,30 +122,30 @@ done
 shift $(($OPTIND-1))
 
 if [ "x$1" != "x" ]; then
-	echo -e "Unknown option: $1\n"
+	printf "Unknown option: %s\n" "$1"
 	get_help
 	exit 1
 fi
 
-if [ "x$mesa_i965_asm" == "x" ]; then
-        echo -e "i965_asm binary not found\n"
+if [ "x$mesa_i965_asm" = "x" ]; then
+        printf "i965_asm binary not found\n"
         get_help
         exit 1
 fi
 
 if [ "x$gen_device" != "x" ]; then
-        if [ "$gen_device" == "hsw" ]; then
+        if [ "$gen_device" = "hsw" ]; then
                 input_asm_source="${ASSEMBLY_SOURCE}/hsw.asm"
-        elif [ "$gen_device" == "ivb" ]; then
+        elif [ "$gen_device" = "ivb" ]; then
                 input_asm_source="${ASSEMBLY_SOURCE}/ivb.asm"
         else
-                echo -e "Unknown platform specified\n"
+                printf "Unknown platform specified\n"
                 get_help
                 exit 1
         fi
 	asm_cb_kernel
 else
-        echo -e "Platform generation not specified\n"
+        printf "Platform generation not specified\n"
         get_help
         exit 1
 fi
diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index 1ee5e5fb..6532e0aa 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -38,7 +38,7 @@ USE_PIGLIT=0
 RUNNER=
 RESUME=
 
-function find_file # basename <possible paths>
+find_file() # basename <possible paths>
 {
 	base=$1
 	shift
@@ -72,7 +72,7 @@ fi
 
 IGT_TEST_ROOT="`readlink -f ${IGT_TEST_ROOT}`"
 
-function find_runner_binary # basename
+find_runner_binary() # basename
 {
 	base=$1
 	shift
@@ -89,20 +89,20 @@ function find_runner_binary # basename
 	return 1
 }
 
-function find_lcov_binary # basename
+find_lcov_binary() # basename
 {
-	if command -v $LCOV_CMD &> /dev/null; then
+	if command -v $LCOV_CMD > /dev/null 2>&1; then
 		return 0
 	fi
 
 	return 1
 }
 
-function download_piglit {
+download_piglit() {
 	git clone https://anongit.freedesktop.org/git/piglit.git "$ROOT/piglit"
 }
 
-function execute_runner # as-root <runner> <args>
+execute_runner() # as-root <runner> <args>
 {
 	local need_root=$1
 	shift
@@ -112,14 +112,14 @@ function execute_runner # as-root <runner> <args>
 
 	export IGT_TEST_ROOT IGT_CONFIG_PATH IGT_KERNEL_TREE
 
-	if [ "$need_root" -ne 0 -a "$EUID" -ne 0 ]; then
+	if [ "$need_root" -ne 0 -a "$(id -u)" -ne 0 ]; then
 		sudo="sudo --preserve-env=IGT_TEST_ROOT,IGT_CONFIG_PATH,IGT_KERNEL_TREE"
 	fi
 
 	$sudo $runner "$@"
 }
 
-function print_help {
+print_help() {
 	echo "Usage: run-tests.sh [options]"
 	echo "Available options:"
 	echo "  -c <capture_script>"
@@ -191,7 +191,7 @@ if [ "x$1" != "x" ]; then
 	exit 1
 fi
 
-if [ "x$PIGLIT" == "x" ]; then
+if [ "x$PIGLIT" = "x" ]; then
 	PIGLIT="$ROOT/piglit/piglit"
 fi
 
@@ -241,7 +241,7 @@ if [ "x$LIST_TESTS" != "x" ]; then
 fi
 
 if [ "x$RESUME_RUN" != "x" ]; then
-	if [ "x$COV_ARGS" != "x" -a "x$COV_PER_TEST" == "x" ]; then
+	if [ "x$COV_ARGS" != "x" -a "x$COV_PER_TEST" = "x" ]; then
 		echo "Can't continue collecting coverage tests. Next time, run"
 		echo "$0 with '-P' in order to generate separate code coverage results".
 		exit 1
@@ -252,7 +252,7 @@ else
 	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER
 fi
 
-if [ "$SUMMARY" == "html" ]; then
+if [ "$SUMMARY" = "html" ]; then
 	if [ ! -x "$PIGLIT" ]; then
 		echo "Could not find Piglit, required for HTML generation."
 		echo "Please install Piglit or use -d to download Piglit locally."
diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
index d506b149..240a7eb5 100755
--- a/tests/generate_testlist.sh
+++ b/tests/generate_testlist.sh
@@ -6,13 +6,13 @@ shift
 echo TESTLIST > $OUTPUT
 
 if [ $# -gt 0 ] ; then
-	echo -n $1 >> $OUTPUT
+	printf "$1" >> $OUTPUT
 	shift
 fi
 
 while [ $# -gt 0 ] ; do
-	echo -n " $1" >> $OUTPUT
+	printf " $1" >> $OUTPUT
 	shift
 done
 
-echo -e "\nEND TESTLIST" >> $OUTPUT
+printf "\nEND TESTLIST" >> $OUTPUT
-- 
2.37.2
