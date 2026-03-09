Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82482EA855D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 05:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3048010E48B;
	Mon,  9 Mar 2026 05:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFaR4dtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F3A10E48B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773034961; x=1804570961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ch2EJNqLnNLrQZdDKqSntyiziO77/TyXkmjVnZSUPLI=;
 b=UFaR4dtpz+CrS0tdLGmNJiHyx/TJCwzRDQfOF3zeyYC7lhUY6UlXa/My
 rYLVNgJGo9l4icbdQYrqCRekUgslmCGxKrAIEMxmCz2CAyOQ/yv4X6K/j
 E+padorMWvUtHOjJuXjSg7stORuPYXhFBBOZAkRH6Xw2rw7WFo+hrjOl4
 FK7Lr+eHMdaBYypYgtfugN0bZan+goPTesDg6KLbbFbchEU+79//AuqcP
 qTsW4NfCfZ+/lHbMqkIKk6E43BtVackPDF1mFy2ZJqPFSokRUbUZiecQ1
 lLhmbIxMIW1mHprL9jZJYVIlWFc/Gx/o+uDbhqoYGOKkc0CwuCgSpC6YU Q==;
X-CSE-ConnectionGUID: IqdE7eqITqeSF0jfjTEo4Q==
X-CSE-MsgGUID: zX4YNEadS6GY1JPS6uYuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74163070"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74163070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:42:41 -0700
X-CSE-ConnectionGUID: zxY2XqKMTeOXC97IeFaGsg==
X-CSE-MsgGUID: oN+aKKDZT6a/BBh98JOaAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218851532"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:42:39 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Cc: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Subject: [PATCH 1/3] igt/xe: Add temporary helpers for VM_Bind neg test
Date: Mon,  9 Mar 2026 11:12:58 +0530
Message-ID: <20260309054300.642203-2-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309054300.642203-1-smitha.balasubramanyam@intel.com>
References: <20260309054300.642203-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=quoted-printable
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

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>

Added helper functions and UAPI macro definition required for
VM_BIND Decomp negative tests.
These helpers and definitions duplicate functionality introduced in
VLK-79231, positive test series, which is yet to be merged.
They are included here so that the negative
tests can be developed and executed independently.

Once the positive test series lands upstream, this patch can be dropped
and the tests can reuse the shared helpers and UAPI definitions.
Also, includes a few formatting changes suggested by checkpatch.pl.
---
 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_ccs.c      | 331 +++++++++++++++++++++++++-------------
 2 files changed, 220 insertions(+), 112 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..44355f6b5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1160,6 +1160,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 #define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS		(1 << 7)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a21922ee5..4424f6f9b 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -11,6 +11,8 @@
 #endif
 #include <sys/ioctl.h>
 #include <sys/time.h>
+#include <sys/mman.h>
+#include <unistd.h>
 #include <malloc.h>
 #include "drm.h"
 #include "igt.h"
@@ -97,20 +99,125 @@ struct test_config {
 };
 
 #define PRINT_SURFACE_INFO(name, obj) do { \
-	if (param.print_surface_info) \
-		blt_surface_info((name), (obj)); } while (0)
+	if (param.print_surface_info) { \
+		blt_surface_info((name), (obj)); \
+	} \
+} while (0)
 
 #define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
 	if (param.write_png) \
