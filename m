Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF110EA5C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 07:25:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 08:25:49 +0100
Message-Id: <20230120072549.11277-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ccs: Change allocator type and
 enforce softpinning
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

For all subtests which uses simple allocator change them to reloc.
There's nothing wrong with simple, but when it is freeing offset
it might be used again in next allocation. From the execution point
of view it leads to stalls. We don't want that here, especially in
ctrl-surf-copy* subtests, where we join restoring ccs data for the
surface and block-copy immediate after that.

Ensure we use softpinning for all subtests for the case where kernel
still supports relocations and get_*_ahnd() helpers would return
invalid allocator handle.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_ccs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index ff28c6d889..e9d66ca95b 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -437,9 +437,7 @@ static void block_copy(int i915,
 	struct blt_copy_object *src, *mid, *dst;
 	const uint32_t bpp = 32;
 	uint64_t bb_size = 4096;
-	uint64_t ahnd = intel_allocator_open_full(i915, ctx->id, 0, 0,
-						  INTEL_ALLOCATOR_SIMPLE,
-						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	uint64_t ahnd = intel_allocator_open(i915, ctx->id, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = region2, bb;
 	uint32_t width = param.width, height = param.height;
@@ -500,9 +498,8 @@ static void block_copy(int i915,
 			cfg.engines[0].engine_instance = e->instance;
 			surf_ctx = intel_ctx_create(i915, &cfg);
 			surf_e.flags = 0;
-			surf_ahnd = intel_allocator_open_full(i915, surf_ctx->id, 0, 0,
-							      INTEL_ALLOCATOR_SIMPLE,
-							      ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+			surf_ahnd = intel_allocator_open(i915, ctx->id,
+							 INTEL_ALLOCATOR_RELOC);
 		}
 
 		surf_copy(i915, surf_ctx, &surf_e, surf_ahnd, src, mid, dst, run_id,
@@ -555,7 +552,7 @@ static void block_multicopy(int i915,
 	struct blt_copy_object *src, *mid, *dst, *final;
 	const uint32_t bpp = 32;
 	uint64_t bb_size = 4096;
-	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
+	uint64_t ahnd = intel_allocator_open(i915, ctx->id, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = region2, bb;
 	uint32_t width = param.width, height = param.height;
-- 
2.34.1
