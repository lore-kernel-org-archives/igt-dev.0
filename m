Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAFD6E46C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 18:06:48 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Mon,  6 Apr 2020 23:35:32 +0530
Message-Id: <20200406180532.30762-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t][V3]tests/i915/gem_sync.c :Added
 __for_each_physical_engine to utilize all available
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replaced the legacy for_each_engine* defines with the ones
implemented in the gem_engine_topology library.

Used  gem_context_clone_with_engines
to make sure that engine index was potentially created
based on a  default context with engine map configured.

Added gem_reopen_driver and gem_context_copy_engines
to transfer the engine map from parent fd default
context.

V2:
Added Legacy engine coverage for sync_ring and sync_all.

V3:
Added back ALL_ENGINES. Corrected Test cases that used
gem_reopen_driver in fork. Which was not recommended.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_sync.c | 217 ++++++++++++++++++++++++++++++------------
 1 file changed, 156 insertions(+), 61 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 2ef55ecc..19c84dc2 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -81,14 +81,15 @@ out:
 static void
 sync_ring(int fd, unsigned ring, int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+		__for_each_physical_engine(fd, e2) {
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -180,17 +181,18 @@ idle_ring(int fd, unsigned ring, int timeout)
 static void
 wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -292,17 +294,18 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 
 static void active_ring(int fd, unsigned ring, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -359,17 +362,18 @@ static void active_ring(int fd, unsigned ring, int timeout)
 static void
 active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -493,18 +497,19 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 static void
 store_ring(int fd, unsigned ring, int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -608,6 +613,7 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 static void
 switch_ring(int fd, unsigned ring, int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[16];
 	const char *names[16];
@@ -616,12 +622,12 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 	gem_require_contexts(fd);
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -933,6 +939,7 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
 static void
 store_many(int fd, unsigned ring, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned long *shared;
 	const char *names[16];
 	int n = 0;
@@ -943,17 +950,17 @@ store_many(int fd, unsigned ring, int timeout)
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		__for_each_physical_engine(fd, e2) {
+			if (!gem_class_can_store_dword(fd, e2->class))
 				continue;
 
 			igt_fork(child, 1)
 				__store_many(fd,
-					     eb_ring(e),
+					     e2->flags,
 					     timeout,
 					     &shared[n]);
 
-			names[n++] = e->name;
+			names[n++] = e2->name;
 		}
 		igt_waitchildren();
 	} else {
@@ -1025,15 +1032,16 @@ sync_all(int fd, int num_children, int timeout)
 static void
 store_all(int fd, int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e;
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[16];
 	int num_engines = 0;
 
-	for_each_physical_engine(e, fd) {
-		if (!gem_can_store_dword(fd, eb_ring(e)))
+	__for_each_physical_engine(fd, e) {
+		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
-		engines[num_engines++] = eb_ring(e);
+		engines[num_engines++] = e->flags;
 		if (num_engines == ARRAY_SIZE(engines))
 			break;
 	}
@@ -1132,15 +1140,16 @@ store_all(int fd, int num_children, int timeout)
 static void
 preempt(int fd, unsigned ring, int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned engines[16];
 	const char *names[16];
 	int num_engines = 0;
 	uint32_t ctx[2];
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
+		__for_each_physical_engine(fd, e2) {
+			names[num_engines] = e2->name;
+			engines[num_engines++] = e2->flags;
 			if (num_engines == ARRAY_SIZE(engines))
 				break;
 		}
@@ -1209,6 +1218,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 
 igt_main
 {
+	const struct intel_execution_engine2 *e2;
 	const struct intel_execution_engine *e;
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	int fd = -1;
@@ -1222,31 +1232,114 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	/* Legacy testing must be first. */
 	for (e = intel_execution_engines; e->name; e++) {
-		igt_subtest_f("%s", e->name)
-			sync_ring(fd, eb_ring(e), 1, 20);
-		igt_subtest_f("idle-%s", e->name)
-			idle_ring(fd, eb_ring(e), 20);
-		igt_subtest_f("active-%s", e->name)
-			active_ring(fd, eb_ring(e), 20);
-		igt_subtest_f("wakeup-%s", e->name)
-			wakeup_ring(fd, eb_ring(e), 20, 1);
-		igt_subtest_f("active-wakeup-%s", e->name)
-			active_wakeup_ring(fd, eb_ring(e), 20, 1);
-		igt_subtest_f("double-wakeup-%s", e->name)
-			wakeup_ring(fd, eb_ring(e), 20, 2);
-		igt_subtest_f("store-%s", e->name)
-			store_ring(fd, eb_ring(e), 1, 20);
-		igt_subtest_f("switch-%s", e->name)
-			switch_ring(fd, eb_ring(e), 1, 20);
-		igt_subtest_f("forked-switch-%s", e->name)
-			switch_ring(fd, eb_ring(e), ncpus, 20);
-		igt_subtest_f("many-%s", e->name)
-			store_many(fd, eb_ring(e), 20);
-		igt_subtest_f("forked-%s", e->name)
-			sync_ring(fd, eb_ring(e), ncpus, 20);
-		igt_subtest_f("forked-store-%s", e->name)
-			store_ring(fd, eb_ring(e), ncpus, 20);
+		struct intel_execution_engine2 e2__;
+
+		e2__ = gem_eb_flags_to_engine(eb_ring(e));
+		if (e2__.flags == -1)
+			continue;
+		e2 = &e2__;
+
+		igt_subtest_f("legacy_%s", e->name)
+			sync_ring(fd, e2->flags, 1, 20);
+
+	}
+
+	igt_subtest_with_dynamic("basic_sync_ring") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				sync_ring(fd, e2->flags, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("idle") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				idle_ring(fd, e2->flags, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("active") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				active_ring(fd, e2->flags, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("wakeup") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				wakeup_ring(fd, e2->flags, 150, 1);
+		}
+	}
+
+	igt_subtest_with_dynamic("active-wakeup") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				active_wakeup_ring(fd, e2->flags, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("double-wakeup") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				wakeup_ring(fd, e2->flags, 20, 2);
+		}
+	}
+
+	igt_subtest_with_dynamic("store") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				store_ring(fd, e2->flags, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("switch") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				switch_ring(fd, e2->flags, 1, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked-switch") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				switch_ring(fd, e2->flags, ncpus, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("many") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				store_many(fd, e2->flags, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				sync_ring(fd, e2->flags, ncpus, 20);
+		}
+	}
+
+	igt_subtest_with_dynamic("forked-store") {
+		__for_each_physical_engine(fd, e2) {
+			/* Requires master for STORE_DWORD on gen4/5 */
+			igt_dynamic_f("%s", e2->name)
+				store_ring(fd, e2->flags, ncpus, 20);
+		}
 	}
 
 	igt_subtest("basic-each")
@@ -1295,10 +1388,12 @@ igt_main
 
 		igt_subtest("preempt-all")
 			preempt(fd, ALL_ENGINES, 1, 20);
-
-		for (e = intel_execution_engines; e->name; e++) {
-			igt_subtest_f("preempt-%s", e->name)
-				preempt(fd, eb_ring(e), ncpus, 20);
+		igt_subtest_with_dynamic("preempt") {
+			__for_each_physical_engine(fd, e2) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+				igt_dynamic_f("%s", e2->name)
+					preempt(fd, e2->flags, ncpus, 20);
+			}
 		}
 	}
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
