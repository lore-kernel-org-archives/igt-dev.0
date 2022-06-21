Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBED10E279
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 13:49:45 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 19:15:26 +0530
Message-Id: <20220621134526.2040218-3-riana.tauro@intel.com>
In-Reply-To: <20220621134526.2040218-1-riana.tauro@intel.com>
References: <20220621134526.2040218-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/pm_rc6_residency: Extend
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

Run rc6_idle on a single instance of every engine

v2: add dynamic subtest (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index 7c1ff32b..e377e70c 100644
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
@@ -539,11 +540,18 @@ igt_main
 		ctx = intel_ctx_create_all_physical(i915);
 	}
 
-	igt_subtest("rc6-idle") {
+	igt_subtest_with_dynamic("rc6-idle") {
+		const struct intel_execution_engine2 *e;
+
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
-- 
2.25.1