-		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
+	blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
+
+static void print_buffer_data(const void *data, size_t size, const char *label, int max_lines)
+{
+	const u8 *bytes = (const uint8_t *)data;
+	size_t lines_to_print = min((size + 15) / 16, (size_t)max_lines);
+	size_t i, j;
+
+	igt_info("Buffer Data [%s] (showing first %zu lines, %zu bytes each):\n",
+		 label, lines_to_print, min(size, lines_to_print * 16));
+
+	for (i = 0; i < lines_to_print && i * 16 < size; i++) {
+		igt_info("%s [%04zx]: ", label, i * 16);
+
+		/* Print hex bytes */
+		for (j = 0; j < 16 && (i * 16 + j) < size; j++)
+			igt_info("%02x ", bytes[i * 16 + j]);
+
+		/* Pad if last line is incomplete */
+		for (; j < 16; j++)
+			igt_info("   ");
+
+		igt_info("\n");
+	}
+
+	if (size > lines_to_print * 16)
+		igt_info("%s [...] (%zu more bytes not shown)\n",
+			 label, size - lines_to_print * 16);
+}
+
+/**
+ * verify_test_pattern() - Verify buffer contains expected test pattern
+ * @buffer: pointer to buffer data
+ * @size: buffer size in bytes
+ * @label: label for debug output
+ * @return: true if pattern is correct, false otherwise
+ */
+static bool verify_test_pattern(const void *buffer, size_t size, const char *label)
+{
+	const u32 *buffer_u32 = (const u32 *)buffer;
+	size_t num_u32_elements = size / sizeof(uint32_t);
+	size_t errors = 0;
+	size_t max_errors_to_show = 10;
+
+	igt_info("Verifying test pattern in %s buffer (%zu elements)...\n",
+		 label, num_u32_elements);
+
+	for (size_t i = 0; i < num_u32_elements && errors < max_errors_to_show; i++) {
+		/* Calculate expected value based on sparse pattern with many zeros */
+		u32 expected;
+
+		switch (i & 0xf) {
+		case 0:
+			expected = 0xdeadbeef; break;
+		case 4:
+			expected = 0xefbed000; break;
+		case 8:
+			expected = 0x00cfe111; break;
+		case 12:
+			expected = 0x11e0f222; break;
+		default:
+			expected = 0x00000000; break;
+		}
+
+		if (buffer_u32[i] != expected) {
+			igt_info("Pattern mismatch at offset %zu: expected 0x%08X, found 0x%08X\n",
+				 i * sizeof(uint32_t), expected, buffer_u32[i]);
+			errors++;
+		}
+	}
+
+	if (errors == 0) {
+		igt_info("Pattern verification SUCCESS for %s buffer - all %zu elements correct\n",
+			 label, num_u32_elements);
+		return true;
+	}
+
+	igt_info("Pattern verification FAILED for %s buffer - %zu errors found%s\n",
+		 label, errors, errors >= max_errors_to_show ? " (truncated)" : "");
+	return false;
+}
+
+
+/* Simple helper to fill buffer with a more compressible pattern */
+static void fill_buffer_simple_pattern(void *ptr, size_t size)
+{
+	u32 *buffer = (uint32_t *)ptr;
+	size_t num_elements = size / sizeof(uint32_t);
+	size_t i;
+
+	/* Sparse pattern chosen to produce highly compressible data;
+	 * non‑zero sentinels every 16 dwords (0xDEADBEEF, ..)
+	 * ensure we aren’t relying on clear-zero CCS encoding.
+	 */
+	for (i = 0; i < num_elements; i += 16) {
+		buffer[i] = 0xdeadbeef;
+		if (i + 4 < num_elements)
+			buffer[i + 4] = 0xefbed000;
+		if (i + 8 < num_elements)
+			buffer[i + 8] = 0x00cfe111;
+		if (i + 12 < num_elements)
+			buffer[i + 12] = 0x11e0f222;
+	}
+}
 
 static void surf_copy(int xe,
-		      intel_ctx_t *ctx,
-		      uint64_t ahnd,
-		      const struct blt_copy_object *src,
-		      const struct blt_copy_object *mid,
-		      const struct blt_copy_object *dst,
-		      int run_id, bool suspend_resume)
+		intel_ctx_t *ctx,
+		uint64_t ahnd,
+		const struct blt_copy_object *src,
+		const struct blt_copy_object *mid,
+		const struct blt_copy_object *dst,
+		int run_id, bool suspend_resume)
 {
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {};
@@ -139,9 +246,9 @@ static void surf_copy(int xe,
 	blt_ctrl_surf_copy_init(xe, &surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
+			uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
-				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+			DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_bb_size(xe, SZ_4K);
 	bb1 = xe_bo_create(xe, 0, bb_size, sysmem, 0);
 	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
@@ -155,22 +262,22 @@ static void surf_copy(int xe,
 		char *orig, *orig2, *newsum, *newsum2;
 
 		orig = g_compute_checksum_for_data(G_CHECKSUM_SHA1,
-						   (void *)ccsmap, surf.dst.size);
+				(void *)ccsmap, surf.dst.size);
 		orig2 = g_compute_checksum_for_data(G_CHECKSUM_SHA1,
-						    (void *)mid->ptr, mid->size);
+				(void *)mid->ptr, mid->size);
 
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 
 		blt_set_ctrl_surf_object(&surf.dst, ccs2, system_memory(xe), ccssize,
-					 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+				0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 		blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 		intel_ctx_xe_sync(ctx, true);
 
 		ccsmap2 = xe_bo_map(xe, ccs2, surf.dst.size);
 		newsum = g_compute_checksum_for_data(G_CHECKSUM_SHA1,
-						     (void *)ccsmap2, surf.dst.size);
+				(void *)ccsmap2, surf.dst.size);
 		newsum2 = g_compute_checksum_for_data(G_CHECKSUM_SHA1,
-						      (void *)mid->ptr, mid->size);
+				(void *)mid->ptr, mid->size);
 
 		munmap(ccsmap2, ccssize);
 		if (blt_platform_has_flat_ccs_enabled(xe)) {
@@ -183,11 +290,11 @@ static void surf_copy(int xe,
 					 * uncompressed in xe2+ dgfx
 					 */
 					igt_assert(!blt_surface_is_compressed(xe, ctx,
-							NULL, ahnd, mid));
+								NULL, ahnd, mid));
 				} else {
 					/* ccs should be present in xe2+ igfx */
 					igt_assert(blt_surface_is_compressed(xe, ctx,
-							NULL, ahnd, mid));
+								NULL, ahnd, mid));
 				}
 			}
 		}
