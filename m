Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD60C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E28711328F;
	Wed,  6 Mar 2024 15:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDlxtazM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2F211327D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737567; x=1741273567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFMPI450dhXa8oIMqk0gXtPsYOn3YRMUuQWa3Ljrjzw=;
 b=oDlxtazMP1d60Vl2H2NnNasORyADTTvXVRWfLx3pxL86meTmHhlbLcnn
 Xet6Pz6FBek9JeY04KA2X9u7OV3Ud5LlWrVQLmMs01GT9hli/pb9ZsBBl
 CFNPYeYlP+RhhXnE0lvfw4POcZQRyvHoKdZvn9RqTZKqQvC7tij8aEkIp
 c6pEUqSNqOAg+24lal7ir0eUyOzreJmecVFjS4UcoI26dOaLFoOQ/tBNa
 iCgiEV3gTuXGtBgCpQHWmXgktdZq59w4FocQFnxJh1gdw5UCczHZAnRBD
 7HsP3EL1P1CfD+xN9eQXqDkrUjg4CmbJ6qNzQTCjFgBnNMAPOvZB5amBI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4240934"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4240934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="47296650"
Received: from dawidzix-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:05 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 4/6] lib/intel_buf: expose mocs_index
Date: Wed,  6 Mar 2024 15:04:50 +0000
Message-ID: <20240306150453.254144-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306150453.254144-1-matthew.auld@intel.com>
References: <20240306150453.254144-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Allow the caller the set the intel_buf.mocs_index as part of the usual
_full variants.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_draw.c            |  7 ++++---
 lib/igt_fb.c              |  3 ++-
 lib/intel_bufops.c        | 30 ++++++++++++++++++++----------
 lib/intel_bufops.h        |  6 ++++--
 lib/intel_mocs.h          |  2 ++
 tests/intel/kms_big_fb.c  |  4 +++-
 tests/intel/kms_dirtyfb.c |  7 +++++--
 tests/intel/kms_psr.c     |  4 +++-
 tests/intel/xe_intel_bb.c |  4 +++-
 tests/intel/xe_pat.c      |  8 ++++----
 10 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 1b702e376..2c01d7b02 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -663,7 +663,8 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 				    tiling, 0,
 				    size, 0,
 				    region,
-				    from->pat_index);
+				    from->pat_index,
+				    DEFAULT_MOCS_INDEX);
 
 	/* Make sure we close handle on destroy path */
 	intel_buf_set_ownership(buf, true);
@@ -723,9 +724,9 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 		pitch = tiling ? buf->stride / 4 : buf->stride;
 
 		if (ver >= 20)
