Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24936E1A8
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:47 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id a85so10120704pfa.0
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:47 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:12 -0500
Message-Id: <20210413035350.261794-37-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 36/74] tests/i915/gem_ctx_exec: Convert to
 intel_ctx_t
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
 tests/i915/gem_ctx_exec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 95b286b2..54374b7b 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -267,7 +267,7 @@ static void nohangcheck_hostile(int i915)
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
 	int fence = -1;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 	int err = 0;
 	int dir;
 
@@ -281,12 +281,12 @@ static void nohangcheck_hostile(int i915)
 	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
-	ctx = gem_context_create(i915);
-	hang = igt_allow_hang(i915, ctx, 0);
+	ctx = intel_ctx_create_all_physical(i915);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 
 	igt_require(__enable_hangcheck(dir, false));
 
-	____for_each_physical_engine(i915, ctx, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int new;
 
@@ -294,7 +294,7 @@ static void nohangcheck_hostile(int i915)
 		gem_engine_property_printf(i915, e->name,
 					   "preempt_timeout_ms", "%d", 50);
 
-		spin = __igt_spin_new(i915, ctx,
+		spin = __igt_spin_new(i915, .ctx = ctx,
 				      .engine = e->flags,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_FENCE_OUT));
@@ -315,7 +315,7 @@ static void nohangcheck_hostile(int i915)
 			fence = tmp;
 		}
 	}
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 	igt_assert(fence != -1);
 
 	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
