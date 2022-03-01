Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8D010E56A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:39 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nOxQ0-000WkD-NK
 for igt-dev@lists.freedesktop.org; Tue, 01 Mar 2022 08:59:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Mar 2022 08:59:26 +0100
Message-Id: <20220301075929.125733-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
References: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 6/9] scripts/code_cov_gen_report.sh: add a
 script to generate code coverage reports
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

The proper sequence to process the results at the build machine is not
trivial. Add a script automating such steps.

Reviewed-by: Tomi Sarvela <tomi.p.sarvela@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_gen_report.sh | 170 +++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100755 scripts/code_cov_gen_report.sh

diff --git a/scripts/code_cov_gen_report.sh b/scripts/code_cov_gen_report.sh
new file mode 100755
index 000000000000..05efebe19ee4
--- /dev/null
+++ b/scripts/code_cov_gen_report.sh
@@ -0,0 +1,170 @@
+#!/bin/bash
+
+MERGED_INFO="merged"
+GATHER_ON_BUILD="code_cov_gather_on_build.sh"
+PARSE_INFO="code_cov_parse_info.pl"
+
+trap 'catch $LINENO' ERR
+catch() {
+	echo "$0: error on line $1. HTML report not generated."
+	exit $1
+}
+
+usage() {
+    printf >&2 "\
+Usage:
+    $(basename $0)
+	--read <file or dir> --kernel-source <dir> --kernel-object <dir>
+	--output-dir <dir> [--info or --tar] [--force-override]
+
+--kernel-object is only needed when Kernel was built with make O=dir
+"
+    exit $1
+}
+
+MODE=
+RESULTS=
+KSRC=
+KOBJ=
+DEST_DIR=
+FORCE=
+
+while [ "$1" != "" ]; do
+	case $1 in
+	--info|-i)
+		MODE=info
+		;;
+	--tar|--tarball|-t)
+		MODE=tar.gz
+		;;
+	--kernel-source|-k)
+		if [ "$2" == "" ]; then
+			usage 1
+		else
+			KSRC=$(realpath $2)
+			shift
+		fi
+		;;
+	--kernel-object|-O)
+		if [ "$2" == "" ]; then
+			usage 1
+		else
+			KOBJ=$(realpath $2)
+			shift
+		fi
+		;;
+	--output-dir|-o)
+		if [ "$2" == "" ]; then
+			usage 1
+		else
+			DEST_DIR=$(realpath $2)
+			shift
+		fi
+		;;
+	--read|-r)
+		if [ "$2" == "" ]; then
+			usage 1
+		else
+			RESULTS=$(realpath $2)
+			shift
+		fi
+		;;
+	--force-override|-f)
+		FORCE=1
+		;;
+	--help)
+		usage 0
+		;;
+
+	*)
+		echo "Unknown argument '$1'"
+		usage 1
+		;;
+	esac
+	shift
+done
+
+if [ "x$RESULTS" == "x" -o "x$KSRC" == "x" -o "x$DEST_DIR" == "x" -o "x$MODE" == "x" ]; then
+	echo "Missing a mandatory argument"
+	usage 1
+fi
+
+if [ -z "$KOBJ" ]; then
+	KOBJ=$KSRC
+fi
+
+SCRIPT_DIR=$(dirname $(realpath $0))
+RESULTS=$(realpath $RESULTS)
+KSRC=$(realpath $KSRC)
+KOBJ=$(realpath $KOBJ)
+DEST_DIR=$(realpath $DEST_DIR)
+
+if [ -e "$DEST_DIR" ]; then
+	if [ "x$FORCE" != "x" -a -d "$DEST_DIR" ]; then
+		rm -rf $DEST_DIR/
+	else
+		echo "Directory exists. Won't override."
+		exit 1
+	fi
+fi
+
+mkdir -p $DEST_DIR
+cd $DEST_DIR
+
+if [ "$MODE" != "info" ]; then
+	echo "Generating source tarball from $KSRC (O=$KOBJ)..."
+	${SCRIPT_DIR}/${GATHER_ON_BUILD} $KSRC $KOBJ source.tar.gz
+
+	echo "Adding source files..."
+	tar xf source.tar.gz
+
+	if [ -d "$RESULTS" ]; then
+		echo "Creating per-file info files..."
+		echo -n "" >${MERGED_INFO}.info
+		for i in $RESULTS/*.tar.gz; do
+			TITLE=$(basename $i)
+			TITLE=${TITLE/.tar.gz/}
+
+			echo "Adding results from $i..."
+			tar xf $i
+
+			echo "Generating $TITLE.info..."
+			lcov -q -t ${TITLE} --rc lcov_branch_coverage=1 -o $TITLE.info -c -d .
+
+			cat $TITLE.info >>${MERGED_INFO}.info
+
+			# Remove the contents of the results tarball
+			rm -rf sys/
+		done
+
+		TITLE=${MERGED_INFO}
+	else
+		TITLE=$(basename $RESULTS)
+		TITLE=${TITLE/.tar.gz/}
+
+		echo "Adding results from $RESULTS..."
+		tar xf $RESULTS
+
+		echo "Generating $TITLE.info..."
+		lcov -q -t ${TITLE} --rc lcov_branch_coverage=1 -o $TITLE.info -c -d .
+	fi
+else
+	if [ -d "$RESULTS" ]; then
+		echo "Merging info files..."
+		echo -n "" >${MERGED_INFO}.info
+		for i in $RESULTS/*.info; do
+			cat $i >>${MERGED_INFO}.info
+		done
+
+		TITLE=${MERGED_INFO}
+	else
+		echo "Copying $RESULTS to $DEST_DIR..."
+		cp $RESULTS .
+
+		TITLE=$(basename $RESULTS)
+		TITLE=${TITLE/.info/}
+	fi
+fi
+
+echo "Generating HTML files..."
+genhtml -q ${TITLE}.info
-- 
2.35.1
