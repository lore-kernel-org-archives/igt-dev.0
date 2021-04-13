Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46BA6E24E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:20 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id d10so10984149pgf.12
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:35 -0500
Message-Id: <20210413035350.261794-60-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 59/74] tests/i915/pm_rc6_residency: Convert
 to intel_ctx_t
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
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/i915/i915_pm_rc6_residency.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index d484121e..ceb506aa 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -454,6 +454,7 @@ static void rc6_fence(int i915)
 	const int tolerance = 20; /* Some RC6 is better than none! */
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
 	unsigned long slept;
 	uint64_t rc6, ts[2];
@@ -483,14 +484,15 @@ static void rc6_fence(int i915)
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
 	/* Submit but delay execution, we should be idle and conserving power */
-	__for_each_physical_engine(i915, e) {
+	ctx = intel_ctx_create_all_physical(i915);
+	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int timeline;
 		int fence;
 
 		timeline = sw_sync_timeline_create();
 		fence = sw_sync_timeline_create_fence(timeline, 1);
-		spin = igt_spin_new(i915,
+		spin = igt_spin_new(i915, .ctx = ctx,
 				    .engine = e->flags,
 				    .fence = fence,
 				    .flags = IGT_SPIN_FENCE_IN);
@@ -518,6 +520,7 @@ static void rc6_fence(int i915)
 		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
 		gem_quiescent_gpu(i915);
 	}
+	intel_ctx_destroy(i915, ctx);
 
 	rapl_close(&rapl);
 	close(fd);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
