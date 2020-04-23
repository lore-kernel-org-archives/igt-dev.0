Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316606E5D4
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2020 16:56:50 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Thu, 23 Apr 2020 22:25:20 +0530
Message-Id: <20200423165520.26115-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t][V8]tests/i915/gem_sync.c :Added
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

V2:
Added Legacy engine coverage for sync_ring and sync_all.

V3:
Added back ALL_ENGINES. Corrected Test cases that used
gem_reopen_driver in fork. Which was not recommended.

V4:
Removed gem_require_ring and gem_can_store_dword

V5:
Divided tests into static for ALL_Engine test cases
and dynamic for multiple engine .

V6:
Rearranged test order to execute legacy test cases first

V7:
Initializing engine and engine name with
maximum supported engines value.

V8:
Replaced  intel_execution_engine2 with intel_engine_data in subtests
removed local array for Name and engines .
removed do_test function and code clean up

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_sync.c | 360 +++++++++++++++++++++---------------------
 1 file changed, 183 insertions(+), 177 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 2ef55ecc..e68e095e 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -24,6 +24,9 @@
 #include <time.h>
 #include <pthread.h>
 
+#include "igt_debugfs.h"
+#include "igt_dummyload.h"
+#include "igt_gt.h"
 #include "igt.h"
 #include "igt_sysfs.h"
 
@@ -37,6 +40,7 @@
 #define MIN_PRIO LOCAL_I915_CONTEXT_MIN_USER_PRIORITY
 
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
+#define EXECBUF_MAX_ENGINES (I915_EXEC_RING_MASK + 1)
 
 IGT_TEST_DESCRIPTION("Basic check of ring<->ring write synchronisation.");
 
@@ -81,23 +85,16 @@ out:
 static void
 sync_ring(int fd, unsigned ring, int num_children, int timeout)
 {
-	unsigned engines[16];
-	const char *names[16];
+	struct intel_engine_data Iengines = { };
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
-		}
-
-		num_children *= num_engines;
+		Iengines = intel_init_engine_list(fd, 0);
+		num_children *= Iengines.nengines;
+		num_engines = ARRAY_SIZE(Iengines.engines);
 	} else {
 		gem_require_ring(fd, ring);
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -115,7 +112,7 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
-		execbuf.flags = engines[child % num_engines];
+		execbuf.flags = Iengines.engines[child % num_engines].flags;
 		gem_execbuf(fd, &execbuf);
 		gem_sync(fd, object.handle);
 
@@ -128,8 +125,8 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
 			} while (++cycles & 1023);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("%s%sompleted %ld cycles: %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " c" : "C",
 			 cycles, elapsed*1e6/cycles);
 
 		gem_close(fd, object.handle);
@@ -139,7 +136,7 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
 }
 
 static void
