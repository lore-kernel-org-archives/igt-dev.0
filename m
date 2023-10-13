Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:20:12 +0800
Message-Id: <20231013042012.409376-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests: save GPU engine information more properly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We encounter a unexpected error on chrome book device while
running kms_busy test. It will restore GPU engine's timeout
value but open incorrect file name (XR24 in below).

openat(AT_FDCWD, "/sys/dev/char/226:0", O_RDONLY) = 12
openat(12, "dev", O_RDONLY)             = 13
read(13, "226:0\n", 1023)               = 6
close(13)                               = 0
openat(12, "engine", O_RDONLY)          = 13
close(12)                               = 0
openat(13, "XR24", O_RDONLY)            = -1 ENOENT (No such file or directory)

Test code did not save engine data properly to cause this problem.
So modify the code to save GPU engine information into a globla variable
to avoid test deamon to open incorrect file again.

Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/147
Fixes: 9e635a1c5029 ("tests/kms_busy: Ensure GPU reset when waiting
for a new FB during modeset")
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 lib/i915/gem_engine_topology.c | 12 ++++++------
 lib/i915/gem_engine_topology.h |  2 +-
 tests/intel/gem_exec_capture.c |  2 +-
 tests/intel/gem_reset_stats.c  |  2 +-
 tests/intel/i915_hangman.c     |  2 +-
 tests/intel/kms_busy.c         |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 7c6cd9ba97db..afb576afb2dc 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -571,23 +571,23 @@ void gem_engine_properties_configure(int fd, struct gem_engine_properties *param
 	int ret;
 	struct gem_engine_properties write = *params;
 
-	ret = gem_engine_property_scanf(fd, write.engine->name,
+	ret = gem_engine_property_scanf(fd, write.engine.name,
 					"heartbeat_interval_ms",
 					"%d", &params->heartbeat_interval);
 	igt_assert_eq(ret, 1);
 
-	ret = gem_engine_property_printf(fd, write.engine->name,
+	ret = gem_engine_property_printf(fd, write.engine.name,
 					 "heartbeat_interval_ms", "%d",
 					 write.heartbeat_interval);
 	igt_assert_lt(0, ret);
 
 	if (gem_scheduler_has_preemption(fd)) {
-		ret = gem_engine_property_scanf(fd, write.engine->name,
+		ret = gem_engine_property_scanf(fd, write.engine.name,
 						"preempt_timeout_ms",
 						"%d", &params->preempt_timeout);
 		igt_assert_eq(ret, 1);
 
-		ret = gem_engine_property_printf(fd, write.engine->name,
+		ret = gem_engine_property_printf(fd, write.engine.name,
 						 "preempt_timeout_ms", "%d",
 						 write.preempt_timeout);
 		igt_assert_lt(0, ret);
@@ -598,13 +598,13 @@ void gem_engine_properties_restore(int fd, const struct gem_engine_properties *s
 {
 	int ret;
 
-	ret = gem_engine_property_printf(fd, saved->engine->name,
+	ret = gem_engine_property_printf(fd, saved->engine.name,
 					 "heartbeat_interval_ms", "%d",
 					 saved->heartbeat_interval);
 	igt_assert_lt(0, ret);
 
 	if (gem_scheduler_has_preemption(fd)) {
-		ret = gem_engine_property_printf(fd, saved->engine->name,
+		ret = gem_engine_property_printf(fd, saved->engine.name,
 						 "preempt_timeout_ms", "%d",
 						 saved->preempt_timeout);
 		igt_assert_lt(0, ret);
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 89642c31721c..9eb9d5ddc888 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -122,7 +122,7 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 	     intel_next_engine(&i__##e__))
 
 struct gem_engine_properties {
-	const struct intel_execution_engine2 *engine;
+	struct intel_execution_engine2 engine;
 	int preempt_timeout;
 	int heartbeat_interval;
 };
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index ab8305e4dfaf..d231c53b98e1 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -258,7 +258,7 @@ configure_hangs(int fd, const struct intel_execution_engine2 *e, int ctxt_id)
 	struct gem_engine_properties props;
 
 	/* Ensure fast hang detection */
-	props.engine = e;
+	props.engine = *e;
 	props.preempt_timeout = 250;
 	props.heartbeat_interval = 500;
 	gem_engine_properties_configure(fd, &props);
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 6939722c7001..5dfc1fc677ec 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -1004,7 +1004,7 @@ static void test_shared_reset_domain(const intel_ctx_cfg_t *base_cfg,
 
 	sync_gpu();
 
-	params.engine = e;
+	params.engine = *e;
 	params.preempt_timeout = 1;
 	params.heartbeat_interval = 250;
 	gem_engine_properties_configure(device, &params);
diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index dcd34cd0ebfe..8a7de562609c 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -600,7 +600,7 @@ igt_main
 		gem_require_mmap_device_coherent(device);
 
 		for_each_physical_engine(device, e) {
-			saved_params[num_engines].engine = e;
+			saved_params[num_engines].engine = *e;
 			saved_params[num_engines].preempt_timeout = 500;
 			saved_params[num_engines].heartbeat_interval = 1000;
 			gem_engine_properties_configure(device, saved_params + num_engines++);
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 5b620658fb18..50616513c5ba 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -404,7 +404,7 @@ static void gpu_engines_init_timeouts(int fd, int max_engines,
 	for_each_physical_engine(fd, e) {
 		igt_assert(*num_engines < max_engines);
 
-		props[*num_engines].engine = e;
+		props[*num_engines].engine = *e;
 		props[*num_engines].preempt_timeout = 0;
 		props[*num_engines].heartbeat_interval = 250;
 
-- 
2.34.1
