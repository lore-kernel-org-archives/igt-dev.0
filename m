Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607C10F2E0
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 06:26:50 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Mon,  4 Apr 2022 08:26:33 +0200
Message-Id: <20220404062642.378928-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 03/12] scripts/code_cov_gen_report: add support
 for filtering info files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Now that we have a script that allows filtering the results,
add support for it when generating code coverage reports.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_gen_report | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
index 05efebe19ee4..b7c90b114cde 100755
--- a/scripts/code_cov_gen_report
+++ b/scripts/code_cov_gen_report
@@ -16,6 +16,8 @@ Usage:
     $(basename $0)
 	--read <file or dir> --kernel-source <dir> --kernel-object <dir>
 	--output-dir <dir> [--info or --tar] [--force-override]
+	[--print] [--stat] [--ignore-unused] [--only-i915] [--only-drm]
+	[--show-files] [--func-filters <file>] [--source-filters <file>]
 
 --kernel-object is only needed when Kernel was built with make O=dir
 "
@@ -28,6 +30,7 @@ KSRC=
 KOBJ=
 DEST_DIR=
 FORCE=
+PARSE_ARGS=
 
 while [ "$1" != "" ]; do
 	case $1 in
@@ -69,6 +72,17 @@ while [ "$1" != "" ]; do
 			shift
 		fi
 		;;
+	--print|--stat|--ignore-unused|--only-i915|--only-drm|--show-files)
+		PARSE_ARGS="$PARSE_ARGS $1"
+		;;
+	--func-filters|--source-filters)
+		if [ "$2" == "" ]; then
+			usage 1
+		else
+			PARSE_ARGS="$PARSE_ARGS $1 $2"
+			shift
+		fi
+		;;
 	--force-override|-f)
 		FORCE=1
 		;;
@@ -166,5 +180,10 @@ else
 	fi
 fi
 
+if [ "x$PARSE_ARGS" != "x" ]; then
+	${SCRIPT_DIR}/$PARSE_INFO $PARSE_ARGS --output filtered_${TITLE}.info ${TITLE}.info
+	TITLE=filtered_${TITLE}
+fi
+
 echo "Generating HTML files..."
 genhtml -q ${TITLE}.info
-- 
2.35.1