-idle_ring(int fd, unsigned ring, int timeout)
+idle_ring(int fd, unsigned int ring, int num_children, int timeout)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object;
@@ -180,26 +177,22 @@ idle_ring(int fd, unsigned ring, int timeout)
 static void
 wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 {
-	unsigned engines[16];
-	const char *names[16];
+	struct intel_engine_data Iengines = { };
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		Iengines = intel_init_engine_list(fd, 0);
+		for (unsigned int n = 0; n < Iengines.nengines; n++) {
+			if (!gem_class_can_store_dword(fd, Iengines.engines->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
+			num_engines = Iengines.nengines;
 		}
 		igt_require(num_engines);
 	} else {
 		gem_require_ring(fd, ring);
 		igt_require(gem_can_store_dword(fd, ring));
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -218,7 +211,7 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
-		execbuf.flags = engines[child % num_engines];
+		execbuf.flags = Iengines.engines[child % num_engines].flags;
 
 		spin = __igt_spin_new(fd,
 				      .engine = execbuf.flags,
@@ -252,8 +245,8 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 			baseline = elapsed / cycles;
 		}
 		igt_info("%s%saseline %ld cycles: %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " b" : "B",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " b" : "B",
 			 cycles, elapsed*1e6/cycles);
 
 		end = gettime() + timeout;
@@ -279,8 +272,8 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		elapsed -= cycles * baseline;
 
 		igt_info("%s%sompleted %ld cycles: %.3f + %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " c" : "C",
 			 cycles, 1e6*baseline, elapsed*1e6/cycles);
 
 		igt_spin_free(fd, spin);
@@ -290,28 +283,25 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-static void active_ring(int fd, unsigned ring, int timeout)
+static void active_ring(int fd, unsigned int ring,
+			int num_children, int timeout)
 {
-	unsigned engines[16];
-	const char *names[16];
+	struct intel_engine_data Iengines = { };
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		Iengines = intel_init_engine_list(fd, 0);
+		for (unsigned int n = 0; n < Iengines.nengines; n++) {
+			if (!gem_class_can_store_dword(fd, Iengines.engines->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
+			num_engines = Iengines.nengines;
 		}
 		igt_require(num_engines);
 	} else {
 		gem_require_ring(fd, ring);
 		igt_require(gem_can_store_dword(fd, ring));
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -321,11 +311,11 @@ static void active_ring(int fd, unsigned ring, int timeout)
 		igt_spin_t *spin[2];
 
 		spin[0] = __igt_spin_new(fd,
-					 .engine = ring,
+					 .engine = Iengines.engines[child % num_engines].flags,
 					 .flags = IGT_SPIN_FAST);
 
 		spin[1] = __igt_spin_new(fd,
-					 .engine = ring,
+					 .engine = Iengines.engines[child % num_engines].flags,
 					 .flags = IGT_SPIN_FAST);
 
 		start = gettime();
@@ -348,8 +338,8 @@ static void active_ring(int fd, unsigned ring, int timeout)
 		igt_spin_free(fd, spin[0]);
 
 		igt_info("%s%sompleted %ld cycles: %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " c" : "C",
 			 cycles, (elapsed - start)*1e6/cycles);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
@@ -359,26 +349,22 @@ static void active_ring(int fd, unsigned ring, int timeout)
 static void
 active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 {
-	unsigned engines[16];
-	const char *names[16];
+	struct intel_engine_data Iengines = { };
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		Iengines = intel_init_engine_list(fd, 0);
+		for (unsigned int n = 0; n < Iengines.nengines; n++) {
+			if (!gem_class_can_store_dword(fd, Iengines.engines->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
+			num_engines = Iengines.nengines;
 		}
 		igt_require(num_engines);
 	} else {
 		gem_require_ring(fd, ring);
 		igt_require(gem_can_store_dword(fd, ring));
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -397,7 +383,7 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
-		execbuf.flags = engines[child % num_engines];
+		execbuf.flags = Iengines.engines[child % num_engines].flags;
 
 		spin[0] = __igt_spin_new(fd,
 					 .engine = execbuf.flags,
@@ -444,8 +430,8 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 			baseline = elapsed / cycles;
 		}
 		igt_info("%s%saseline %ld cycles: %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " b" : "B",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " b" : "B",
 			 cycles, elapsed*1e6/cycles);
 
 		igt_spin_reset(spin[0]);
@@ -478,8 +464,8 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		elapsed -= cycles * baseline;
 
 		igt_info("%s%sompleted %ld cycles: %.3f + %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " c" : "C",
 			 cycles, 1e6*baseline, elapsed*1e6/cycles);
 
 		igt_spin_free(fd, spin[1]);
@@ -493,28 +479,23 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 static void
 store_ring(int fd, unsigned ring, int num_children, int timeout)
 {
+	struct intel_engine_data Iengines = { };
 	const int gen = intel_gen(intel_get_drm_devid(fd));
-	unsigned engines[16];
-	const char *names[16];
 	int num_engines = 0;
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		Iengines = intel_init_engine_list(fd, 0);
+		for (unsigned int n = 0; n < Iengines.nengines; n++) {
+			if (!gem_class_can_store_dword(fd, Iengines.engines->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
+			num_engines = Iengines.nengines;
 		}
-
-		num_children *= num_engines;
+		 num_children *= num_engines;
 	} else {
 		gem_require_ring(fd, ring);
 		igt_require(gem_can_store_dword(fd, ring));
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -529,7 +510,7 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(object);
-		execbuf.flags = engines[child % num_engines];
+		execbuf.flags = Iengines.engines[child % num_engines].flags;
 		execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
 		execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
 		if (gen < 6)
@@ -594,8 +575,8 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 			} while (++cycles & 1023);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("%s%sompleted %ld cycles: %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " c" : "C",
 			 cycles, elapsed*1e6/cycles);
 
 		gem_close(fd, object[1].handle);
@@ -608,30 +589,25 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 static void
 switch_ring(int fd, unsigned ring, int num_children, int timeout)
 {
+	struct intel_engine_data Iengines = { };
 	const int gen = intel_gen(intel_get_drm_devid(fd));
-	unsigned engines[16];
-	const char *names[16];
 	int num_engines = 0;
 
 	gem_require_contexts(fd);
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			if (!gem_can_store_dword(fd, eb_ring(e)))
+		Iengines = intel_init_engine_list(fd, 0);
+		for (unsigned int n = 0; n < Iengines.nengines; n++) {
+			if (!gem_class_can_store_dword(fd, Iengines.engines->class))
 				continue;
 
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
+			num_engines = Iengines.nengines;
 		}
-
 		num_children *= num_engines;
 	} else {
 		gem_require_ring(fd, ring);
 		igt_require(gem_can_store_dword(fd, ring));
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -652,7 +628,7 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 
 			memset(&c->execbuf, 0, sizeof(c->execbuf));
 			c->execbuf.buffers_ptr = to_user_pointer(c->object);
-			c->execbuf.flags = engines[child % num_engines];
+			c->execbuf.flags = Iengines.engines[child % num_engines].flags;
 			c->execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
 			c->execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
 			if (gen < 6)
@@ -747,8 +723,8 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 		elapsed /= cycles;
 
 		igt_info("%s%sompleted %ld cycles: %.3f us, baseline %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_engines].name ?: "",
+			 Iengines.engines[child % num_engines].name ? " c" : "C",
 			 cycles, elapsed*1e6, baseline*1e6);
 
 		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
@@ -931,10 +907,11 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
 }
 
 static void
-store_many(int fd, unsigned ring, int timeout)
+store_many(int fd, unsigned int ring, int num_children, int timeout)
 {
+	const struct intel_execution_engine2 *e2;
 	unsigned long *shared;
-	const char *names[16];
+	const char *names[EXECBUF_MAX_ENGINES];
 	int n = 0;
 
 	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
@@ -943,21 +920,20 @@ store_many(int fd, unsigned ring, int timeout)
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
+			names[n++] = strdup(e2->name);
 		}
 		igt_waitchildren();
 	} else {
-		gem_require_ring(fd, ring);
 		igt_require(gem_can_store_dword(fd, ring));
 		__store_many(fd, ring, timeout, &shared[n]);
 		names[n++] = NULL;
@@ -965,7 +941,7 @@ store_many(int fd, unsigned ring, int timeout)
 
 	for (int i = 0; i < n; i++) {
 		igt_info("%s%sompleted %ld cycles\n",
-			 names[i] ?: "", names[i] ? " c" : "C", shared[i]);
+			  names[i] ?: "", names[i] ? " c" : "C", shared[i]);
 	}
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 	munmap(shared, 4096);
@@ -974,14 +950,14 @@ store_many(int fd, unsigned ring, int timeout)
 static void
 sync_all(int fd, int num_children, int timeout)
 {
-	unsigned engines[16];
+	struct intel_engine_data Iengines = { };
+	unsigned int engines[EXECBUF_MAX_ENGINES];
 	int num_engines = 0;
 
-	for_each_physical_engine(e, fd) {
-		engines[num_engines++] = eb_ring(e);
-		if (num_engines == ARRAY_SIZE(engines))
-			break;
-	}
+	Iengines = intel_init_engine_list(fd, 0);
+	for (unsigned int n = 0; n < Iengines.nengines; n++)
+		engines[num_engines++] = Iengines.engines[n].flags;
+
 	igt_require(num_engines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -1025,17 +1001,18 @@ sync_all(int fd, int num_children, int timeout)
 static void
 store_all(int fd, int num_children, int timeout)
 {
+	struct intel_engine_data Iengines = { };
 	const int gen = intel_gen(intel_get_drm_devid(fd));
-	unsigned engines[16];
+	unsigned int engines[EXECBUF_MAX_ENGINES];
 	int num_engines = 0;
 
-	for_each_physical_engine(e, fd) {
-		if (!gem_can_store_dword(fd, eb_ring(e)))
+	Iengines = intel_init_engine_list(fd, 0);
+
+	for (unsigned int n = 0; n < Iengines.nengines; n++) {
+		if (!gem_class_can_store_dword(fd, Iengines.engines->class))
 			continue;
 
-		engines[num_engines++] = eb_ring(e);
-		if (num_engines == ARRAY_SIZE(engines))
-			break;
+		engines[num_engines++] = Iengines.engines[n].flags;
 	}
 	igt_require(num_engines);
 
@@ -1132,24 +1109,17 @@ store_all(int fd, int num_children, int timeout)
 static void
 preempt(int fd, unsigned ring, int num_children, int timeout)
 {
-	unsigned engines[16];
-	const char *names[16];
+	struct intel_engine_data Iengines = { };
 	int num_engines = 0;
 	uint32_t ctx[2];
 
 	if (ring == ALL_ENGINES) {
-		for_each_physical_engine(e, fd) {
-			names[num_engines] = e->name;
-			engines[num_engines++] = eb_ring(e);
-			if (num_engines == ARRAY_SIZE(engines))
-				break;
-		}
-
+		Iengines = intel_init_engine_list(fd, 0);
+		num_engines = Iengines.nengines;
 		num_children *= num_engines;
 	} else {
 		gem_require_ring(fd, ring);
-		names[num_engines] = NULL;
-		engines[num_engines++] = ring;
+		Iengines.engines[num_engines++].flags = ring;
 	}
 
 	ctx[0] = gem_context_create(fd);
@@ -1173,7 +1143,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
-		execbuf.flags = engines[child % num_engines];
+		execbuf.flags = Iengines.engines[child % num_engines].flags;
 		execbuf.rsvd1 = ctx[1];
 		gem_execbuf(fd, &execbuf);
 		gem_sync(fd, object.handle);
@@ -1194,8 +1164,8 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 			igt_spin_free(fd, spin);
 		} while ((elapsed = gettime() - start) < timeout);
 		igt_info("%s%sompleted %ld cycles: %.3f us\n",
-			 names[child % num_engines] ?: "",
-			 names[child % num_engines] ? " c" : "C",
+			 Iengines.engines[child % num_children].name ?: "",
+			 Iengines.engines[child % num_children].name ?  " c" : "C",
 			 cycles, elapsed*1e6/cycles);
 
 		gem_close(fd, object.handle);
@@ -1209,10 +1179,45 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 
 igt_main
 {
-	const struct intel_execution_engine *e;
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	int fd = -1;
 
+	struct {
+		const char *name;
+		void (*func)(int fd, unsigned int engine,
+			     int num_children, int timeout);
+		int num_children;
+		int timeout;
+	} *test, allengine[] = {
+		{ "basic-each", sync_ring, 1, 2},
+		{ "basic-store-each", store_ring, 1, 2},
+		{ "basic-many-each", store_many, 0, 2},
+		{ "switch-each", switch_ring, 1, 20},
+		{ "forked-switch-each", switch_ring, ncpus, 20},
+		{ "forked-each", sync_ring, ncpus, 20},
+		{ "forked-store-each", store_ring, ncpus, 20},
+		{ "active-each", active_ring, 0, 20},
+		{ "wakeup-each", wakeup_ring, 20, 1},
+		{ "active-wakeup-each", active_wakeup_ring, 20, 1},
+		{ "double-wakeup-each", wakeup_ring, 20, 2},
+		{ NULL, NULL },
+	}, tests[] = {
+		{ "default", sync_ring, 1, 20},
+		{ "idle", idle_ring, 0, 20},
+		{ "active", active_ring, 0, 20},
+		{ "wakeup", wakeup_ring, 20, 1},
+		{ "active-wakeup", active_wakeup_ring, 20, 1},
+		{ "double-wakeup", wakeup_ring, 20, 2},
+		{ "store", store_ring, 1, 20},
+		{ "switch", switch_ring, 1, 20},
+		{ "forked-switch", switch_ring, ncpus, 20},
+		{ "many", store_many, 0, 20},
+		{ "forked", sync_ring, ncpus, 20},
+		{ "forked-store", store_ring, ncpus, 20},
+		{ NULL, NULL },
+	};
+
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
@@ -1222,55 +1227,22 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
-	for (e = intel_execution_engines; e->name; e++) {
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
-	}
+	/* legacy of selecting engines. */
 
-	igt_subtest("basic-each")
-		sync_ring(fd, ALL_ENGINES, 1, 2);
-	igt_subtest("basic-store-each")
-		store_ring(fd, ALL_ENGINES, 1, 2);
-	igt_subtest("basic-many-each")
-		store_many(fd, ALL_ENGINES, 2);
-	igt_subtest("switch-each")
-		switch_ring(fd, ALL_ENGINES, 1, 20);
-	igt_subtest("forked-switch-each")
-		switch_ring(fd, ALL_ENGINES, ncpus, 20);
-	igt_subtest("forked-each")
-		sync_ring(fd, ALL_ENGINES, ncpus, 20);
-	igt_subtest("forked-store-each")
-		store_ring(fd, ALL_ENGINES, ncpus, 20);
-	igt_subtest("active-each")
-		active_ring(fd, ALL_ENGINES, 20);
-	igt_subtest("wakeup-each")
-		wakeup_ring(fd, ALL_ENGINES, 20, 1);
-	igt_subtest("active-wakeup-each")
-		active_wakeup_ring(fd, ALL_ENGINES, 20, 1);
-	igt_subtest("double-wakeup-each")
-		wakeup_ring(fd, ALL_ENGINES, 20, 2);
+	igt_subtest_group {
+		for (test = tests; test->name; test++) {
+			igt_subtest_with_dynamic_f("legacy-%s",
+						   test->name) {
+				for_each_physical_engine(e, fd) {
+					igt_dynamic_f("%s", e->name) {
+						 test->func(fd, eb_ring(e),
+							    test->num_children,
+							    test->timeout);
+					}
+				}
+			}
+		}
+	}
 
 	igt_subtest("basic-all")
 		sync_all(fd, 1, 2);
@@ -1286,7 +1258,39 @@ igt_main
 	igt_subtest("forked-store-all")
 		store_all(fd, ncpus, 20);
 
+
+	/* All Engines */
+	igt_subtest_group {
+		for (test = allengine; test->name; test++) {
+			igt_subtest_f("%s", test->name) {
+				test->func(fd, ALL_ENGINES,
+					   test->num_children,
+					   test->timeout);
+			}
+		}
+	}
+
+	/* New way of selecting engines. */
+	igt_subtest_group {
+		const struct intel_execution_engine2 *e;
+
+		for (test = tests; test->name; test++) {
+			igt_subtest_with_dynamic_f("%s", test->name) {
+				__for_each_physical_engine(fd, e) {
+					igt_dynamic_f("%s", e->name) {
+						test->func(fd, e->flags,
+							   test->num_children,
+							   test->timeout);
+					}
+				}
+			}
+		}
+	}
+
+
 	igt_subtest_group {
+		const struct intel_execution_engine2 *e;
+
 		igt_fixture {
 			gem_require_contexts(fd);
 			igt_require(gem_scheduler_has_ctx_priority(fd));
@@ -1295,10 +1299,12 @@ igt_main
 
 		igt_subtest("preempt-all")
 			preempt(fd, ALL_ENGINES, 1, 20);
-
-		for (e = intel_execution_engines; e->name; e++) {
-			igt_subtest_f("preempt-%s", e->name)
-				preempt(fd, eb_ring(e), ncpus, 20);
+		igt_subtest_with_dynamic("preempt") {
+			__for_each_physical_engine(fd, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+				igt_dynamic_f("%s", e->name)
+					preempt(fd, e->flags, ncpus, 20);
+			}
 		}
 	}
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
