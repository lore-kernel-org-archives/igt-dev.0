Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581E510F600
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 10:10:18 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 15:36:05 +0530
Message-Id: <20220621100606.2037879-2-riana.tauro@intel.com>
In-Reply-To: <20220621100606.2037879-1-riana.tauro@intel.com>
References: <20220621100606.2037879-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/pm_rc6_residency: Extend
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf9eae90..560b635f 100644
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
@@ -534,17 +535,25 @@ static void rc6_fence(int i915)
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
@@ -592,7 +601,9 @@ igt_main
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