@@ -201,9 +308,9 @@ static void surf_copy(int xe,
 	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
 		ccsmap[i] = i;
 	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
-				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+			uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
+			uc_mocs, comp_pat_index, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -273,10 +380,10 @@ struct blt_block_copy3_data_ext {
 };
 
 static int blt_block_copy3(int xe,
-			   const intel_ctx_t *ctx,
-			   uint64_t ahnd,
-			   const struct blt_copy3_data *blt3,
-			   const struct blt_block_copy3_data_ext *ext3)
+		const intel_ctx_t *ctx,
+		uint64_t ahnd,
+		const struct blt_copy3_data *blt3,
+		const struct blt_block_copy3_data_ext *ext3)
 {
 	struct blt_copy_data blt0;
 	struct blt_block_copy_data_ext ext0;
@@ -340,11 +447,11 @@ static int blt_block_copy3(int xe,
 #define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
 
 static void block_copy(int xe,
-		       intel_ctx_t *ctx,
-		       uint32_t region1, uint32_t region2,
-		       uint32_t width, uint32_t height,
-		       enum blt_tiling_type mid_tiling,
-		       const struct test_config *config)
+		intel_ctx_t *ctx,
+		uint32_t region1, uint32_t region2,
+		uint32_t width, uint32_t height,
+		enum blt_tiling_type mid_tiling,
+		const struct test_config *config)
 {
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
@@ -354,7 +461,7 @@ static void block_copy(int xe,
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
-			       !xe_has_vram(xe)) ? region1 : region2;
+			!xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
@@ -370,11 +477,11 @@ static void block_copy(int xe,
 	blt_copy_init(xe, &blt);
 
 	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
-				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
+			T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
 	mid = blt_create_object(&blt, mid_region, width, height, bpp, uc_mocs,
-				mid_tiling, mid_compression, comp_type, true);
+			mid_tiling, mid_compression, comp_type, true);
 	dst = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
-				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
+			T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
 	igt_assert(src->size == dst->size);
 	PRINT_SURFACE_INFO("src", src);
 	PRINT_SURFACE_INFO("mid", mid);
@@ -418,10 +525,10 @@ static void block_copy(int xe,
 			exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
 			surf_ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
 			surf_ahnd = intel_allocator_open(xe, surf_ctx->vm,
-							 INTEL_ALLOCATOR_RELOC);
+					INTEL_ALLOCATOR_RELOC);
 		}
 		surf_copy(xe, surf_ctx, surf_ahnd, src, mid, dst, run_id,
-			  config->suspend_resume);
+				config->suspend_resume);
 
 		if (surf_ctx != ctx) {
 			xe_exec_queue_destroy(xe, exec_queue);
@@ -445,8 +552,8 @@ static void block_copy(int xe,
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
-			       pat_index, T_LINEAR, COMPRESSION_DISABLED,
-			       comp_type);
+				pat_index, T_LINEAR, COMPRESSION_DISABLED,
+				comp_type);
 		blt.dst.ptr = mid->ptr;
 	}
 
