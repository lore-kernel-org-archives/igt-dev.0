Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE0C6E214
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:59 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id l123so10551246pfl.8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:20 -0500
Message-Id: <20210413035350.261794-45-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 44/74] tests/i915/gem_create: Convert to
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
 tests/i915/gem_create.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index ce985053..890dd8e8 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -245,20 +245,24 @@ static void always_clear(int i915, int timeout)
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
@@ -271,6 +275,8 @@ static void busy_create(int i915, int timeout)
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
