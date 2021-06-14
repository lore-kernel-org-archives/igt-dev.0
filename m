Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEFB89F4F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:37:54 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso238964pjz.0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:37:54 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:44 -0500
Message-Id: <20210614163704.365989-30-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 29/77] tests/i915/gem_create: Convert to
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_create.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 167d7d28a..1acf8ee6a 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -246,20 +246,24 @@ static void always_clear(int i915, int timeout)
 static void busy_create(int i915, int timeout)
 {
 	struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	igt_spin_t *spin[I915_EXEC_RING_MASK + 1];
 	unsigned long count = 0;
 
+	ctx = intel_ctx_create_all_physical(i915);
+
 	igt_fork_hang_detector(i915);
-	__for_each_physical_engine(i915, e)
-		spin[e->flags] = igt_spin_new(i915, .engine = e->flags);
+	for_each_ctx_engine(i915, ctx, e)
+		spin[e->flags] = igt_spin_new(i915, .ctx = ctx,
+					      .engine = e->flags);
 
 	igt_until_timeout(timeout) {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			uint32_t handle;
 			igt_spin_t *next;
 
 			handle = gem_create(i915, 4096);
-			next = igt_spin_new(i915,
+			next = igt_spin_new(i915, .ctx = ctx,
 					    .engine = e->flags,
 					    .dependency = handle,
 					    .flags = IGT_SPIN_SOFTDEP);
@@ -272,6 +276,8 @@ static void busy_create(int i915, int timeout)
 		}
 	}
 
+	intel_ctx_destroy(i915, ctx);
+
 	igt_info("Created %ld objects while busy\n", count);
 
 	gem_quiescent_gpu(i915);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
