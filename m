Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4F6EA33
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:45 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:18 -0800
Message-Id: <20191211005235.67897-13-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/29] Include Linux specific headers only
 on Linux
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Include Linux specific headers like sys/sysmacros.h or
linux/limits.h with a defined(__linux__) guard, for compatibility
with other platforms.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_debugfs.c | 2 ++
 lib/igt_device.c  | 2 ++
 lib/igt_sysfs.c   | 2 ++
 runner/job_list.c | 2 ++
 tools/aubdump.c   | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 34b2e4ee..5a9c8c3c 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -25,7 +25,9 @@
 #include <inttypes.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
+#if defined(__linux__)
 #include <sys/sysmacros.h>
+#endif
 #include <dirent.h>
 #include <errno.h>
 #include <stdio.h>
diff --git a/lib/igt_device.c b/lib/igt_device.c
index 07bb0a0d..01a9eff4 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -25,7 +25,9 @@
 #include <fcntl.h>
 
 #include <sys/stat.h>
+#if defined(__linux__)
 #include <sys/sysmacros.h>
+#endif
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 61293a4e..5b3f817c 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -24,7 +24,9 @@
 
 #include <inttypes.h>
 #include <sys/stat.h>
+#if defined(__linux__)
 #include <sys/sysmacros.h>
+#endif
 #include <sys/mount.h>
 #include <errno.h>
 #include <stdarg.h>
diff --git a/runner/job_list.c b/runner/job_list.c
index bc10a1bf..8014a58c 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -1,7 +1,9 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#if defined(__linux__)
 #include <linux/limits.h>
+#endif
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/aubdump.c b/tools/aubdump.c
index 00e19712..25c28e62 100644
--- a/tools/aubdump.c
+++ b/tools/aubdump.c
@@ -30,7 +30,9 @@
 #include <stdarg.h>
 #include <fcntl.h>
 #include <sys/types.h>
+#if defined(__linux__)
 #include <sys/sysmacros.h>
+#endif
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
