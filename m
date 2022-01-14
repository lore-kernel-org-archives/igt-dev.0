Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Fri, 14 Jan 2022 10:17:07 -0800
Message-Id: <20220114181713.1798514-10-John.C.Harrison@Intel.com>
In-Reply-To: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
References: <20220114181713.1798514-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 i-g-t 09/15] tests/i915/i915_hangman: Remove
 reliance on context persistance
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The hang test was relying on context persitence for no particular
reason. That is, it would set a bunch of background spinners running
then immediately destroy the active contexts but expect the spinners
to keep spinning. With the current implementation of context
persistence in i915, that means that super high priority pings are
sent to each engine at the start of the test. Depending upon the
timing and platform, one of those unexpected pings could cause test
failures.

There is no need to require context persitence in this test. So change
to managing the contexts cleanly and only destroying them when they
are no longer in use.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/i915_hangman.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 73a86ec9e..24087931c 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -289,27 +289,29 @@ test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
 {
 	const struct intel_execution_engine2 *other;
-	const intel_ctx_t *tmp_ctx;
+	const intel_ctx_t *local_ctx[GEM_MAX_ENGINES];
 	igt_spin_t *spin, *next;
 	IGT_LIST_HEAD(list);
 	uint64_t ahnd = get_reloc_ahnd(device, ctx->id), ahndN;
+	int num_ctx;
 
 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
 		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
 
 	/* Fill all the other engines with background load */
+	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
 		if (other->flags == e->flags)
 			continue;
 
-		tmp_ctx = intel_ctx_create(device, &ctx->cfg);
-		ahndN = get_reloc_ahnd(device, tmp_ctx->id);
+		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
+		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
 		spin = __igt_spin_new(device,
 				      .ahnd = ahndN,
-				      .ctx = tmp_ctx,
+				      .ctx = local_ctx[num_ctx],
 				      .engine = other->flags,
 				      .flags = IGT_SPIN_FENCE_OUT);
-		intel_ctx_destroy(device, tmp_ctx);
+		num_ctx++;
 
 		igt_list_move(&spin->link, &list);
 	}
@@ -339,7 +341,10 @@ test_engine_hang(const intel_ctx_t *ctx,
 		igt_spin_free(device, spin);
 		put_ahnd(ahndN);
 	}
+
 	put_ahnd(ahnd);
+	while (num_ctx)
+		intel_ctx_destroy(device, local_ctx[--num_ctx]);
 
 	check_alive();
 }
-- 
2.25.1