@@ -474,11 +581,11 @@ static void block_copy(int xe,
 }
 
 static void block_multicopy(int xe,
-			    intel_ctx_t *ctx,
-			    uint32_t region1, uint32_t region2,
-			    uint32_t width, uint32_t height,
-			    enum blt_tiling_type mid_tiling,
-			    const struct test_config *config)
+		intel_ctx_t *ctx,
+		uint32_t region1, uint32_t region2,
+		uint32_t width, uint32_t height,
+		enum blt_tiling_type mid_tiling,
+		const struct test_config *config)
 {
 	struct blt_copy3_data blt3 = {};
 	struct blt_copy_data blt = {};
@@ -489,7 +596,7 @@ static void block_multicopy(int xe,
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
-			       !xe_has_vram(xe)) ? region1 : region2;
+			!xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
@@ -505,13 +612,13 @@ static void block_multicopy(int xe,
 	blt_copy_init(xe, &blt);
 
 	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
-				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
+			T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
 	mid = blt_create_object(&blt, mid_region, width, height, bpp, uc_mocs,
-				mid_tiling, mid_compression, comp_type, true);
+			mid_tiling, mid_compression, comp_type, true);
 	dst = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
-				mid_tiling, COMPRESSION_DISABLED, comp_type, true);
+			mid_tiling, COMPRESSION_DISABLED, comp_type, true);
 	final = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
-				  T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
+			T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
 	igt_assert(src->size == dst->size);
 	PRINT_SURFACE_INFO("src", src);
 	PRINT_SURFACE_INFO("mid", mid);
@@ -534,8 +641,8 @@ static void block_multicopy(int xe,
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
-			       mid->mocs_index, pat_index, mid_tiling,
-			       COMPRESSION_DISABLED, comp_type);
+				mid->mocs_index, pat_index, mid_tiling,
+				COMPRESSION_DISABLED, comp_type);
 		blt3.dst.ptr = mid->ptr;
 	}
 
@@ -573,11 +680,11 @@ static void block_multicopy(int xe,
 }
 
 static void block_copy_large(int xe,
-			     intel_ctx_t *ctx,
-			     uint32_t region1, uint32_t region2,
-			     uint32_t width, uint32_t height,
-			     enum blt_tiling_type tiling,
-			     const struct test_config *config)
+		intel_ctx_t *ctx,
+		uint32_t region1, uint32_t region2,
+		uint32_t width, uint32_t height,
+		enum blt_tiling_type tiling,
+		const struct test_config *config)
 {
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
@@ -601,11 +708,11 @@ static void block_copy_large(int xe,
 	blt_copy_init(xe, &blt);
 
 	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
-				T_LINEAR, COMPRESSION_DISABLED,
-				COMPRESSION_TYPE_3D, true);
+			T_LINEAR, COMPRESSION_DISABLED,
+			COMPRESSION_TYPE_3D, true);
 	dst = blt_create_object(&blt, region2, width, height, bpp, uc_mocs,
-				tiling, COMPRESSION_ENABLED,
-				COMPRESSION_TYPE_3D, true);
+			tiling, COMPRESSION_ENABLED,
+			COMPRESSION_TYPE_3D, true);
 	PRINT_SURFACE_INFO("src", src);
 	PRINT_SURFACE_INFO("dst", dst);
 
@@ -618,7 +725,7 @@ static void block_copy_large(int xe,
 	blt_set_copy_object(&blt.dst, dst);
 	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
 	blt_set_object_ext(&ext.dst, param.compression_format,
-			   width, height, SURFACE_TYPE_2D);
+			width, height, SURFACE_TYPE_2D);
 	blt_set_batch(&blt.bb, bb, bb_size, region1);
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
 	intel_ctx_xe_sync(ctx, true);
