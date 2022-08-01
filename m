Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489D10EFA5
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 09:58:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 11:58:06 +0200
Message-Id: <20220801095806.23914-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_pipe_control_store_loop: Use a
 simple spinner to preuse the buffer
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

From: Chris Wilson <chris.p.wilson@intel.com>

Replace the blit commands that need to be adjusted for different archs,
and use the library routines to make a buffer busy for a controlled
length of time. This has the added advantage of ensuring that the buffer
is busy during the w/a processing inside the execbuf ioctl.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Tested-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_pipe_control_store_loop.c | 39 +++++++++---------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 20fdc9c155..df3da9f5b2 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -71,36 +71,25 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
 	ibb = intel_bb_create(buf_ops_get_fd(bops), 4096);
 
 	igt_until_timeout(timeout) {
+		igt_spin_t *spin = NULL;
+
 		/* we want to check tlb consistency of the pipe_control target,
 		 * so get a new buffer every time around */
 		target_buf = intel_buf_create(bops, 4096, 1, 8, 0,
 					      I915_TILING_NONE,
 					      I915_COMPRESSION_NONE);
 
-		if (preuse_buffer) {
-			intel_bb_add_intel_buf(ibb, target_buf, true);
-			intel_bb_out(ibb, XY_COLOR_BLT_CMD_NOLEN |
-				     COLOR_BLT_WRITE_ALPHA |
-				     XY_COLOR_BLT_WRITE_RGB |
-				     (4 + (ibb->gen >= 8)));
-
-			intel_bb_out(ibb, (3 << 24) | (0xf0 << 16) | 64);
-			intel_bb_out(ibb, 0);
-			intel_bb_out(ibb, 1 << 16 | 1);
-
-			/*
-			 * IMPORTANT: We need to preuse the buffer in a
-			 * different domain than what the pipe control write
-			 * (and kernel wa) uses!
-			 */
-			intel_bb_emit_reloc_fenced(ibb, target_buf->handle,
-						   I915_GEM_DOMAIN_RENDER,
-						   I915_GEM_DOMAIN_RENDER,
-						   0, target_buf->addr.offset);
-			intel_bb_out(ibb, 0xdeadbeef);
-
-			intel_bb_flush_blit(ibb);
-		}
+		/*
+		 * IMPORTANT: We need to preuse the buffer in a
+		 * different domain than what the pipe control write
+		 * (and kernel wa) uses!
+		 *
+		 * The dependency sets (RENDER, RENDER).
+		 */
+		if (preuse_buffer)
+			spin = igt_spin_new(buf_ops_get_fd(bops),
+					    .ahnd = ibb->allocator_handle,
+					    .dependency = target_buf->handle);
 
 		/* gem_storedw_batches_loop.c is a bit overenthusiastic with
 		 * creating new batchbuffers - with buffer reuse disabled, the
@@ -149,6 +138,8 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
 		}
 
 		intel_bb_flush(ibb, 0);
+		if (spin)
+			igt_spin_free(buf_ops_get_fd(bops), spin);
 
 		intel_buf_cpu_map(target_buf, 1);
 
-- 
2.34.1
