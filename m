Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A252710E2F8
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 13:45:29 +0000 (UTC)
Received: from linux.intel.com (unknown [10.246.49.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4207C580919
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 05:45:28 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rDm1m-0009uW-1S
 for igt-dev@lists.freedesktop.org; Thu, 14 Dec 2023 14:45:26 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] meson.sh: add usage instructions at the beginning of
 the file
Date: Thu, 14 Dec 2023 14:45:25 +0100
Message-ID: <20231214134525.38086-1-mauro.chehab@linux.intel.com>
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

It is useful to have some documentation about the supported targets
and options.

Add it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meson.sh b/meson.sh
index 2ea33d69139e..5fb5a806d661 100755
--- a/meson.sh
+++ b/meson.sh
@@ -1,5 +1,21 @@
 #!/bin/sh
 
+# Usage:
+#    ./meson.sh [<options>] [target]
+#
+# Where options can be:
+#    V=0           - disable non-error messages on ninja
+#    V=1 (default) - print all ninja messages
+#
+# And target is the Makefile target. It can be:
+#	all         - build all files
+#       clean       - cleans build
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
