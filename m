Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 31 Jan 2023 10:17:31 +0100
Message-Id: <20230131091731.5892-3-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/perf: Exercise barrier race
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a new subtest focused on exercising interaction between perf open /
close operations, which replace active barriers with perf requests, and
concurrent barrier preallocate / acquire operations performed during
context first pin / last unpin.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 tests/i915/perf.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index e33cacc443..11a3ec21ab 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -39,6 +39,7 @@
 #include <math.h>
 
 #include "i915/gem.h"
+#include "i915/gem_create.h"
 #include "i915/perf.h"
 #include "igt.h"
 #include "igt_perf.h"
@@ -4885,7 +4886,27 @@ test_whitelisted_registers_userspace_config(void)
 	i915_perf_remove_config(drm_fd, config_id);
 }
 
-static void test_open_race(const struct intel_execution_engine2 *e, int timeout)
+static void gem_exec_nop(int i915, const struct intel_execution_engine2 *e)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj = { };
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+	};
+
+	obj.handle = gem_create(i915, 4096);
+	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
+
+	execbuf.flags = e->flags;
+	gem_execbuf(i915, &execbuf);
+
+	gem_sync(i915, obj.handle);
+	gem_close(i915, obj.handle);
+}
+
+static void test_open_race(const struct intel_execution_engine2 *e, int timeout,
+			   bool use_spin)
 {
 	int *done;
 
@@ -4926,6 +4947,12 @@ static void test_open_race(const struct intel_execution_engine2 *e, int timeout)
 				ctx = gem_context_create_for_engine(i915, e->class, e->instance);
 				gem_context_set_persistence(i915, ctx, persistence);
 
+				if (!use_spin) {
+					gem_exec_nop(i915, e);
+					gem_context_destroy(i915, ctx);
+					continue;
+				}
+
 				spin = __igt_spin_new(i915, ctx, .ahnd = ahnd);
 				for (int i = random() % 7; i--; ) {
 					if (random() & 1) {
@@ -5330,7 +5357,17 @@ igt_main
 		for_each_physical_engine(drm_fd, e)
 			if (e->class == I915_ENGINE_CLASS_RENDER)
 				igt_dynamic_f("%s", e->name)
-					test_open_race(e, 5);
+					test_open_race(e, 5, true);
+	}
+
+	igt_describe("Exercise perf open/close against intensive barrier preallocate/acquire");
+	igt_subtest_with_dynamic("barrier-race") {
+		const struct intel_execution_engine2 *e;
+
+		for_each_physical_engine(drm_fd, e)
+			if (e->class == I915_ENGINE_CLASS_RENDER)
+				igt_dynamic_f("%s", e->name)
+					test_open_race(e, 5, false);
 	}
 
 	igt_fixture {
-- 
2.25.1
