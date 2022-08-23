Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC429B2AFC
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 09:56:56 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 11:56:45 +0200
Message-Id: <20220823095645.14580-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] i915/i915_hangman: fail only after
 freeing spinners
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Failed checks may cause following tests fail, so check for
errors only after all spinners are released.

v2: be verbose about what failed (Chris)
v3: simplify declaration, add separate wait var (Zbigniew)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/i915_hangman.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index c7d69fdd..3b60ff46 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -295,6 +295,12 @@ static void context_unban(int fd, unsigned ctx)
 	gem_context_set_param(fd, &param);
 }
 
+#define ERR_HANG_WAIT  0
+#define ERR_HANG_STAT  1
+#define ERR_FENCE_BUSY 2
+#define ERR_FENCE_END  3
+#define ERR_FENCE_STAT 4
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -305,6 +311,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 	IGT_LIST_HEAD(list);
 	uint64_t ahnd = get_reloc_ahnd(device, ctx->id), ahndN;
 	int num_ctx;
+	int err[ERR_FENCE_STAT + 1] = {};
 
 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
 		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
@@ -340,18 +347,21 @@ test_engine_hang(const intel_ctx_t *ctx,
 				      flags));
 
 	/* Wait for the hangcheck to terminate the hanger */
-	igt_assert(sync_fence_wait(spin->out_fence, 30000) == 0); /* 30s */
-	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
+	err[ERR_HANG_WAIT] = sync_fence_wait(spin->out_fence, 30000) << 8; /* 30s */
+	err[ERR_HANG_STAT] = sync_fence_status(spin->out_fence); /* -EIO */
 	igt_spin_free(device, spin);
 
 	/* But no other engines/clients should be affected */
 	igt_list_for_each_entry_safe(spin, next, &list, link) {
 		ahndN = spin->opts.ahnd;
-		igt_assert(sync_fence_wait(spin->out_fence, 0) == -ETIME);
+		if (sync_fence_wait(spin->out_fence, 0) != -ETIME)
+			err[ERR_FENCE_BUSY]++;
 		igt_spin_end(spin);
 
-		igt_assert(sync_fence_wait(spin->out_fence, 500) == 0);
-		igt_assert_eq(sync_fence_status(spin->out_fence), 1);
+		if (sync_fence_wait(spin->out_fence, 500) != 0)
+			err[ERR_FENCE_END]++;
+		if (sync_fence_status(spin->out_fence) != 1)
+			err[ERR_FENCE_STAT]++;
 		igt_spin_free(device, spin);
 		put_ahnd(ahndN);
 	}
@@ -360,6 +370,11 @@ test_engine_hang(const intel_ctx_t *ctx,
 	while (num_ctx)
 		intel_ctx_destroy(device, local_ctx[--num_ctx]);
 
+	igt_assert_f(err[ERR_HANG_WAIT] == 0, "hanged spinner wait failed\n");
+	igt_assert_f(err[ERR_HANG_STAT] == -EIO, "hanged spinner failed\n");
+	igt_assert_f(err[ERR_FENCE_BUSY] == 0, "background spinner not busy\n");
+	igt_assert_f(err[ERR_FENCE_END] == 0, "background spinner not terminated\n");
+	igt_assert_f(err[ERR_FENCE_STAT] == 0, "background fence not signalled\n");
 	check_alive();
 }
 
-- 
2.34.1