-			mocs = intel_get_uc_mocs_index(fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
+			mocs = dst->mocs_index << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
 		else
-			mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
+			mocs = dst->mocs_index << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
 
 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
 		intel_bb_out(ibb, blt_cmd_tiling | mocs | (pitch-1));
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0ac2a76b0..cc70cb91c 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2642,7 +2642,8 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 				    compression, fb->size,
 				    fb->strides[0],
 				    region,
-				    intel_get_pat_idx_uc(fd));
+				    intel_get_pat_idx_uc(fd),
+				    DEFAULT_MOCS_INDEX);
 	intel_buf_set_name(buf, name);
 
 	/* Make sure we close handle on destroy path */
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index c34d778a1..1dc25d61f 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -857,7 +857,8 @@ static void __intel_buf_init(struct buf_ops *bops,
 			     int width, int height, int bpp, int alignment,
 			     uint32_t req_tiling, uint32_t compression,
 			     uint64_t bo_size, int bo_stride,
-			     uint64_t region, uint8_t pat_index)
+			     uint64_t region, uint8_t pat_index,
+			     uint8_t mocs_index)
 {
 	uint32_t tiling = req_tiling;
 	uint64_t size;
@@ -879,7 +880,9 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->compression = compression;
 	buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
 	buf->pat_index = pat_index;
-	buf->mocs_index = intel_get_uc_mocs_index(bops->fd);
+	if (mocs_index == DEFAULT_MOCS_INDEX)
+		mocs_index = intel_get_uc_mocs_index(bops->fd);
+	buf->mocs_index = mocs_index;
 	IGT_INIT_LIST_HEAD(&buf->link);
 
 	tile_width = __get_min_stride(width, bpp, tiling);
@@ -973,7 +976,8 @@ void intel_buf_init(struct buf_ops *bops,
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
 						     system_memory(bops->fd);
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX);
+			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX,
+			 DEFAULT_MOCS_INDEX);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -990,7 +994,8 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      uint64_t region)
 {
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX);
+			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX,
+			 DEFAULT_MOCS_INDEX);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -1053,7 +1058,8 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(handle);
 	igt_assert(size);
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, 0, -1, DEFAULT_PAT_INDEX);
+			 req_tiling, compression, size, 0, -1, DEFAULT_PAT_INDEX,
+			 DEFAULT_MOCS_INDEX);
 }
 
 /**
@@ -1071,6 +1077,8 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
  * @stride: bo stride
  * @region: region
  * @pat_index: pat_index to use for the binding (only used on xe)
+ * @pat_index: mocs_index to use for operations using this intel_buf, like render
+ * copy.
  *
  * Function configures BO handle within intel_buf structure passed by the caller
  * (with all its metadata - width, height, ...). Useful if BO was created
@@ -1089,11 +1097,12 @@ void intel_buf_init_full(struct buf_ops *bops,
 			 uint64_t size,
 			 int stride,
 			 uint64_t region,
-			 uint8_t pat_index)
+			 uint8_t pat_index,
+			 uint8_t mocs_index)
 {
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
 			 req_tiling, compression, size, stride, region,
-			 pat_index);
+			 pat_index, mocs_index);
 }
 
 /**
@@ -1155,7 +1164,7 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(size);
 	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
 				     req_tiling, compression, size, 0, -1,
-				     DEFAULT_PAT_INDEX);
+				     DEFAULT_PAT_INDEX, DEFAULT_MOCS_INDEX);
 }
 
 struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
@@ -1167,7 +1176,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint64_t size,
 					int stride,
 					uint64_t region,
-					uint8_t pat_index)
+					uint8_t pat_index,
+					uint8_t mocs_index)
 {
 	struct intel_buf *buf;
 
@@ -1178,7 +1188,7 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
 			 req_tiling, compression, size, stride, region,
-			 pat_index);
+			 pat_index, mocs_index);
 
 	return buf;
 }
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 60f7785fe..af2009b3d 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -158,7 +158,8 @@ void intel_buf_init_full(struct buf_ops *bops,
 			 uint64_t size,
 			 int stride,
 			 uint64_t region,
-			 uint8_t pat_index);
+			 uint8_t pat_index,
+			 uint8_t mocs_index);
 
 struct intel_buf *intel_buf_create(struct buf_ops *bops,
 				   int width, int height,
@@ -191,7 +192,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint64_t size,
 					int stride,
 					uint64_t region,
-					uint8_t pat_index);
+					uint8_t pat_index,
+					uint8_t mocs_index);
 void intel_buf_destroy(struct intel_buf *buf);
 
 static inline void intel_buf_set_pxp(struct intel_buf *buf, bool new_pxp_state)
diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index a9e075273..b5c79b0e1 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -8,6 +8,8 @@
 
 #include <stdint.h>
 
+#define DEFAULT_MOCS_INDEX ((uint8_t)-1)
+
 uint8_t intel_get_wb_mocs_index(int fd);
 uint8_t intel_get_uc_mocs_index(int fd);
 
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 0bd79394b..f7f303d41 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -37,6 +37,7 @@
 #include <string.h>
 
 #include "i915/gem_create.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -206,7 +207,8 @@ static struct intel_buf *init_buf(data_t *data,
 	buf = intel_buf_create_full(data->bops, handle, width, height,
 				    bpp, 0, tiling, 0, size, 0,
 				    region,
-				    intel_get_pat_idx_uc(data->drm_fd));
+				    intel_get_pat_idx_uc(data->drm_fd),
+				    DEFAULT_MOCS_INDEX);
 
 	intel_buf_set_name(buf, buf_name);
 	intel_buf_set_ownership(buf, true);
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 9aa066004..9e4832929 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -20,6 +20,7 @@
 
 #include "i915/intel_drrs.h"
 #include "i915/intel_fbc.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 
 #include "xe/xe_query.h"
@@ -256,7 +257,8 @@ static void run_test(data_t *data)
 				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
 				    0, data->fbs[1].size, 0, is_xe_device(data->drm_fd) ?
 				    system_memory(data->drm_fd) : 0,
-				    intel_get_pat_idx_uc(data->drm_fd));
+				    intel_get_pat_idx_uc(data->drm_fd),
+				    DEFAULT_MOCS_INDEX);
 	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
 				    data->fbs[2].width,
 				    data->fbs[2].height,
@@ -264,7 +266,8 @@ static void run_test(data_t *data)
 				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
 				    0, data->fbs[2].size, 0, is_xe_device(data->drm_fd) ?
 				    system_memory(data->drm_fd) : 0,
-				    intel_get_pat_idx_uc(data->drm_fd));
+				    intel_get_pat_idx_uc(data->drm_fd),
+				    DEFAULT_MOCS_INDEX);
 	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
 
 	spin = igt_spin_new(data->drm_fd, .ahnd = ibb->allocator_handle);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 3822b3081..c90612426 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -35,6 +35,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 #include <errno.h>
 #include <stdbool.h>
@@ -421,7 +422,8 @@ static struct intel_buf *create_buf_from_fb(data_t *data,
 	handle = gem_open(data->drm_fd, name);
 	buf = intel_buf_create_full(data->bops, handle, width, height,
 				    bpp, 0, tiling, 0, size, stride, region,
-				    intel_get_pat_idx_uc(data->drm_fd));
+				    intel_get_pat_idx_uc(data->drm_fd),
+				    DEFAULT_MOCS_INDEX);
 	intel_buf_set_ownership(buf, true);
 
 	return buf;
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index c3a4b5450..09164c41f 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -19,6 +19,7 @@
 #include "igt.h"
 #include "igt_crc.h"
 #include "intel_bufops.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -393,7 +394,8 @@ static void create_in_region(struct buf_ops *bops, uint64_t region)
 	intel_buf_init_full(bops, handle, &buf,
 			    width/4, height, 32, 0,
 			    I915_TILING_NONE, 0,
-			    size, 0, region, DEFAULT_PAT_INDEX);
+			    size, 0, region, DEFAULT_PAT_INDEX,
+			    DEFAULT_MOCS_INDEX);
 	intel_buf_set_ownership(&buf, true);
 
 	intel_bb_add_intel_buf(ibb, &buf, false);
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 3d7d7400c..6918ebe7e 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -388,11 +388,11 @@ static void pat_index_render(struct xe_pat_param *p)
 
 	intel_buf_init_full(bops, p->r1_bo, &src, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r1, p->r1_pat_index);
+			    stride, p->r1, p->r1_pat_index, DEFAULT_MOCS_INDEX);
 
 	intel_buf_init_full(bops, p->r2_bo, &dst, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r2, p->r2_pat_index);
+			    stride, p->r2, p->r2_pat_index, DEFAULT_MOCS_INDEX);
 
 	/* Ensure we always see zeroes for the initial KMD zeroing */
 	render_copy(ibb,
@@ -483,12 +483,12 @@ static void pat_index_dw(struct xe_pat_param *p)
 
 	intel_buf_init_full(bops, p->r1_bo, &r1_buf, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r1, p->r1_pat_index);
+			    stride, p->r1, p->r1_pat_index, DEFAULT_MOCS_INDEX);
 	intel_bb_add_intel_buf(ibb, &r1_buf, true);
 
 	intel_buf_init_full(bops, p->r2_bo, &r2_buf, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r2, p->r2_pat_index);
+			    stride, p->r2, p->r2_pat_index, DEFAULT_MOCS_INDEX);
 	intel_bb_add_intel_buf(ibb, &r2_buf, true);
 
 	/*
-- 
2.43.2

