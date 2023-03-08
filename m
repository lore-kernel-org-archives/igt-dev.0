Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC0010E671
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 11:21:13 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Mar 2023 12:21:00 +0100
Message-Id: <4e1ba617a96efd641a29db83a4552b5ce5324acc.1678273325.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678273325.git.karolina.stolarek@intel.com>
References: <cover.1678273325.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/7] lib/intel_batchbuffer: Add wrapper
 API to use XY_FAST_COPY_BLT/XY_SRC_BLT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vikas Srivastava <vikas.srivastava@intel.com>

Add wrapper API in intel_batchbuffer to call respective copy functions
for XY_FAST_COPY_BLT or XY_SRC_BLT based on platform on which its
supported.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 lib/intel_batchbuffer.c | 72 +++++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h | 22 +++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 4ea1256e..960231e3 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -277,6 +277,78 @@ static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
 	return dword1;
 }
 
+/**
+ * igt_blitter_copy:
+ * @fd: file descriptor of the i915 driver
+ * @ahnd: handle to an allocator
+ * @ctx: context within which execute copy blit
+ * @src_handle: GEM handle of the source buffer
+ * @src_delta: offset into the source GEM bo, in bytes
+ * @src_stride: Stride (in bytes) of the source buffer
+ * @src_tiling: Tiling mode of the source buffer
+ * @src_x: X coordinate of the source region to copy
+ * @src_y: Y coordinate of the source region to copy
+ * @src_size: size of the src bo required for allocator and softpin
+ * @width: Width of the region to copy
+ * @height: Height of the region to copy
+ * @bpp: source and destination bits per pixel
+ * @dst_handle: GEM handle of the destination buffer
+ * @dst_delta: offset into the destination GEM bo, in bytes
+ * @dst_stride: Stride (in bytes) of the destination buffer
+ * @dst_tiling: Tiling mode of the destination buffer
+ * @dst_x: X coordinate of destination
+ * @dst_y: Y coordinate of destination
+ * @dst_size: size of the dst bo required for allocator and softpin
+ *
+ * Wrapper API to call appropriate blitter copy function.
+ */
+
+void igt_blitter_copy(int fd,
+		      uint64_t ahnd,
+		      uint32_t ctx,
+		      const intel_ctx_cfg_t *cfg,
+		      /* src */
+		      uint32_t src_handle,
+		      uint32_t src_delta,
+		      uint32_t src_stride,
+		      uint32_t src_tiling,
+		      uint32_t src_x, uint32_t src_y,
+		      uint64_t src_size,
+		      /* size */
+		      uint32_t width, uint32_t height,
+		      /* bpp */
+		      uint32_t bpp,
+		      /* dst */
+		      uint32_t dst_handle,
+		      uint32_t dst_delta,
+		      uint32_t dst_stride,
+		      uint32_t dst_tiling,
+		      uint32_t dst_x, uint32_t dst_y,
+		      uint64_t dst_size)
+{
+	uint32_t devid;
+
+	devid = intel_get_drm_devid(fd);
+
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60))
+		igt_blitter_fast_copy__raw(fd, ahnd, ctx, NULL,
+					   src_handle, src_delta,
+					   src_stride, src_tiling,
+					   src_x, src_y, src_size,
+					   width, height, bpp,
+					   dst_handle, dst_delta,
+					   dst_stride, dst_tiling,
+					   dst_x, dst_y, dst_size);
+	else
+		igt_blitter_src_copy(fd, ahnd, ctx, NULL,
+				     src_handle, src_delta,
+				     src_stride, src_tiling,
+				     src_x, src_y, src_size,
+				     width, height, bpp,
+				     dst_handle, dst_delta,
+				     dst_stride, dst_tiling,
+				     dst_x, dst_y, dst_size);
+}
 /**
  * igt_blitter_src_copy:
  * @fd: file descriptor of the i915 driver
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 81830d77..aed1d575 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -36,6 +36,28 @@ uint32_t fast_copy_dword0(unsigned int src_tiling,
 uint32_t fast_copy_dword1(unsigned int src_tiling,
 			  unsigned int dst_tiling,
 			  int bpp);
+void igt_blitter_copy(int fd,
+		      uint64_t ahnd,
+		      uint32_t ctx,
+		      const intel_ctx_cfg_t *cfg,
+		      /* src */
+		      uint32_t src_handle,
+		      uint32_t src_delta,
+		      uint32_t src_stride,
+		      uint32_t src_tiling,
+		      uint32_t src_x, uint32_t src_y,
+		      uint64_t src_size,
+		      /* size */
+		      uint32_t width, uint32_t height,
+		      /* bpp */
+		      uint32_t bpp,
+		      /* dst */
+		      uint32_t dst_handle,
+		      uint32_t dst_delta,
+		      uint32_t dst_stride,
+		      uint32_t dst_tiling,
+		      uint32_t dst_x, uint32_t dst_y,
+		      uint64_t dst_size);
 
 void igt_blitter_src_copy(int fd,
 			  uint64_t ahnd,
-- 
2.25.1
