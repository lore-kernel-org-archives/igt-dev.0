Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9201410E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:40 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nOxQ0-000WkA-Mv
 for igt-dev@lists.freedesktop.org; Tue, 01 Mar 2022 08:59:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Mar 2022 08:59:25 +0100
Message-Id: <20220301075929.125733-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
References: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 5/9] scripts/code_cov_capture.sh: add a script
 to use lcov on build+test machine
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

When the test machine is also the build machine, it is possible to run
lcov directly on it. That makes the IGT tests faster, as it won't need
to generate a results tarball, and the produced results will be
independent on the Kernel object files, making the output files more
portable.

It should be noticed that, in order to generate html files, the Kernel
source will still be needed, due to the detailed view.

Reviewed-by: Tomi Sarvela <tomi.p.sarvela@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_capture.sh | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100755 scripts/code_cov_capture.sh

diff --git a/scripts/code_cov_capture.sh b/scripts/code_cov_capture.sh
new file mode 100755
index 000000000000..8662b0f145b8
--- /dev/null
+++ b/scripts/code_cov_capture.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+
+trap 'catch $LINENO' ERR
+catch() {
+	echo "$0: error on line $1. Code coverage not stored." >&2
+	exit 1
+}
+
+if [ -z "$IGT_KERNEL_TREE" ] ; then
+	echo "Error! IGT_KERNEL_TREE environment var was not defined." >&2
+	exit 1
+fi
+
+if [ -z "$1" ] ; then
+	echo "Usage: $0 <output>" >&2
+	echo "   Please notice that this script assumes $IGT_KERNEL_TREE is used as both Kernel source and object dir." >&2
+	exit 1
+fi
+
+lcov -q --rc lcov_branch_coverage=1 \
+	--test-name "$(basename $1)" -b $IGT_KERNEL_TREE --capture \
+	--output-file $1.info
+
+uptime=$(cat /proc/uptime|cut -d' ' -f 1)
+echo "[$uptime]     Code coverage wrote to $1.info"
-- 
2.35.1
