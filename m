Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752C6EC78
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:09 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f29so36052603pgm.8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:07 -0500
Message-Id: <20210423214853.876911-44-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 43/89] tests/i915/gem_request_retire:
 Convert to intel_ctx_t
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
 tests/i915/gem_request_retire.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
index c23ddfb7..3df54f2a 100644
--- a/tests/i915/gem_request_retire.c
+++ b/tests/i915/gem_request_retire.c
@@ -62,24 +62,26 @@ static void
 test_retire_vma_not_inactive(int fd)
 {
 	struct intel_execution_engine2 *e;
-
+	const intel_ctx_t *ctx;
 	igt_spin_t *bg = NULL;
 
-	__for_each_physical_engine(fd, e) {
+	ctx = intel_ctx_create_all_physical(fd);
+
+	for_each_ctx_engine(fd, ctx, e) {
 		igt_spin_t *spin;
-		uint32_t ctx;
+		const intel_ctx_t *spin_ctx;
 
 		if (!bg) {
-			bg = igt_spin_new(fd, .engine = e->flags);
+			bg = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
 			continue;
 		}
 
-		ctx = gem_context_clone_with_engines(fd, 0);
-		spin = igt_spin_new(fd, ctx,
+		spin_ctx = intel_ctx_create(fd, &ctx->cfg);
+		spin = igt_spin_new(fd, .ctx = spin_ctx,
 				    .engine = e->flags,
 				    .dependency = bg->handle,
 				    .flags = IGT_SPIN_SOFTDEP);
-		gem_context_destroy(fd, ctx);
+		intel_ctx_destroy(fd, spin_ctx);
 		igt_spin_end(spin);
 
 		gem_sync(fd, spin->handle);
@@ -88,6 +90,7 @@ test_retire_vma_not_inactive(int fd)
 
 	igt_drop_caches_set(fd, DROP_RETIRE);
 	igt_spin_free(fd, bg);
+	intel_ctx_destroy(fd, ctx);
 }
 
 int fd;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
