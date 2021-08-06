Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9EE6EBAA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:48:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:37 +0200
Message-Id: <20210806094649.21162-45-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 44/56] tests/i915_hangman: Adopt to use
 allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_hangman.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index ddead9493..4c18c22db 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -211,10 +211,12 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
 	uint32_t *batch;
 	igt_hang_t hang;
 	uint64_t offset;
+	uint64_t ahnd = get_reloc_ahnd(device, ctx->id);
 
 	clear_error_state();
 
-	hang = igt_hang_ctx(device, ctx->id, ring_id, HANG_ALLOW_CAPTURE);
+	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, ring_id,
+				      HANG_ALLOW_CAPTURE);
 	offset = hang.spin->obj[IGT_SPIN_BATCH].offset;
 
 	batch = gem_mmap__cpu(device, hang.spin->handle, 0, 4096, PROT_READ);
@@ -224,6 +226,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
 
 	check_error_state(ring_name, offset, batch);
 	munmap(batch, 4096);
+	put_ahnd(ahnd);
 }
 
 static void
@@ -234,6 +237,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 	const intel_ctx_t *tmp_ctx;
 	igt_spin_t *spin, *next;
 	IGT_LIST_HEAD(list);
+	uint64_t ahnd = get_reloc_ahnd(device, ctx->id), ahndN;
 
 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
 		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
@@ -244,7 +248,10 @@ test_engine_hang(const intel_ctx_t *ctx,
 			continue;
 
 		tmp_ctx = intel_ctx_create(device, &ctx->cfg);
-		spin = __igt_spin_new(device, .ctx = tmp_ctx,
+		ahndN = get_reloc_ahnd(device, tmp_ctx->id);
+		spin = __igt_spin_new(device,
+				      .ahnd = ahndN,
+				      .ctx = tmp_ctx,
 				      .engine = other->flags,
 				      .flags = IGT_SPIN_FENCE_OUT);
 		intel_ctx_destroy(device, tmp_ctx);
@@ -254,6 +261,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 
 	/* And on the target engine, we hang */
 	spin = igt_spin_new(device,
+			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = (IGT_SPIN_FENCE_OUT |
@@ -267,13 +275,16 @@ test_engine_hang(const intel_ctx_t *ctx,
 
 	/* But no other engines/clients should be affected */
 	igt_list_for_each_entry_safe(spin, next, &list, link) {
+		ahndN = spin->ahnd;
 		igt_assert(sync_fence_wait(spin->out_fence, 0) == -ETIME);
 		igt_spin_end(spin);
 
 		igt_assert(sync_fence_wait(spin->out_fence, 500) == 0);
 		igt_assert_eq(sync_fence_status(spin->out_fence), 1);
 		igt_spin_free(device, spin);
+		put_ahnd(ahndN);
 	}
+	put_ahnd(ahnd);
 }
 
 /* This test covers the case where we end up in an uninitialised area of the
-- 
2.26.0
