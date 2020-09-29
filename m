Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959CC6E19C
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 11:27:34 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 29 Sep 2020 12:27:25 +0100
Message-Id: <20200929112725.733155-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] core_hotplug: Teach the healthcheck how to
 check execution status
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2476
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/core_hotunplug.c | 51 +++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 67e67627f..70669c590 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -23,7 +23,6 @@
 
 #include <fcntl.h>
 #include <limits.h>
-#include <signal.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
@@ -36,6 +35,7 @@
 #include "igt_device_scan.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
 
@@ -222,12 +222,22 @@ static bool local_i915_is_wedged(int i915)
 	return err == -EIO;
 }
 
-static bool hang_detected = false;
-
-static void local_sig_abort(int sig)
+static int merge_fences(int old, int new)
 {
-	errno = 0; /* inside a signal, last errno reporting is confusing */
-	hang_detected = true;
+	int merge;
+
+	if (new == -1)
+		return old;
+
+	if (old == -1)
+		return new;
+
+	merge = sync_fence_merge(old, new);
+	igt_assert(merge != -1);
+	close(old);
+	close(new);
+
+	return merge;
 }
 
 static int local_i915_healthcheck(int i915, const char *prefix)
@@ -239,36 +249,27 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 		.buffer_count = 1,
 	};
 	const struct intel_execution_engine2 *engine;
-
-	/* stop our hang detector possibly still running if we failed before */
-	igt_stop_hang_detector();
-
-	/* don't run again before GPU reset if hang has been already detected */
-	if (hang_detected)
-		return -EIO;
+	int fence = -1;
 
 	local_debug("%s%s\n", prefix, "running i915 GPU healthcheck");
-
 	if (local_i915_is_wedged(i915))
 		return -EIO;
 
 	obj.handle = gem_create(i915, 4096);
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
-	igt_fork_hang_detector(i915);
-	signal(SIGIO, local_sig_abort);
-
 	__for_each_physical_engine(i915, engine) {
-		execbuf.flags = engine->flags;
-		gem_execbuf(i915, &execbuf);
-	}
+		execbuf.flags = engine->flags | I915_EXEC_FENCE_OUT;
+		gem_execbuf_wr(i915, &execbuf);
 
-	gem_sync(i915, obj.handle);
+		fence = merge_fences(fence, execbuf.rsvd2 >> 32);
+	}
+	igt_assert(fence != -1);
 	gem_close(i915, obj.handle);
 
-	igt_stop_hang_detector();
-	if (hang_detected)
-		return -EIO;
+	igt_assert_eq(sync_fence_wait(fence, -1), 0);
+	igt_assert_eq(sync_fence_status(fence), 1);
+	close(fence);
 
 	if (local_i915_is_wedged(i915))
 		return -EIO;
@@ -278,14 +279,12 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 
 static int local_i915_recover(int i915)
 {
-	hang_detected = false;
 	if (!local_i915_healthcheck(i915, "re-"))
 		return 0;
 
 	local_debug("%s\n", "forcing i915 GPU reset");
 	igt_force_gpu_reset(i915);
 
-	hang_detected = false;
 	return local_i915_healthcheck(i915, "post-");
 }
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
