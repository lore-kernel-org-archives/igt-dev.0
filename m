Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C511CCF9E3
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 13:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF7D10E16F;
	Fri,  7 Nov 2025 13:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJdpVZsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285DB10E16F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762521772; x=1794057772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LmDYHGDbT0fBVIxLXuSACclHiwnrIptGEzQsFe9peTo=;
 b=SJdpVZsCPi00v+y4wlE6fY+hnfnCLQoaFlM9AkPjtwEOjhGg8x6Y/3T8
 yhtLSHDoQRoSKDrk1eajeD0JeKInIbA445CgC5U44iySPa/hKHA3kS5tn
 uVY0eHwcISjeBfWmvh97oq0+m4W3CHdbysFPNNcOx3AGpXpwhyqBu2MMY
 1COCfDb2qbhJ9wubbVBQp2LcWMdihrjmhaocCpWpCIfZsn6NY3ZchOt2Q
 3gg1HJ34X5Cz3H5Xx1XZarXbJZdsPyFeDr2+UN+v/audSxUO39Pxau4aH
 L34HnDe4npM/tB+wPXUnfJ+0mtqSE8K82TCQWQw9+qHU1NvYewMyRaeCp w==;
X-CSE-ConnectionGUID: bR8/0XXuRzChQ6BY6gkFMw==
X-CSE-MsgGUID: igQvct9cQaq91p9LS7ic2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75361053"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="75361053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:22:52 -0800
X-CSE-ConnectionGUID: R531+HqgS/arPETmpwV/+A==
X-CSE-MsgGUID: 0xkyNIFxTbOfKmsGF5fGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192298366"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2025 05:22:50 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Nitin Gote <nitin.r.gote@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe: add VM_BIND DECOMPRESS flag and basic decompression
 tests
Date: Fri,  7 Nov 2025 19:23:00 +0530
Message-ID: <20251107135259.622940-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Add new userspace uapi flag DRM_XE_VM_BIND_FLAG_DECOMPRESS to request a
decompressed GPU view when mapping compressed BOs. These tests validate
VM_BIND DECOMPRESS support. Corresponding KMD series:
https://patchwork.freedesktop.org/series/154714/ (KMD patch required).

Add two tests to xe_ccs.c:
 1. vm-bind-decompress:
    - Map compressed BO with DECOMPRESS flag and verifies decompression.
 2. vm-bind-fault-mode-decompress:
    - Verifies decompression via the page_fault path in FAULT_MODE VMs.

Tests use the blitter to produce compressed surfaces and verify
correctness via GPU operations; they also ensure allocator ordering
to avoid implicit VM_BINDs that carry a signal (LR/FAULT mode).
Requires XE2+ and compression support;
Add small utilities (pattern fill, print, verify) used by tests.

v2:
   When unmapping a VM_BIND explicitly clear the DECOMPRESS flag 
   (bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS)
   to ensure the unmap/update operation is not interpreted as a 
   decompression request. This prevents the kernel from attempting
   a decompress on an unmap.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_ccs.c      | 709 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 706 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 89ab54935..00e1fe5e9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1119,6 +1119,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 7)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 61cf97d52..3dcf516f5 100644
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
@@ -60,6 +62,12 @@
  *
  * SUBTEST: suspend-resume
  * Description: Check flatccs data persists after suspend / resume (S0)
+ *
+ * SUBTEST: vm-bind-decompress
+ * Description: Validate VM_BIND with DECOMPRESS flag functionality
+ *
+ * SUBTEST: vm-bind-fault-mode-decompress
+ * Description: Validate VM_BIND with DECOMPRESS flag functionality in fault mode
  */
 
 IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression on Xe");
