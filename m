Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9656E986
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:15:32 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n12so5712450pgs.13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:15:32 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:14:53 -0500
Message-Id: <20210617191516.577394-7-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 56/79] lib/i915: Require a context config in
 gem_submission_measure
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

Now all tests are converted to provide a context config to
gem_submission_measure so we can require it.  This gets rid of its use
of __for_each_physical_engine().

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_submission.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index bec952493..98074ab26 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -373,7 +373,7 @@ __measure_ringsize(int i915, uint32_t ctx_id, unsigned int engine)
 unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 				    unsigned int engine)
 {
-	const intel_ctx_t *ctx = NULL;
+	const intel_ctx_t *ctx;
 	unsigned int size;
 	bool nonblock;
 
@@ -381,40 +381,26 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 	if (!nonblock)
 		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
 
-	if (cfg) {
-		if (gem_has_contexts(i915))
-			ctx = intel_ctx_create(i915, cfg);
-		else
-			ctx = intel_ctx_0(i915);
-	}
+	igt_assert(cfg);
+	if (gem_has_contexts(i915))
+		ctx = intel_ctx_create(i915, cfg);
+	else
+		ctx = intel_ctx_0(i915);
 
 	if (engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *e;
 
 		size = -1;
-		if (ctx) {
-			for_each_ctx_engine(i915, ctx, e) {
-				unsigned int this =  __measure_ringsize(i915, ctx->id, e->flags);
-				if (this < size)
-					size = this;
-			}
-		} else {
-			__for_each_physical_engine(i915, e) {
-				unsigned int this =  __measure_ringsize(i915, 0, e->flags);
-				if (this < size)
-					size = this;
-			}
+		for_each_ctx_engine(i915, ctx, e) {
+			unsigned int this =  __measure_ringsize(i915, ctx->id, e->flags);
+			if (this < size)
+				size = this;
 		}
 	} else {
-		if (ctx)
-			size =  __measure_ringsize(i915, ctx->id, engine);
-		else
-			size =  __measure_ringsize(i915, 0, engine);
+		size =  __measure_ringsize(i915, ctx->id, engine);
 	}
 
-	if (ctx)
-		intel_ctx_destroy(i915, ctx);
-
+	intel_ctx_destroy(i915, ctx);
 
 	if (!nonblock)
 		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
