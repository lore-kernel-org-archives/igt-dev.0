Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CE310E298
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jun 2022 07:01:09 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Jun 2022 12:26:57 +0530
Message-Id: <20220620065657.1818332-2-riana.tauro@intel.com>
In-Reply-To: <20220620065657.1818332-1-riana.tauro@intel.com>
References: <20220620065657.1818332-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/1] tests/i915/pm_rc6_residency: Extend
 rc6-idle test on remaining engines
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

rc6_idle should run on a single instance of every engine

v2: add dynamic subtest (Anshuman)
v3: use intel_ctx calls from igt_fixture for rc6_fence (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf9eae90..043370cc 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -292,7 +292,7 @@ static void sighandler(int sig)
 {
 }
 
-static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
+static void bg_load(int i915, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
 {
 	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -301,6 +301,7 @@ static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
+		.flags = engine_flags,
 	};
 	struct sigaction act = {
 		.sa_handler = sighandler
@@ -358,7 +359,7 @@ static void kill_children(int sig)
 	signal(sig, old);
 }
 
-static void rc6_idle(int i915)
+static void rc6_idle(int i915, uint64_t flags)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
@@ -404,7 +405,7 @@ static void rc6_idle(int i915)
 	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
 		memset(done, 0, 2 * sizeof(*done));
 		igt_fork(child, 1) /* Setup up a very light load */
-			bg_load(i915, phases[p].flags, done);
+			bg_load(i915, flags, phases[p].flags, done);
 
 		rapl_read(&rapl, &sample[0]);
 		cycles = -READ_ONCE(done[1]);
@@ -449,13 +450,12 @@ static void rc6_idle(int i915)
 	}
 }
 
-static void rc6_fence(int i915)
+static void rc6_fence(int i915, const intel_ctx_t *ctx)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
-	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
 	unsigned long slept;
 	uint64_t rc6, ts[2], ahnd;
@@ -485,7 +485,6 @@ static void rc6_fence(int i915)
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
 	/* Submit but delay execution, we should be idle and conserving power */
-	ctx = intel_ctx_create_all_physical(i915);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
@@ -524,7 +523,6 @@ static void rc6_fence(int i915)
 		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
 		gem_quiescent_gpu(i915);
 	}
-	intel_ctx_destroy(i915, ctx);
 	put_ahnd(ahnd);
 
 	rapl_close(&rapl);
@@ -534,24 +532,32 @@ static void rc6_fence(int i915)
 igt_main
 {
 	int i915 = -1;
+	const intel_ctx_t *ctx;
+	const struct intel_execution_engine2 *e;
 
 	/* Use drm_open_driver to verify device existence */
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
+		ctx = intel_ctx_create_all_physical(i915);
 	}
 
-	igt_subtest("rc6-idle") {
+	igt_subtest_with_dynamic("rc6-idle") {
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
 
-		rc6_idle(i915);
+		for_each_ctx_engine(i915, ctx, e) {
+			if (e->instance == 0) {
+				igt_dynamic_f("%s", e->name)
+					rc6_idle(i915, e->flags);
+			}
+		}
 	}
 
 	igt_subtest("rc6-fence") {
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
 
-		rc6_fence(i915);
+		rc6_fence(i915, ctx);
 	}
 
 	igt_subtest_group {
@@ -592,7 +598,9 @@ igt_main
 			close(sysfs);
 	}
 
-	igt_fixture
+	igt_fixture {
+		intel_ctx_destroy(i915, ctx);
 		close(i915);
+	}
 
 }
-- 
2.25.1
