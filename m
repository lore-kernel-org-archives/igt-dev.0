Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 30 Dec 2020 16:19:52 +0000
Message-Id: <20201230161952.1658206-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_suspend: Remove legacy ring
 abi
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Cover all engines with the engine map API.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_suspend.c | 69 +++++++++++++----------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 42b0ab705..a31dd6625 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -31,7 +31,6 @@
 #include <unistd.h>
 
 #include "i915/gem.h"
-#include "i915/gem_ring.h"
 #include "igt.h"
 #include "igt_dummyload.h"
 #include "igt_gt.h"
@@ -51,7 +50,7 @@
 #define CACHED (1<<8)
 #define HANG (2<<8)
 
-static void run_test(int fd, unsigned ring, unsigned flags);
+static void run_test(int fd, unsigned engine, unsigned flags);
 
 static void check_bo(int fd, uint32_t handle)
 {
@@ -68,24 +67,7 @@ static void check_bo(int fd, uint32_t handle)
 
 static void test_all(int fd, unsigned flags)
 {
-	for_each_physical_ring(e, fd)
-		if (gem_can_store_dword(fd, eb_ring(e)))
-			run_test(fd, eb_ring(e), flags & ~0xff);
-}
-
-static bool has_semaphores(int fd)
-{
-	struct drm_i915_getparam gp;
-	int val = -1;
-
-	memset(&gp, 0, sizeof(gp));
-	gp.param = I915_PARAM_HAS_SEMAPHORES;
-	gp.value = &val;
-
-	drmIoctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
-	errno = 0;
-
-	return val > 0;
+	run_test(fd, ALL_ENGINES, flags & ~0xff);
 }
 
 static void run_test(int fd, unsigned engine, unsigned flags)
@@ -101,25 +83,13 @@ static void run_test(int fd, unsigned engine, unsigned flags)
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
-		/* If we don't have semaphores, then every ring switch
-		 * will result in a CPU stall until the previous write
-		 * has finished. This is likely to hide any issue with
-		 * the GPU being active across the suspend (because the
-		 * GPU is then unlikely to be active!)
-		 */
-		if (has_semaphores(fd)) {
-			for_each_physical_ring(e, fd) {
-				if (gem_can_store_dword(fd, eb_ring(e)))
-					engines[nengine++] = eb_ring(e);
-			}
-		} else {
-			igt_require(gem_has_ring(fd, 0));
-			igt_require(gem_can_store_dword(fd, 0));
-			engines[nengine++] = 0;
+		const struct intel_execution_engine2 *e;
+
+		__for_each_physical_engine(fd, e) {
+			if (gem_class_can_store_dword(fd, e->class))
+				engines[nengine++] = e->flags;
 		}
 	} else {
-		igt_require(gem_has_ring(fd, engine));
-		igt_require(gem_can_store_dword(fd, engine));
 		engines[nengine++] = engine;
 	}
 	igt_require(nengine);
@@ -301,7 +271,7 @@ igt_main
 		{ "-S4", HIBERNATE },
 		{ NULL, 0 }
 	}, *m;
-	const struct intel_execution_ring *e;
+	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
 	int fd;
 
@@ -326,12 +296,23 @@ igt_main
 	igt_subtest("basic-S4")
 		run_test(fd, ALL_ENGINES, HIBERNATE);
 
-	for (e = intel_execution_rings; e->name; e++) {
-		for (m = modes; m->suffix; m++) {
-			igt_subtest_f("%s-uncached%s", e->name, m->suffix)
-				run_test(fd, eb_ring(e), m->mode | UNCACHED);
-			igt_subtest_f("%s-cached%s", e->name, m->suffix)
-				run_test(fd, eb_ring(e), m->mode | CACHED);
+	for (m = modes; m->suffix; m++) {
+		igt_subtest_with_dynamic_f("uncached-%s", m->suffix) {
+			__for_each_physical_engine(fd, e) {
+				if (!gem_class_can_store_dword(fd, e->class))
+					continue;
+				igt_dynamic_f("%s", e->name)
+					run_test(fd, e->flags, m->mode | UNCACHED);
+			}
+		}
+
+		igt_subtest_with_dynamic_f("cached-%s", m->suffix) {
+			__for_each_physical_engine(fd, e) {
+				if (!gem_class_can_store_dword(fd, e->class))
+					continue;
+				igt_dynamic_f("%s", e->name)
+					run_test(fd, e->flags, m->mode | CACHED);
+			}
 		}
 	}
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
