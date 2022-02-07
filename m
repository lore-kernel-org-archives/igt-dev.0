Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAE810E2AD
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 18:34:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  7 Feb 2022 19:34:37 +0100
Message-Id: <20220207183437.205388-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/api_intel_bb: Handle different
 alignments in delta-check
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
List-ID: <igt-dev@lists.freedesktop.org>

As newer gens can diverge with safe alignments adopt delta-check
to handle this.

Idea of the test is to verify intel-bb delta calculation for objects,
especially we're crossing 32bit address boundary. For example:

1. where safe alignment == 0x1000 (page size) object size will be
   0x3000 and it will be pinned at 0xffff_f0000. MI_STORE_DWORD_IMM
   will be at 0x1_0000_1000

2. where safe alignment == 0x200000 (discrete) object size will be
   0x200200 and it will be pinned at 0xffe0_0000. MI_STORE_DWORD_IMM
   will also be at 0x1_0000_1000

Change should also apply to other alignments (if any).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/api_intel_bb.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index e37472fb4..92f44cecf 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1127,6 +1127,9 @@ static void delta_check(struct buf_ops *bops)
 	struct intel_buf *buf;
 	struct intel_bb *ibb;
 	uint64_t offset;
+	uint64_t obj_size = gem_detect_safe_alignment(i915) + 0x2000;
+	uint64_t obj_offset = (1ULL << 32) - gem_detect_safe_alignment(i915);
+	uint64_t delta = gem_detect_safe_alignment(i915) + 0x1000;
 	bool supports_48bit;
 
 	ibb = intel_bb_create_with_allocator(i915, 0, PAGE_SIZE,
@@ -1139,8 +1142,8 @@ static void delta_check(struct buf_ops *bops)
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
 
-	buf = create_buf(bops, 0x1000, 0x10, COLOR_CC);
-	buf->addr.offset = 0xfffff000;
+	buf = create_buf(bops, obj_size, 0x1, COLOR_CC);
+	buf->addr.offset = obj_offset;
 	intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
 			    buf->addr.offset, 0, false);
 
@@ -1148,7 +1151,7 @@ static void delta_check(struct buf_ops *bops)
 	intel_bb_emit_reloc(ibb, buf->handle,
 			    I915_GEM_DOMAIN_RENDER,
 			    I915_GEM_DOMAIN_RENDER,
-			    0x2000, buf->addr.offset);
+			    delta, buf->addr.offset);
 	intel_bb_out(ibb, expected);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
@@ -1157,9 +1160,9 @@ static void delta_check(struct buf_ops *bops)
 	intel_bb_exec(ibb, intel_bb_offset(ibb), I915_EXEC_DEFAULT, false);
 	intel_bb_sync(ibb);
 
-	/* Buffer should be @ 0xc000_0000 */
+	/* Buffer should be @ obj_offset */
 	offset = intel_bb_get_object_offset(ibb, buf->handle);
-	igt_assert_eq_u64(offset, 0xfffff000);
+	igt_assert_eq_u64(offset, obj_offset);
 
 	ptr = gem_mmap__device_coherent(i915, ibb->handle, 0, ibb->size, PROT_READ);
 	lo = ptr[1];
@@ -1168,7 +1171,7 @@ static void delta_check(struct buf_ops *bops)
 
 	ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
 					intel_buf_size(buf), PROT_READ);
-	val = ptr[0x2000 / sizeof(uint32_t)];
+	val = ptr[delta / sizeof(uint32_t)];
 	gem_munmap(ptr, intel_buf_size(buf));
 
 	intel_buf_destroy(buf);
-- 
2.32.0
