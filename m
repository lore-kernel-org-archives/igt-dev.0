Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1876E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:01 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3563951pjx.1
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:18 -0500
Message-Id: <20210707144643.181001-7-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 56/81] lib/i915: Require a context config in
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_submission.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 9c6cc8146..69cf1f16a 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -372,7 +372,7 @@ __measure_ringsize(int i915, uint32_t ctx_id, unsigned int engine)
 unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
 				    unsigned int engine)
 {
-	const intel_ctx_t *ctx = NULL;
+	const intel_ctx_t *ctx;
 	unsigned int size;
 	bool nonblock;
 
@@ -380,40 +380,26 @@ unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
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
