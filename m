Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB0210E911
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 04:07:50 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id g13so2008491ile.0
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 21:07:50 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Oct 2022 23:07:11 -0500
Message-Id: <20221007040717.2924978-3-jfree@freebsd.org>
In-Reply-To: <20221007040717.2924978-1-jfree@freebsd.org>
References: <20221007040717.2924978-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/10] Ifdef out linux-specific headers
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

Use #ifdef __linux__ to limit all Linux-specific headers to
Linux systems

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 benchmarks/gem_syslatency.c    | 2 ++
 lib/i915/intel_memory_region.c | 2 ++
 lib/i915/perf.c                | 2 ++
 lib/igt_core.h                 | 2 ++
 lib/igt_debugfs.c              | 2 ++
 lib/igt_device.c               | 2 ++
 lib/igt_device_scan.c          | 2 ++
 lib/igt_perf.c                 | 2 ++
 lib/igt_perf.h                 | 2 ++
 lib/igt_pm.c                   | 2 ++
 lib/igt_sysfs.c                | 2 ++
 runner/executor.c              | 2 ++
 runner/job_list.c              | 2 ++
 tests/i915/i915_module_load.c  | 2 ++
 tests/tools_test.c             | 2 ++
 15 files changed, 30 insertions(+)

diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 3af5f406..395d2e71 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -42,7 +42,9 @@
 #include <limits.h>
 #include "drm.h"
 
+#ifdef __linux__
 #include <linux/unistd.h>
+#endif
 
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 075ba0ce..84e1bceb 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -21,7 +21,9 @@
  * IN THE SOFTWARE.
  */
 
+#ifdef __linux__
 #include <linux/limits.h>
+#endif
 #include <signal.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index d88835ff..beda6b8a 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -29,7 +29,9 @@
 #include <fcntl.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#endif
 #include <sys/types.h>
 #include <unistd.h>
 
diff --git a/lib/igt_core.h b/lib/igt_core.h
index a6b4b5ae..b659ea7b 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -31,7 +31,9 @@
 #define IGT_CORE_H
 
 #include <assert.h>
+#ifdef __linux__
 #include <byteswap.h>
+#endif
 #include <setjmp.h>
 #include <stdbool.h>
 #include <stdint.h>
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a56688a5..fa1e3b69 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -25,7 +25,9 @@
 #include <inttypes.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#endif
 #include <dirent.h>
 #include <errno.h>
 #include <stdio.h>
diff --git a/lib/igt_device.c b/lib/igt_device.c
index fddfba72..49b77122 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -25,7 +25,9 @@
 #include <fcntl.h>
 
 #include <sys/stat.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#endif
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index eb6b45b8..7a4a3452 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -32,7 +32,9 @@
 #include <fcntl.h>
 #include <glib.h>
 #include <libudev.h>
+#ifdef __linux__
 #include <linux/limits.h>
+#endif
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/types.h>
diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index b743859f..11c91c5f 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -4,8 +4,10 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/stat.h>
+#ifdef __linux__
 #include <sys/sysinfo.h>
 #include <sys/sysmacros.h>
+#endif
 #include <time.h>
 #include <unistd.h>
 
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index a8328c70..672bfea6 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -27,7 +27,9 @@
 
 #include <stdint.h>
 
+#ifdef __linux__
 #include <linux/perf_event.h>
+#endif
 
 #include "igt_gt.h"
 
diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 312288d0..1e6e9ed3 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -33,7 +33,9 @@
 #include <string.h>
 #include <unistd.h>
 #include <sys/stat.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#endif
 #include <sys/types.h>
 #include <dirent.h>
 
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9c307694..a913be4c 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -24,7 +24,9 @@
 
 #include <inttypes.h>
 #include <sys/stat.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#endif
 #include <sys/mount.h>
 #include <errno.h>
 #include <stdarg.h>
diff --git a/runner/executor.c b/runner/executor.c
index 964d0063..8a32fedd 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -2,7 +2,9 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <glib.h>
+#ifdef __linux__
 #include <linux/watchdog.h>
+#endif
 #if HAVE_OPING
 #include <oping.h>
 #endif
diff --git a/runner/job_list.c b/runner/job_list.c
index 520a98da..a259b953 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -1,7 +1,9 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#ifdef __linux__
 #include <linux/limits.h>
+#endif
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 4c72157c..9bec4c18 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -23,7 +23,9 @@
 #include "igt.h"
 #include <dirent.h>
 #include <sys/utsname.h>
+#ifdef __linux__
 #include <linux/limits.h>
+#endif
 #include <signal.h>
 #include <libgen.h>
 #include <signal.h>
diff --git a/tests/tools_test.c b/tests/tools_test.c
index a3449585..8412ba52 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -28,7 +28,9 @@
 #include <fcntl.h>
 #include <libgen.h>
 #include <unistd.h>
+#ifdef __linux__
 #include <linux/limits.h>
+#endif
 
 #define TOOLS "../tools/"
 
-- 
2.37.3