@@ -634,9 +741,9 @@ static void block_copy_large(int xe,
 	if (!result) {
 		for (i = 0; i < size / sizeof(*ptr); i += 8)
 			igt_debug("[%08x]: %08x %08x %08x %08x %08x %08x %08x %08x\n",
-				  i,
-				  ptr[i], ptr[i + 1], ptr[i + 2], ptr[i + 3],
-				  ptr[i + 4], ptr[i + 5], ptr[i + 6], ptr[i + 7]);
+					i,
+					ptr[i], ptr[i + 1], ptr[i + 2], ptr[i + 3],
+					ptr[i + 4], ptr[i + 5], ptr[i + 6], ptr[i + 7]);
 	}
 
 	WRITE_PNG(xe, run_id, "dst", &blt.dst, width, height, bpp);
@@ -663,11 +770,11 @@ enum copy_func {
 static const struct {
 	const char *suffix;
 	void (*copyfn)(int fd,
-		       intel_ctx_t *ctx,
-		       uint32_t region1, uint32_t region2,
-		       uint32_t width, uint32_t height,
-		       enum blt_tiling_type btype,
-		       const struct test_config *config);
+			intel_ctx_t *ctx,
+			uint32_t region1, uint32_t region2,
+			uint32_t width, uint32_t height,
+			enum blt_tiling_type btype,
+			const struct test_config *config);
 } copyfns[] = {
 	[BLOCK_COPY] = { "", block_copy },
 	[BLOCK_MULTICOPY] = { "-multicopy", block_multicopy },
@@ -675,9 +782,9 @@ static const struct {
 };
 
 static void single_copy(int xe, const struct test_config *config,
-			int32_t region1, uint32_t region2,
-			uint32_t width, uint32_t height,
-			int tiling, enum copy_func copy_function)
+		int32_t region1, uint32_t region2,
+		uint32_t width, uint32_t height,
+		int tiling, enum copy_func copy_function)
 {
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
@@ -706,9 +813,9 @@ static void single_copy(int xe, const struct test_config *config,
 }
 
 static void block_copy_test(int xe,
-			    const struct test_config *config,
-			    struct igt_collection *set,
-			    enum copy_func copy_function)
+		const struct test_config *config,
+		struct igt_collection *set,
+		enum copy_func copy_function)
 {
 	uint16_t dev_id = intel_get_drm_devid(xe);
 	struct igt_collection *regions;
@@ -729,7 +836,7 @@ static void block_copy_test(int xe,
 
 	for_each_tiling(tiling) {
 		if (!blt_block_copy_supports_tiling(xe, tiling) ||
-		    (param.tiling >= 0 && param.tiling != tiling))
+				(param.tiling >= 0 && param.tiling != tiling))
 			continue;
 
 		for_each_variation_r(regions, 2, set) {
@@ -747,33 +854,33 @@ static void block_copy_test(int xe,
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
 
 			snprintf(testname, sizeof(testname),
-				 "%s-%s-compfmt%d-%s%s",
-				 blt_tiling_name(tiling),
-				 config->compression ?
-					 "compressed" : "uncompressed",
-				 param.compression_format, regtxt,
-				 copyfns[copy_function].suffix);
+					"%s-%s-compfmt%d-%s%s",
+					blt_tiling_name(tiling),
+					config->compression ?
+					"compressed" : "uncompressed",
+					param.compression_format, regtxt,
+					copyfns[copy_function].suffix);
 
 			if (!config->width_increment) {
 				igt_dynamic(testname)
 					single_copy(xe, config, region1, region2,
-						    width, height,
-						    tiling, copy_function);
+							width, height,
+							tiling, copy_function);
 			} else {
 				for (int w = param.incdim_width;
-				     w < param.incdim_width + config->width_steps;
-				     w += config->width_increment) {
+						w < param.incdim_width + config->width_steps;
+						w += config->width_increment) {
 					snprintf(testname, sizeof(testname),
-						 "%s-%s-compfmt%d-%s%s-%dx%d",
-						 blt_tiling_name(tiling),
-						 config->compression ?
-							 "compressed" : "uncompressed",
-						 param.compression_format, regtxt,
-						 copyfns[copy_function].suffix,
-						 w, w);
+							"%s-%s-compfmt%d-%s%s-%dx%d",
+							blt_tiling_name(tiling),
+							config->compression ?
+							"compressed" : "uncompressed",
+							param.compression_format, regtxt,
+							copyfns[copy_function].suffix,
+							w, w);
 					igt_dynamic(testname)
 						single_copy(xe, config, region1, region2,
-							    w, w, tiling, copy_function);
+								w, w, tiling, copy_function);
 				}
 
 			}
