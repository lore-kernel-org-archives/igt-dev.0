Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6283410E273
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 17:28:21 +0000 (UTC)
From: Jasmine Newsome <jasmine.newsome@intel.com>
Date: Mon, 14 Feb 2022 09:22:08 -0800
Message-Id: <20220214172208.3338908-2-jasmine.newsome@intel.com>
In-Reply-To: <20220214172208.3338908-1-jasmine.newsome@intel.com>
References: <20220214172208.3338908-1-jasmine.newsome@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/gem_spin_batch: Removing
 context persistence
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
Cc: jasmine.newsome@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The spin all test relied on context persistence unecessarily
by trying to destroy contexts while keeping spinners active.
The current implementation of context persistence in i915
can cause failures, and persistence is not needed for this
test.

Moving intel_ctx_destroy after igt_spin_end/free.

Signed-off-by: Jasmine Newsome <jasmine.newsome@intel.com>
---
 tests/i915/gem_spin_batch.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index 653812c7..65dccd83 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -145,28 +145,31 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 	struct igt_spin *spin, *n;
 	uint64_t ahnd;
 	IGT_LIST_HEAD(list);
+        const intel_ctx_t *local_ctx[GEM_MAX_ENGINES];
+        int num_ctx;
 
-	for_each_ctx_cfg_engine(i915, &cfg, e) {
+	num_ctx = 0;
+        for_each_ctx_cfg_engine(i915, &cfg, e) {
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
 		if (flags & PARALLEL_SPIN_NEW_CTX)
-			ctx = intel_ctx_create(i915, &cfg);
+			local_ctx[num_ctx] = intel_ctx_create(i915, &cfg);
 		ahnd = get_reloc_ahnd(i915, ctx->id);
 
 		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
 				    .ahnd = ahnd,
-				    .ctx = ctx,
+				    .ctx = local_ctx[num_ctx],
 				    .engine = e->flags,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_NO_PREEMPTION));
-		if (flags & PARALLEL_SPIN_NEW_CTX)
-			intel_ctx_destroy(i915, ctx);
 
-		igt_spin_busywait_until_started(spin);
-		igt_list_move(&spin->link, &list);
-	}
+                igt_assert_eq(spin->execbuf.rsvd1, local_ctx[num_ctx]->id);
+                igt_spin_busywait_until_started(spin);
+                igt_list_move(&spin->link, &list);
+                num_ctx++;
+        }
 
 	igt_list_for_each_entry_safe(spin, n, &list, link) {
 		igt_assert(gem_bo_busy(i915, spin->handle));
@@ -176,6 +179,11 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 		igt_spin_free(i915, spin);
 		put_ahnd(ahnd);
 	}
+
+       if (flags & PARALLEL_SPIN_NEW_CTX){
+               while (num_ctx)
+                       intel_ctx_destroy(i915, local_ctx[--num_ctx]);
+       }
 }
 
 static bool has_userptr(int fd)
-- 
2.25.1
