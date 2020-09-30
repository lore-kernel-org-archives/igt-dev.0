Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4766E5B9
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 09:22:43 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Wed, 30 Sep 2020 11:21:43 +0200
Message-Id: <20200930092155.26661-7-dominik.grzegorzek@intel.com>
In-Reply-To: <20200930092155.26661-1-dominik.grzegorzek@intel.com>
References: <20200930092155.26661-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 06/18]
 i915/gem_pipe_control_store_loop.c: Remove libdrm dependency
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Use intel_bb / intel_buf to remove libdrm dependency.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_pipe_control_store_loop.c | 143 +++++++++++------------
 1 file changed, 69 insertions(+), 74 deletions(-)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 863a4871..d91c330a 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -43,13 +43,11 @@
 #include "drm.h"
 #include "i915/gem.h"
 #include "igt.h"
-#include "intel_bufmgr.h"
 
 IGT_TEST_DESCRIPTION("Test (TLB-)Coherency of pipe_control QW writes.");
 
-static drm_intel_bufmgr *bufmgr;
-struct intel_batchbuffer *batch;
-uint32_t devid;
+static struct buf_ops *bops;
+static struct intel_bb *ibb;
 
 #define GFX_OP_PIPE_CONTROL	((0x3<<29)|(0x3<<27)|(0x2<<24)|2)
 #define   PIPE_CONTROL_WRITE_IMMEDIATE	(1<<14)
