Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7E110FD05
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 12:25:11 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Apr 2022 14:24:53 +0200
Message-Id: <e8dcb82be52abf35663c6c547f3df0443eb83409.1649939026.git.mchehab@kernel.org>
In-Reply-To: <cover.1649939026.git.mchehab@kernel.org>
References: <cover.1649939026.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 03/12] scripts/code_cov_gen_report: add support
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/12] at: https://lore.kernel.org/all/cover.1649939026.git.mchehab@kernel.org/

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
