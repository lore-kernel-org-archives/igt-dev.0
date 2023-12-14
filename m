Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245F28825E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 13:50:53 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.49.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3058D580CD0
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 05:50:52 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rDm70-000AH0-1E
 for igt-dev@lists.freedesktop.org; Thu, 14 Dec 2023 14:50:50 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] meson.sh: add usage instructions at the beginning of
 the file
Date: Thu, 14 Dec 2023 14:50:49 +0100
Message-ID: <20231214135049.39479-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add some documentation about the supported targets and options.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meson.sh b/meson.sh
index 2ea33d69139e..f83b6d6d4b92 100755
--- a/meson.sh
+++ b/meson.sh
@@ -1,5 +1,21 @@
 #!/bin/sh
 
+# Usage:
+#    ./meson.sh [<options>] [target]
+#
+# Where options can be:
+#	V=0         - disable non-error messages on ninja
+#	V=1         - print all ninja messages (default)
+#
+# And target is the Makefile target. It can be:
+#	all         - build all files
+#	clean       - cleans build
+#	test        - excecute unit tests
+#	reconfigure - run Meson reconfigure via ninja
+#	install     - builds and install IGT
+#	uninstall   - uninstalls IGT from a past installation
+#	docs	    - builds igt-gpu-tools-doc
+
 cat > Makefile <<EOF
 
 quiet_build =
-- 
2.43.0