@@ -68,96 +66,102 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
 {
 	int val = 0;
 	uint32_t *buf;
-	drm_intel_bo *target_bo;
+	struct intel_buf *target_buf;
 
 	igt_until_timeout(timeout) {
 		/* we want to check tlb consistency of the pipe_control target,
 		 * so get a new buffer every time around */
-		target_bo = drm_intel_bo_alloc(bufmgr, "target bo", 4096, 4096);
-		igt_assert(target_bo);
+		target_buf = intel_buf_create(bops, 4096, 1, 8, 0,
+					      I915_TILING_NONE,
+					      I915_COMPRESSION_NONE);
+		intel_bb_add_intel_buf(ibb, target_buf, true);
 
 		if (preuse_buffer) {
-			COLOR_BLIT_COPY_BATCH_START(0);
-			OUT_BATCH((3 << 24) | (0xf0 << 16) | 64);
-			OUT_BATCH(0);
-			OUT_BATCH(1 << 16 | 1);
+			intel_bb_out(ibb, XY_COLOR_BLT_CMD_NOLEN |
+				     COLOR_BLT_WRITE_ALPHA |
+				     XY_COLOR_BLT_WRITE_RGB |
+				     (4 + (ibb->gen >= 8)));
+
+			intel_bb_out(ibb, (3 << 24) | (0xf0 << 16) | 64);
+			intel_bb_out(ibb, 0);
+			intel_bb_out(ibb, 1 << 16 | 1);
 
 			/*
 			 * IMPORTANT: We need to preuse the buffer in a
 			 * different domain than what the pipe control write
 			 * (and kernel wa) uses!
 			 */
-			OUT_RELOC_FENCED(target_bo,
-			     I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
-			     0);
-			OUT_BATCH(0xdeadbeef);
-			ADVANCE_BATCH();
+			intel_bb_emit_reloc_fenced(ibb, target_buf->handle,
+						   I915_GEM_DOMAIN_RENDER,
+						   I915_GEM_DOMAIN_RENDER,
+						   0, target_buf->addr.offset);
+			intel_bb_out(ibb, 0xdeadbeef);
 
-			intel_batchbuffer_flush(batch);
+			intel_bb_flush_blit(ibb);
 		}
 
 		/* gem_storedw_batches_loop.c is a bit overenthusiastic with
 		 * creating new batchbuffers - with buffer reuse disabled, the
 		 * support code will do that for us. */
-		if (batch->gen >= 8) {
-			BEGIN_BATCH(4, 1);
-			OUT_BATCH(GFX_OP_PIPE_CONTROL + 1);
-			OUT_BATCH(PIPE_CONTROL_WRITE_IMMEDIATE);
-			OUT_RELOC_FENCED(target_bo,
-			     I915_GEM_DOMAIN_INSTRUCTION, I915_GEM_DOMAIN_INSTRUCTION,
-			     PIPE_CONTROL_GLOBAL_GTT);
-			OUT_BATCH(val); /* write data */
-			ADVANCE_BATCH();
-
-		} else if (batch->gen >= 6) {
+		if (ibb->gen >= 8) {
+			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL + 1);
+			intel_bb_out(ibb, PIPE_CONTROL_WRITE_IMMEDIATE);
+			intel_bb_emit_reloc_fenced(ibb, target_buf->handle,
+						   I915_GEM_DOMAIN_INSTRUCTION,
+						   I915_GEM_DOMAIN_INSTRUCTION,
+						   PIPE_CONTROL_GLOBAL_GTT,
+						   target_buf->addr.offset);
+			intel_bb_out(ibb, val); /* write data */
+		} else if (ibb->gen >= 6) {
 			/* work-around hw issue, see intel_emit_post_sync_nonzero_flush
 			 * in mesa sources. */
-			BEGIN_BATCH(4, 1);
-			OUT_BATCH(GFX_OP_PIPE_CONTROL);
-			OUT_BATCH(PIPE_CONTROL_CS_STALL |
-			     PIPE_CONTROL_STALL_AT_SCOREBOARD);
-			OUT_BATCH(0); /* address */
-			OUT_BATCH(0); /* write data */
-			ADVANCE_BATCH();
-
-			BEGIN_BATCH(4, 1);
-			OUT_BATCH(GFX_OP_PIPE_CONTROL);
-			OUT_BATCH(PIPE_CONTROL_WRITE_IMMEDIATE);
-			OUT_RELOC(target_bo,
-			     I915_GEM_DOMAIN_INSTRUCTION, I915_GEM_DOMAIN_INSTRUCTION, 
-			     PIPE_CONTROL_GLOBAL_GTT);
-			OUT_BATCH(val); /* write data */
-			ADVANCE_BATCH();
-		} else if (batch->gen >= 4) {
-			BEGIN_BATCH(4, 1);
-			OUT_BATCH(GFX_OP_PIPE_CONTROL | PIPE_CONTROL_WC_FLUSH |
-					PIPE_CONTROL_TC_FLUSH |
-					PIPE_CONTROL_WRITE_IMMEDIATE | 2);
-			OUT_RELOC(target_bo,
-				I915_GEM_DOMAIN_INSTRUCTION, I915_GEM_DOMAIN_INSTRUCTION,
-				PIPE_CONTROL_GLOBAL_GTT);
-			OUT_BATCH(val);
-			OUT_BATCH(0xdeadbeef);
-			ADVANCE_BATCH();
+			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
+			intel_bb_out(ibb, PIPE_CONTROL_CS_STALL |
+				     PIPE_CONTROL_STALL_AT_SCOREBOARD);
+			intel_bb_out(ibb, 0); /* address */
+			intel_bb_out(ibb, 0); /* write data */
+			intel_bb_flush(ibb, ibb->ctx, 0);
+
+			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
+			intel_bb_out(ibb, PIPE_CONTROL_WRITE_IMMEDIATE);
+			intel_bb_emit_reloc(ibb, target_buf->handle,
+					    I915_GEM_DOMAIN_INSTRUCTION,
+					    I915_GEM_DOMAIN_INSTRUCTION,
+					    PIPE_CONTROL_GLOBAL_GTT,
+					    target_buf->addr.offset);
+			intel_bb_out(ibb, val); /* write data */
+		} else if (ibb->gen >= 4) {
+			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL |
+				     PIPE_CONTROL_WC_FLUSH |
+				     PIPE_CONTROL_TC_FLUSH |
+				     PIPE_CONTROL_WRITE_IMMEDIATE | 2);
+			intel_bb_emit_reloc(ibb, target_buf->handle,
+					    I915_GEM_DOMAIN_INSTRUCTION,
+					    I915_GEM_DOMAIN_INSTRUCTION,
+					    PIPE_CONTROL_GLOBAL_GTT,
+					    target_buf->addr.offset);
+			intel_bb_out(ibb, val);
+			intel_bb_out(ibb, 0xdeadbeef);
 		}
 
-		intel_batchbuffer_flush_on_ring(batch, 0);
+		intel_bb_flush(ibb, ibb->ctx, 0);
 
-		drm_intel_bo_map(target_bo, 1);
+		intel_buf_cpu_map(target_buf, 1);
 
-		buf = target_bo->virtual;
+		buf = target_buf->ptr;
 		igt_assert(buf[0] == val);
 
-		drm_intel_bo_unmap(target_bo);
+		intel_buf_unmap(target_buf);
 		/* Make doublesure that this buffer won't get reused. */
-		drm_intel_bo_disable_reuse(target_bo);
-		drm_intel_bo_unreference(target_bo);
+		intel_bb_reset(ibb, true);
 
+		intel_buf_destroy(target_buf);
 		val++;
 	}
 }
 
 int fd;
+uint32_t devid;
 
 igt_main
 {
@@ -167,20 +171,12 @@ igt_main
 		gem_require_blitter(fd);
 
 		devid = intel_get_drm_devid(fd);
-
-		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-		igt_assert(bufmgr);
+		bops = buf_ops_create(fd);
 
 		igt_skip_on(IS_GEN2(devid) || IS_GEN3(devid));
 		igt_skip_on(devid == PCI_CHIP_I965_G); /* has totally broken pipe control */
 
-		/* IMPORTANT: No call to
-		 * drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-		 * here because we wan't to have fresh buffers (to trash the tlb)
-		 * every time! */
-
-		batch = intel_batchbuffer_alloc(bufmgr, devid);
-		igt_assert(batch);
+		ibb = intel_bb_create(fd, 4096);
 	}
 
 	igt_subtest("fresh-buffer")
@@ -190,9 +186,8 @@ igt_main
 		store_pipe_control_loop(true, 2);
 
 	igt_fixture {
-		intel_batchbuffer_free(batch);
-		drm_intel_bufmgr_destroy(bufmgr);
-
+		intel_bb_destroy(ibb);
+		buf_ops_destroy(bops);
 		close(fd);
 	}
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