@@ -809,7 +916,7 @@ static void large_surf_ctrl_copy(int xe, const struct test_config *config)
 	}
 
 	single_copy(xe, config, region1, region2, width, height, tiling,
-		    LARGE_SURFCOPY);
+			LARGE_SURFCOPY);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
@@ -852,14 +959,14 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -b\tPrint bb\n"
-	"  -f\tCompression format (0-31)\n"
-	"  -p\tWrite PNG\n"
-	"  -s\tPrint surface info\n"
-	"  -t\tTiling format (0 - linear, 1 - XMAJOR, 2 - YMAJOR, 3 - TILE4, 4 - TILE64)\n"
-	"  -W\tWidth (default 512)\n"
-	"  -H\tHeight (default 512)"
-	;
+"  -b\tPrint bb\n"
+"  -f\tCompression format (0-31)\n"
+"  -p\tWrite PNG\n"
+"  -s\tPrint surface info\n"
+"  -t\tTiling format (0 - linear, 1 - XMAJOR, 2 - YMAJOR, 3 - TILE4, 4 - TILE64)\n"
+"  -W\tWidth (default 512)\n"
+"  -H\tHeight (default 512)"
+;
 
 int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 {
@@ -873,8 +980,8 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		xe_device_get(xe);
 
 		set = xe_get_memory_region_set(xe,
-					       DRM_XE_MEM_REGION_CLASS_SYSMEM,
-					       DRM_XE_MEM_REGION_CLASS_VRAM);
+				DRM_XE_MEM_REGION_CLASS_SYSMEM,
+				DRM_XE_MEM_REGION_CLASS_VRAM);
 	}
 
 	igt_describe("Check block-copy uncompressed blit");
@@ -887,7 +994,7 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_describe("Check block-copy uncompressed blit with increment width/height");
 	igt_subtest_with_dynamic("block-copy-uncompressed-inc-dimension") {
 		struct test_config config = { .width_increment = 15,
-					      .width_steps = 512 };
+			.width_steps = 512 };
 
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
@@ -902,8 +1009,8 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_describe("Check block-copy compressed blit with increment width/height");
 	igt_subtest_with_dynamic("block-copy-compressed-inc-dimension") {
 		struct test_config config = { .compression = true,
-					      .width_increment = 15,
-					      .width_steps = 512 };
+			.width_increment = 15,
+			.width_steps = 512 };
 
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
@@ -918,7 +1025,7 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_describe("Check block-multicopy flatccs inplace decompression blit");
 	igt_subtest_with_dynamic("block-multicopy-inplace") {
 		struct test_config config = { .compression = true,
-					      .inplace = true };
+			.inplace = true };
 
 		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
 	}
@@ -926,17 +1033,17 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_describe("Check flatccs data can be copied from/to surface");
 	igt_subtest_with_dynamic("ctrl-surf-copy") {
 		struct test_config config = { .compression = true,
-					      .surfcopy = true };
+			.surfcopy = true };
 
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
 	igt_describe("Check flatccs data are physically tagged and visible"
-		     " in different contexts");
+			" in different contexts");
 	igt_subtest_with_dynamic("ctrl-surf-copy-new-ctx") {
 		struct test_config config = { .compression = true,
-					      .surfcopy = true,
-					      .new_ctx = true };
+			.surfcopy = true,
+			.new_ctx = true };
 
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
@@ -955,7 +1062,7 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_describe("Check flatccs data can be copied from large surface");
 	igt_subtest("large-ctrl-surf-copy") {
 		struct test_config config = { .overwrite_width = 4096,
-					      .overwrite_height = 4096+64, };
+			.overwrite_height = 4096+64, };
 
 		large_surf_ctrl_copy(xe, &config);
 	}
-- 
2.43.0

