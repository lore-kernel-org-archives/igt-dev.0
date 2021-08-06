Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559716EBA8
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:43:10 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:35 +0200
Message-Id: <20210806134145.24634-47-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 46/56] tests/i915_pm_rc6_residency: Adopt
 to use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index d1cce474e..96a951406 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -458,7 +458,7 @@ static void rc6_fence(int i915)
 	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
 	unsigned long slept;
-	uint64_t rc6, ts[2];
+	uint64_t rc6, ts[2], ahnd;
 	struct rapl rapl;
 	int fd;
 
@@ -486,6 +486,7 @@ static void rc6_fence(int i915)
 
 	/* Submit but delay execution, we should be idle and conserving power */
 	ctx = intel_ctx_create_all_physical(i915);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int timeline;
@@ -493,7 +494,9 @@ static void rc6_fence(int i915)
 
 		timeline = sw_sync_timeline_create();
 		fence = sw_sync_timeline_create_fence(timeline, 1);
-		spin = igt_spin_new(i915, .ctx = ctx,
+		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
+				    .ctx = ctx,
 				    .engine = e->flags,
 				    .fence = fence,
 				    .flags = IGT_SPIN_FENCE_IN);
@@ -522,6 +525,7 @@ static void rc6_fence(int i915)
 		gem_quiescent_gpu(i915);
 	}
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 
 	rapl_close(&rapl);
 	close(fd);
-- 
2.26.0
