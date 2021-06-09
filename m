Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8669B6E13C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:39:27 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id s14so18076011pfd.9
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:39:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:38:31 -0500
Message-Id: <20210609173903.249112-12-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 61/93] tests/i915/pm_rc6_residency: Convert
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/i915_pm_rc6_residency.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index bfbe4ab0..d1cce474 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -455,6 +455,7 @@ static void rc6_fence(int i915)
 	const int tolerance = 20; /* Some RC6 is better than none! */
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
 	unsigned long slept;
 	uint64_t rc6, ts[2];
@@ -484,14 +485,15 @@ static void rc6_fence(int i915)
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
@@ -519,6 +521,7 @@ static void rc6_fence(int i915)
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
