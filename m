Return-path: <SRS0=itlh=TC=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7710E180
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Feb 2022 00:13:56 +0000 (UTC)
From: Jasmine Newsome <jasmine.newsome@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 16:10:13 -0800
Message-Id: <20220219001013.3528897-3-jasmine.newsome@intel.com>
In-Reply-To: <20220219001013.3528897-1-jasmine.newsome@intel.com>
References: <20220219001013.3528897-1-jasmine.newsome@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_spin_batch: Removing
 context persistence
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jasmine.newsome@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The spin all test relied on context persistence unecessarily by trying
to destroy contexts while keeping spinners active.
The current implementation of context persistence in i915 can cause
failures, and persistence is not needed for this test.

Moving intel_ctx_destroy after igt_spin_end.

Signed-off-by: Jasmine Newsome <jasmine.newsome@intel.com>
---
 tests/i915/gem_spin_batch.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index 653812c7..0835a122 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -143,6 +143,7 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg = ctx->cfg;
 	struct igt_spin *spin, *n;
+	const intel_ctx_t *local_ctx;
 	uint64_t ahnd;
 	IGT_LIST_HEAD(list);
 
@@ -151,18 +152,16 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 			continue;
 
 		if (flags & PARALLEL_SPIN_NEW_CTX)
-			ctx = intel_ctx_create(i915, &cfg);
+			local_ctx = intel_ctx_create(i915, &cfg);
 		ahnd = get_reloc_ahnd(i915, ctx->id);
 
 		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
 				    .ahnd = ahnd,
-				    .ctx = ctx,
+				    .ctx = (flags & PARALLEL_SPIN_NEW_CTX) ? local_ctx : ctx,
 				    .engine = e->flags,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_NO_PREEMPTION));
-		if (flags & PARALLEL_SPIN_NEW_CTX)
-			intel_ctx_destroy(i915, ctx);
 
 		igt_spin_busywait_until_started(spin);
 		igt_list_move(&spin->link, &list);
@@ -172,7 +171,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 		igt_assert(gem_bo_busy(i915, spin->handle));
 		ahnd = spin->ahnd;
 		igt_spin_end(spin);
-		gem_sync(i915, spin->handle);
+		if (flags & PARALLEL_SPIN_NEW_CTX)
+			intel_ctx_destroy(i915, spin->opts.ctx);
+                gem_sync(i915, spin->handle);
 		igt_spin_free(i915, spin);
 		put_ahnd(ahnd);
 	}
-- 
2.25.1
