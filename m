Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155A610E341
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 04:59:27 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Jun 2022 10:24:05 +0530
Message-Id: <20220608045405.1445705-2-riana.tauro@intel.com>
In-Reply-To: <20220608045405.1445705-1-riana.tauro@intel.com>
References: <20220608045405.1445705-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/pm_rc6_residency: Extend
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

rc6-idle should set up bg_load() on single instance of every
engine

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf9eae90..1668372a 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -292,9 +292,10 @@ static void sighandler(int sig)
 {
 }
 
-static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
+static void bg_load(int i915, const intel_ctx_t *ctx, unsigned int flags, unsigned long *ctl)
 {
 	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = batch_create(i915),
 	};
@@ -313,7 +314,13 @@ static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
 
 		igt_nsec_elapsed(&tv);
 
-		gem_execbuf(i915, &execbuf);
+		for_each_ctx_engine(i915, ctx, e) {
+			if (e->instance == 0) {
+				execbuf.flags = e->flags;
+				gem_execbuf(i915, &execbuf);
+			}
+		}
+
 		submit = igt_nsec_elapsed(&tv);
 		if (flags & WAITBOOST) {
 			gem_sync(i915, obj.handle);
@@ -362,6 +369,7 @@ static void rc6_idle(int i915)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
+	const intel_ctx_t *ctx;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	struct {
 		const char *name;
@@ -379,6 +387,7 @@ static void rc6_idle(int i915)
 	struct rapl rapl;
 	int fd;
 
+	ctx = intel_ctx_create_all_physical(i915);
 	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
 	igt_drop_caches_set(i915, DROP_IDLE);
 	igt_require(__pmu_wait_for_rc6(fd));
@@ -404,7 +413,7 @@ static void rc6_idle(int i915)
 	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
 		memset(done, 0, 2 * sizeof(*done));
 		igt_fork(child, 1) /* Setup up a very light load */
-			bg_load(i915, phases[p].flags, done);
+			bg_load(i915, ctx, phases[p].flags, done);
 
 		rapl_read(&rapl, &sample[0]);
 		cycles = -READ_ONCE(done[1]);
@@ -436,6 +445,7 @@ static void rc6_idle(int i915)
 	}
 
 	munmap(done, 4096);
+	intel_ctx_destroy(i915, ctx);
 	close(fd);
 
 	rapl_close(&rapl);
-- 
2.25.1