@@ -90,6 +98,8 @@ struct test_config {
 	bool surfcopy;
 	bool new_ctx;
 	bool suspend_resume;
+	bool vm_bind_decompress;
+	bool vm_bind_fault_mode_decompress;
 	int width_increment;
 	int width_steps;
 	int overwrite_width;
@@ -104,6 +114,116 @@ struct test_config {
 	if (param.write_png) \
 		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
 
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
+/**
+ * print_buffer_data() - Print buffer data in hex format for debugging
+ * @data: pointer to buffer data
+ * @size: buffer size in bytes
+ * @label: label to identify the data (e.g., "BEFORE", "AFTER")
+ * @max_lines: maximum number of lines to print (each line = 16 bytes)
+ */
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
+/* Simple helper to fill buffer with a more compressible pattern */
+static void fill_buffer_simple_pattern(void *ptr, size_t size)
+{
+	u32 *buffer = (uint32_t *)ptr;
+	size_t num_elements = size / sizeof(uint32_t);
+	size_t i;
+
+	/* Most values are zero — memset for speed, then set the sparse markers. */
+	if (size)
+		memset(ptr, 0, num_elements * sizeof(uint32_t));
+
+	/* Write sparse pattern every 16 elements (fewer writes). */
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
+
 static void surf_copy(int xe,
 		      intel_ctx_t *ctx,
 		      uint64_t ahnd,
@@ -654,6 +774,546 @@ static void block_copy_large(int xe,
 	igt_assert_f(result, "ccs data must have no zeros!\n");
 }
 
+/**
+ * vm_bind_decompress_test()
+ *
+ * This test validates the VM_BIND with DECOMPRESS flag:
+ * 1. Create source data with known pattern
+ * 2. Compress data using GPU blit engine
+ * 3. Use VM_BIND_OP_MAP_DECOMPRESS to test in-place decompression
+ * 4. Verify API functionality
+ * 5. Test data integrity before/after VM_BIND operations
+ *
+ * SUCCESS: Decompressed data must match original source pattern
+ * FAILURE: Any other outcome results in test failure
+ */
+static void vm_bind_decompress_test(int xe,
+				    intel_ctx_t *ctx,
+				    u64 ahnd,
+				    u32 region1,
+				    u32 region2,
+				    u32 width,
+				    u32 height,
+				    enum blt_tiling_type tiling,
+				    const struct test_config *config)
+{
+	/* BLT operation structures for GPU copy operations */
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {};
+
+	/* Source and compressed buffers */
+	struct blt_copy_object *src, *compressed;
+
+	/* Basic surface and operation parameters */
+	const u32 bpp = 32;
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u32 bb;
+	u32 devid = intel_get_drm_devid(xe);
+	u64 size = width * height * 4;
+
+	/* PAT indices for uncompressed access */
+	u32 uncompressed_pat;
+
+	/* VM_BIND operation structures for kernel ioctl calls */
+	struct drm_xe_vm_bind bind_args;
+
+	/* CPU-accessible pointer to buffer data */
+	void *src_ptr;
+
+	/* GPU operation parameters */
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	u8 uc_mocs = intel_get_uc_mocs_index(xe);
+
+	/* Test result variables */
+	int result;
+	int unmap_result = 0;
+	bool decompression_successful = false;
+
+	/* Variables for VM_BIND operations */
+	u32 vm;
+	u64 vm_map_addr;
+	u32 map_size;
+
+	/* Variables for buffer verification */
+	struct drm_xe_gem_mmap_offset mmap_offset = {0};
+	void *mapped_data = MAP_FAILED;
+	u32 *mapped_ptr = NULL;
+
+	/* VM_BIND decompression requires XE2+ (Gen 20+) */
+	igt_require(intel_gen(devid) >= 20);
+	igt_require(config->compression);
+	igt_require(blt_uses_extended_block_copy(xe));
+
+	/* PAT index for uncompressed memory access */
+	uncompressed_pat = intel_get_pat_idx_uc(xe);
+
+	/* Create VM context for VM_BIND operations */
+	vm = xe_vm_create(xe, 0, 0);
+	igt_assert(vm > 0);
+
+	/* Create GPU batch buffer for storing blit commands */
+	bb = xe_bo_create(xe, 0, bb_size, region1,
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	igt_assert(bb > 0);
+
+	/* Initialize the blit operation structure for GPU copy operations */
+	blt_copy_init(xe, &blt);
+
+	/* Step 1: Creating source buffer with test pattern */
+	igt_debug("Step 1: Creating source buffer with test pattern...\n");
+	src = blt_create_object(&blt, region1, width, height,
+				bpp, uc_mocs, T_LINEAR, COMPRESSION_DISABLED,
+				comp_type, true);
+
+	/* Get CPU pointer to source buffer for data initialization */
+	src_ptr = src->ptr;
+	igt_assert(src && src->ptr);
+
+	fill_buffer_simple_pattern(src_ptr, src->size);
+	igt_assert_f(verify_test_pattern(src_ptr, src->size, "SOURCE"),
+		     "Source pattern verification failed");
+
+	igt_debug("Original source data (first 64 bytes):\n");
+	print_buffer_data(src_ptr, 64, "ORIGINAL", 4);
+
+	/* Step 2: Create compressed buffer with compress data */
+	igt_debug("Step 2: Compressing data using GPU...\n");
+	compressed = blt_create_object(&blt, region2, width, height,
+				       bpp, uc_mocs, tiling, COMPRESSION_ENABLED,
+				       comp_type, true);
+	igt_assert(compressed);
+
+	/* Configure blit operation to compress source data into compressed buffer */
+	blt.color_depth = CD_32bit;
+	blt.print_bb = param.print_bb;
+
+	/* Set source and destination objects for the blit operation */
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, compressed);
+
+	/* Configure extended blit parameters for compression */
+	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
+
+	/* Set up batch buffer for GPU commands */
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+
+	/* Execute the blit operation on GPU to compress the data */
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
+
+	/* Wait for GPU operation to complete */
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Verify compression occurred */
+	if (blt_platform_has_flat_ccs_enabled(xe)) {
+		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, compressed);
+
+		if (!is_compressed)
+			igt_assert_f(false,
+				     "Surface compression failed - cannot test decompression");
+	}
+
+	/* Show compressed data before VM_BIND */
+	igt_debug("Compressed data before VM_BIND (first 64 bytes):\n");
+	print_buffer_data(compressed->ptr, 64, "COMPRESSED", 4);
+
+	/* Step 3: Test VM_BIND with DECOMPRESS flag to test in-place decompression */
+	igt_debug("Step 3: Testing VM_BIND with DECOMPRESS flag ...\n");
+
+	/* VM_BIND operation parameters */
+	vm_map_addr = 0x30000000;
+	map_size = ALIGN(size, xe_get_default_alignment(xe));
+
+	/* Configure the VM bind operation for decompression mapping */
+	memset(&bind_args, 0, sizeof(bind_args));
+	bind_args.vm_id = vm;
+	bind_args.num_binds = 1;
+	bind_args.bind.obj = compressed->handle;
+	bind_args.bind.obj_offset = 0;
+	bind_args.bind.range = map_size;
+	bind_args.bind.addr = vm_map_addr;
+	bind_args.bind.op = DRM_XE_VM_BIND_OP_MAP;
+
+	/* Create the mapping first; do a separate update to change PAT/flags below. */
+	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
+	igt_assert_eq(result, 0);
+
+	/* Update the existing mapping to request a decompressed GPU view */
+	bind_args.bind.pat_index = uncompressed_pat;
+	bind_args.bind.flags = DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+
+	/* Execute VM_BIND ioctl */
+	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
+	if (result != 0)
+		igt_assert_f(false, "VM_BIND with DECOMPRESS flag failed: %d (%s)",
+			     result, strerror(errno));
+
+	/* Step 4: Verify decompression by checking buffer data */
+	igt_debug("Step 4: Verifying decompression by checking buffer data...\n");
+
+	/* Get mmap offset for the compressed buffer */
+	mmap_offset.handle = compressed->handle;
+	mmap_offset.flags = 0;
+
+	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
+	igt_assert_eq(result, 0);
+
+	/* Map the buffer for CPU access */
+	mapped_data = mmap(NULL, size, PROT_READ, MAP_SHARED, xe, mmap_offset.offset);
+	igt_assert(mapped_data != MAP_FAILED);
+
+	mapped_ptr = (uint32_t *)mapped_data;
+
+	/* Show buffer data after page fault handling */
+	igt_debug("Buffer data after page fault handling (first 64 bytes):\n");
+	print_buffer_data(mapped_ptr, 64, "AFTER_FAULT", 4);
+
+	/* Verify that the buffer now contains the original test pattern */
+	igt_debug("Checking if buffer contains decompressed data (original pattern)...\n");
+	decompression_successful = verify_test_pattern(mapped_ptr, size, "DECOMPRESSED");
+
+	if (decompression_successful) {
+		igt_info("SUCCESS: Buffer contains original test pattern!\n");
+		igt_debug("Data verification successful:\n");
+	} else {
+		/* provide concise diagnostics for reviewers */
+		igt_debug("Decompression verification failed - showing short dumps\n");
+		print_buffer_data(mapped_ptr, min_t(size_t, 256, size), "CURRENT_STATE", 4);
+		print_buffer_data(src_ptr, min_t(size_t, 256, src->size), "EXPECTED", 4);
+	}
+
+	/* Cleanup mapping */
+	munmap(mapped_data, size);
+
+	/* Step 5: Cleanup */
+	igt_debug("Step 5: Cleaning up resources...\n");
+
+	/* Unmap the VM binding */
+	bind_args.bind.op = DRM_XE_VM_BIND_OP_UNMAP;
+	bind_args.bind.obj = 0;
+	bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+
+	unmap_result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
+	if (unmap_result != 0)
+		igt_warn("VM unmap failed: %d (%s)", unmap_result, strerror(errno));
+
+	/* Remove address mappings from allocator */
+	put_offset(ahnd, src->handle);
+	put_offset(ahnd, compressed->handle);
+	put_offset(ahnd, bb);
+	intel_allocator_bind(ahnd, 0, 0);
+
+	/* Destroy buffer objects and free memory */
+	blt_destroy_object(xe, src);
+	blt_destroy_object(xe, compressed);
+	gem_close(xe, bb);
+	xe_vm_destroy(xe, vm);
+
+	/* SUCCESS: Test only passes if decompression occurred */
+	if (!decompression_successful)
+		igt_assert_f(false, "TEST FAILED: Decompression did not occurred");
+}
+
+/**
+ * vm_bind_fault_mode_decompress_test()
+ *
+ * This test validates that VM_BIND with DECOMPRESS flag triggers actual decompression
+ * when a page fault occurs in FAULT_MODE VMs. Success is determined by comparing
+ * decompressed data with the original source pattern.
+ *
+ * SUCCESS: Decompressed data must match original source pattern
+ * FAILURE: Any other outcome results in test failure
+ */
+static void vm_bind_fault_mode_decompress_test(int xe,
+					       intel_ctx_t *ctx,
+					       u64 ahnd,
+					       u32 region1,
+					       u32 region2,
+					       u32 width,
+					       u32 height,
+					       enum blt_tiling_type tiling,
+					       const struct test_config *config)
+{
+	/* BLT operation structures for GPU copy operations */
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {};
+
+	/* Source and compressed buffers */
+	struct blt_copy_object *src, *compressed;
+
+	/* Basic surface and operation parameters */
+	const u32 bpp = 32;
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u32 bb;
+	u32 devid = intel_get_drm_devid(xe);
+	u64 size = width * height * 4;
+
+	/* PAT indices for uncompressed access */
+	u32 uncompressed_pat;
+
+	/* VM_BIND operation structures for kernel ioctl calls */
+	struct drm_xe_vm_bind bind_args;
+
+	/* CPU-accessible pointer to buffer data */
+	void *src_ptr;
+
+	/* GPU operation parameters */
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	u8 uc_mocs = intel_get_uc_mocs_index(xe);
+
+	/* Test result variables */
+	int result;
+	int unmap_result = 0;
+	bool decompression_successful = false;
+
+	/* Variables for VM_BIND operations */
+	u32 vm;
+	u64 vm_map_addr;
+	u32 map_size;
+
+	/* Variables for data verification */
+	struct drm_xe_gem_mmap_offset mmap_offset = {0};
+	void *mapped_data = MAP_FAILED;
+	u32 *mapped_ptr = NULL;
+
+	/* fault trigger resources */
+	struct drm_xe_engine_class_instance inst = { .engine_class = DRM_XE_ENGINE_CLASS_COPY };
+	u32 fault_exec_queue = 0;
+	intel_ctx_t *fault_ctx = NULL;
+	u64 fault_ahnd = 0;
+	u32 cmd_bo = 0;
+	u32 *cmd = MAP_FAILED;
+	struct drm_xe_exec exec;
+	int exec_result = -1;
+
+	/* VM_BIND decompression requires XE2+ (Gen 20+) */
+	igt_require(intel_gen(devid) >= 20);
+	igt_require(config->compression);
+	igt_require(blt_uses_extended_block_copy(xe));
+
+	/* Get PAT index for uncompressed memory access */
+	uncompressed_pat = intel_get_pat_idx_uc(xe);
+
+	/* Create FAULT_MODE VM (requires LR_MODE) for VM_BIND operation */
+	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm > 0);
+
+	/* Create GPU batch buffer for storing blit commands */
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	igt_assert(bb > 0);
+
+	/* Initialize the blit operation structure for GPU copy operations */
+	blt_copy_init(xe, &blt);
+
+	/* Step 1: Create source buffer with test pattern */
+	igt_debug("Step 1: Creating source buffer with test pattern...\n");
+	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
+				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
+	igt_assert(src && src->ptr);
+
+	/* Get CPU pointer to source buffer for data initialization */
+	src_ptr = src->ptr;
+	igt_assert(src && src->ptr);
+
+	fill_buffer_simple_pattern(src_ptr, src->size);
+	igt_assert_f(verify_test_pattern(src_ptr, src->size, "SOURCE"),
+		     "Source pattern verification failed");
+
+	igt_debug("Original source data (first 64 bytes):\n");
+	print_buffer_data(src_ptr, 64, "ORIGINAL", 4);
+
+	/* Step 2: Create compressed buffer with compress data */
+	igt_debug("Step 2: Compressing data using GPU...\n");
+	compressed = blt_create_object(&blt, region2, width, height, bpp, uc_mocs,
+				       tiling, COMPRESSION_ENABLED, comp_type, true);
+	igt_assert(compressed);
+
+	/* Configure blit operation to compress source data into compressed buffer */
+	blt.color_depth = CD_32bit;
+	blt.print_bb = param.print_bb;
+
+	/* Set source and destination objects for the blit operation */
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, compressed);
+
+	/* Configure extended blit parameters for compression */
+	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
+
+	/* Set up batch buffer for GPU commands */
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+
+	/* Execute the blit operation on GPU to compress the data */
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
+
+	/* Wait for GPU operation to complete */
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Verify compression occurred */
+	if (blt_platform_has_flat_ccs_enabled(xe)) {
+		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, compressed);
+
+		if (!is_compressed)
+			igt_assert_f(false,
+				     "Surface compression failed - cannot test decompression");
+	}
+
+	/* Show compressed data before VM_BIND */
+	igt_debug("Compressed data before VM_BIND (first 64 bytes):\n");
+	print_buffer_data(compressed->ptr, 64, "COMPRESSED", 4);
+
+	/* Step 3: Test VM_BIND with DECOMPRESS flag in FAULT_MODE */
+	igt_debug("Step 3: Testing VM_BIND with DECOMPRESS flag in FAULT_MODE...\n");
+
+	/* VM_BIND operation parameters */
+	vm_map_addr = ALIGN(0x40000, 4096);
+	map_size = ALIGN(size, xe_get_default_alignment(xe));
+
+	/* Configure VM_BIND operation */
+	memset(&bind_args, 0, sizeof(bind_args));
+	bind_args.vm_id = vm;
+	bind_args.num_binds = 1;
+	bind_args.bind.obj = compressed->handle;
+	bind_args.bind.obj_offset = 0;
+	bind_args.bind.range = map_size;
+	bind_args.bind.addr = vm_map_addr;
+	bind_args.bind.op = DRM_XE_VM_BIND_OP_MAP;
+
+	/* Ensure no syncobj/signal usage in LR/FAULT mode */
+	bind_args.num_syncs = 0;
+	bind_args.syncs = 0;
+	bind_args.extensions = 0;
+
+	/* Create the mapping first; do a separate update to change PAT/flags below */
+	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
+	igt_assert_eq(result, 0);
+
+	/* Update the existing mapping to request a decompressed GPU view */
+	bind_args.bind.pat_index = uncompressed_pat;
+	bind_args.bind.flags = DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+
+	/* Execute VM_BIND ioctl */
+	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
+	if (result != 0) {
+		igt_assert_f(false, "VM_BIND with DECOMPRESS flag failed: %d (%s)",
+			     result, strerror(errno));
+	}
+
+	/* Step 4: Trigger page fault to activate decompression */
+	igt_debug("Step 4: Triggering page fault to activate decompression...\n");
+
+	/* Create execution context with FAULT_MODE VM */
+	fault_exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+	fault_ctx = intel_ctx_xe(xe, vm, fault_exec_queue, 0, 0, 0);
+	fault_ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+
+	/* Create small command buffer that writes to vm_map_addr to trigger page fault */
+	cmd_bo = xe_bo_create(xe, 0, 4096, region1, 0);
+	cmd = xe_bo_map(xe, cmd_bo, 4096);
+	igt_assert(cmd && cmd != MAP_FAILED);
+
+	/* Use MI_STORE_DWORD_IMM to write to mapped address */
+	cmd[0] = 0x00000000;
+	cmd[1] = MI_STORE_DWORD_IMM | (1 << 22);
+	cmd[2] = (uint32_t)(vm_map_addr);
+	cmd[3] = (uint32_t)(vm_map_addr >> 32);
+	cmd[4] = 0xDEADBEEF;
+	cmd[5] = MI_BATCH_BUFFER_END;
+
+	/* Properly initialize exec structure */
+	memset(&exec, 0, sizeof(exec));
+	exec.exec_queue_id = fault_exec_queue;
+	exec.address = get_offset(fault_ahnd, cmd_bo, 4096, 0);
+	exec.num_batch_buffer = 1;
+	exec.num_syncs = 0;
+	exec.syncs = 0;
+	exec.num_syncs = 0;
+	exec.extensions = 0;
+
+	exec_result = igt_ioctl(xe, DRM_IOCTL_XE_EXEC, &exec);
+	if (exec_result != 0) {
+		igt_warn("EXEC ioctl failed: %d (%s) - continuing to verification\n",
+			 exec_result, strerror(errno));
+	} else {
+		/*
+		 * Wait for GPU submission that used fault_ctx to
+		 * finish so page-fault handling completes
+		 */
+		usleep(10000);
+	}
+
+	/* Cleanup fault test resources */
+	if (cmd && cmd != MAP_FAILED)
+		munmap(cmd, 4096);
+	gem_close(xe, cmd_bo);
+	put_ahnd(fault_ahnd);
+	xe_exec_queue_destroy(xe, fault_exec_queue);
+	free(fault_ctx);
+
+	/* Step 5: Verify decompression by checking buffer data */
+	igt_debug("Step 5: Verifying decompression by checking buffer data...\n");
+
+	/* Get mmap offset for the compressed buffer */
+	mmap_offset.handle = compressed->handle;
+	mmap_offset.flags = 0;
+
+	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
+	igt_assert_eq(result, 0);
+
+	/* Map the buffer for CPU access */
+	mapped_data = mmap(NULL, size, PROT_READ, MAP_SHARED, xe, mmap_offset.offset);
+	igt_assert(mapped_data != MAP_FAILED);
+	mapped_ptr = (uint32_t *)mapped_data;
+
+	/* Show buffer data after page fault handling */
+	igt_debug("Buffer data after page fault handling (first 64 bytes):\n");
+	print_buffer_data(mapped_ptr, 64, "AFTER_FAULT", 4);
+
+	/* Verify that the buffer now contains the original test pattern */
+	igt_debug("Checking if buffer contains decompressed data (original pattern)...\n");
+	decompression_successful = verify_test_pattern(mapped_ptr, size, "DECOMPRESSED");
+
+	if (decompression_successful) {
+		igt_info("SUCCESS: Buffer contains original test pattern!\n");
+		/* Show comparison */
+		igt_debug("Data verification successful:\n");
+	} else {
+		/* provide concise diagnostics for reviewers */
+		igt_debug("Decompression verification failed - showing short dumps\n");
+		print_buffer_data(mapped_ptr, min_t(size_t, 256, size), "CURRENT_STATE", 4);
+		print_buffer_data(src_ptr, min_t(size_t, 256, src->size), "EXPECTED", 4);
+	}
+
+	/* Cleanup mapping */
+	munmap(mapped_data, size);
+
+	/* Step 6: Cleanup */
+	igt_debug("Step 6: Cleaning up resources...\n");
+
+	/* Unmap the VM binding */
+	bind_args.bind.op = DRM_XE_VM_BIND_OP_UNMAP;
+	bind_args.bind.obj = 0;
+	bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS;
+	unmap_result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
+	if (unmap_result != 0)
+		igt_warn("VM unmap failed: %d (%s)", unmap_result, strerror(errno));
+
+	/* Clean up memory resources */
+	put_offset(ahnd, src->handle);
+	put_offset(ahnd, compressed->handle);
+	put_offset(ahnd, bb);
+	intel_allocator_bind(ahnd, 0, 0);
+	blt_destroy_object(xe, src);
+	blt_destroy_object(xe, compressed);
+	gem_close(xe, bb);
+	xe_vm_destroy(xe, vm);
+
+	/* SUCCESS CRITERIA: Test only passes if decompression occurred */
+	if (!decompression_successful)
+		igt_assert_f(false,
+			     "TEST FAILED: Decompression did not occur during page fault handling");
+}
+
 enum copy_func {
 	BLOCK_COPY,
 	BLOCK_MULTICOPY,
@@ -685,6 +1345,7 @@ static void single_copy(int xe, const struct test_config *config,
 	uint32_t vm, exec_queue;
 	uint32_t sync_bind, sync_out;
 	intel_ctx_t *ctx;
+	u64 ahnd;
 
 	vm = xe_vm_create(xe, 0, 0);
 	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
@@ -693,10 +1354,24 @@ static void single_copy(int xe, const struct test_config *config,
 	ctx = intel_ctx_xe(xe, vm, exec_queue,
 			   0, sync_bind, sync_out);
 
-	copyfns[copy_function].copyfn(xe, ctx,
-				      region1, region2,
-				      width, height,
-				      tiling, config);
+	if (config->vm_bind_fault_mode_decompress) {
+		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+		vm_bind_fault_mode_decompress_test(xe, ctx, ahnd,
+						   region1, region2, width,
+						   height, tiling, config);
+		put_ahnd(ahnd);
+	} else if (config->vm_bind_decompress) {
+		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+		vm_bind_decompress_test(xe, ctx, ahnd,
+					region1, region2, width,
+					height, tiling, config);
+		put_ahnd(ahnd);
+	} else {
+		copyfns[copy_function].copyfn(xe, ctx,
+					      region1, region2,
+					      width, height,
+					      tiling, config);
+	}
 
 	xe_exec_queue_destroy(xe, exec_queue);
 	xe_vm_destroy(xe, vm);
@@ -969,6 +1644,32 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
+	igt_describe("Validate VM_BIND with DECOMPRESS flag functionality");
+	igt_subtest("vm-bind-decompress") {
+		struct test_config config = { .compression = true,
+					      .vm_bind_decompress = true };
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
+	}
+
+	igt_describe("Validate VM_BIND with DECOMPRESS flag functionality in fault mode");
+	igt_subtest("vm-bind-fault-mode-decompress") {
+		struct test_config config = { .compression = true,
+					      .vm_bind_fault_mode_decompress = true };
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
+	}
+
 	igt_fixture {
 		xe_device_put(xe);
 		close(xe);
-- 
2.50.1

