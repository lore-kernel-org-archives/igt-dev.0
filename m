Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85904105F782
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB9C10E036;
	Fri, 13 Mar 2026 09:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftqbi+BB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627F810EB56
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773392514; x=1804928514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6WlVT0xI0I7kbhcP9+z5TPvQsTWOR/Zv4BBzNwzGShA=;
 b=ftqbi+BBgaONsut4xdRBSj33lZ3MBu9DNstZbrI1WeXUSkhs9VwjT4ue
 vQ7MxYsH6vOM6HE0y5uiG35QXOrQ7/1nb7O0r0YBLjtneBmU79lon3gz8
 vETUEFkszEEYufqFgSfaIljy71tsGPx9WPF35/iQRfkMsuGprDRoW+bxx
 RHi0fSAwv8V2GSvQuWssyM5Rsuj4bgq64aTDMQ5KKjfmAgesXfS/3aBLU
 aGjmUypnI8ATZ9Iw+JIELgoWzp6CE7LrS56Sl1jqZzAT6fAmHT7MAz7CX
 9ciLC1oaCdEFCnihgn11bP7N5Sb7+9G9PUTiaXNsLkGuPFjEmTEtjCcJ8 g==;
X-CSE-ConnectionGUID: FrPa/tyJTrGUXKybpFS8sw==
X-CSE-MsgGUID: TG7m4mT3S2e0tm6HzMOofA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74199002"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="74199002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:01:54 -0700
X-CSE-ConnectionGUID: 9hCXve9BTNS3l+BLYL7DIQ==
X-CSE-MsgGUID: EIpuCLdmSsqGJX7fXkkVeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="225231245"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 13 Mar 2026 02:01:51 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic
 decompression tests
Date: Fri, 13 Mar 2026 15:05:07 +0530
Message-ID: <20260313093523.1771282-2-nitin.r.gote@intel.com>
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

v6:
  - Rebase on current top after recent uapi changes in
    intel_drm_local.h

v5:
  - replace usleep with user-fence wait

v4: (Matthew Auld)
  - Instead of mmap(), use xe_bo_map()
  - Use __xe_vm_bind() lib function
  - Add blt_platform_has_flat_ccs_enabled() check
    at the beginning
  - Remove beginning igt_assert
  - use bb_size for the sizing
  - Nits

v3: (Matthew Auld)
  - Avoid manual edit in xe_drm.h, instead put change in
    include/drm-uapi-experimental/intel_drm_local.h and after
    official header is re-generated then drop this change.
  - Add a comment to give idea about sparse pattern values
  - Set pat_index to something well define before calling first
    vm_bind ioctl.
  - Nits

v2:
    When unmapping a VM_BIND explicitly clear the DECOMPRESS flag
    (bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS)
    to ensure the unmap/update operation is not interpreted as a
    decompression request. This prevents the kernel from attempting
    a decompress on an unmap.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 .../drm-uapi-experimental/intel_drm_local.h   |   2 +
 tests/intel/xe_ccs.c                          | 616 +++++++++++++++++-
 2 files changed, 614 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index b48c9e219..10cc011f7 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,6 +20,8 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 7)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a21922ee5..2f0f91bd6 100644
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
@@ -104,6 +114,115 @@ struct test_config {
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
+
 static void surf_copy(int xe,
 		      intel_ctx_t *ctx,
 		      uint64_t ahnd,
@@ -654,6 +773,453 @@ static void block_copy_large(int xe,
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
+	struct drm_xe_gem_mmap_offset mmap_offset = {};
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {};
+	struct blt_copy_object *compressed, *src;
+	const u32 bpp = 32;
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u64 vm_map_addr;
+	u64 size = width * height * 4;
+	u32 map_size;
+	u32 uncompressed_pat;
+	u32 comp_pat;
+	u32 vm;
+	u32 bb;
+	u32 devid = intel_get_drm_devid(xe);
+	u8 uc_mocs = intel_get_uc_mocs_index(xe);
+	void *mapped_data = MAP_FAILED;
+	void *src_ptr;
+	u32 *mapped_ptr = NULL;
+	int result, unmap_result = 0;
+	bool pattern_matches = false;
+	bool is_compressed = false;
+
+	/* VM_BIND decompression requires XE2+ (Gen 20+) */
+	igt_require(intel_gen(devid) >= 20);
+	igt_require(config->compression);
+	igt_require(blt_uses_extended_block_copy(xe));
+	igt_require(blt_platform_has_flat_ccs_enabled(xe));
+
+	/* PAT index for uncompressed memory access */
+	uncompressed_pat = intel_get_pat_idx_uc(xe);
+	comp_pat = intel_get_pat_idx_uc_comp(xe);
+
+	vm = xe_vm_create(xe, 0, 0);
+	igt_assert(vm > 0);
+
+	bb = xe_bo_create(xe, 0, bb_size, region1,
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	blt_copy_init(xe, &blt);
+
+	igt_debug("Step 1: Creating source buffer with test pattern...\n");
+	src = blt_create_object(&blt, region1, width, height,
+				bpp, uc_mocs, T_LINEAR, COMPRESSION_DISABLED,
+				comp_type, true);
+	src_ptr = src->ptr;
+
+	fill_buffer_simple_pattern(src_ptr, src->size);
+	igt_assert_f(verify_test_pattern(src_ptr, src->size, "SOURCE"),
+		     "Source pattern verification failed");
+
+	igt_debug("Original source data (first 64 bytes):\n");
+	print_buffer_data(src_ptr, 64, "ORIGINAL", 4);
+
+	igt_debug("Step 2: Compressing data using GPU...\n");
+	compressed = blt_create_object(&blt, region2, width, height,
+				       bpp, uc_mocs, tiling, COMPRESSION_ENABLED,
+				       comp_type, true);
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
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Verify compression occurred */
+	is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, compressed);
+	igt_assert_f(is_compressed, "Surface compression failed - cannot test decompression");
+
+	igt_debug("Compressed data before VM_BIND (first 64 bytes):\n");
+	print_buffer_data(compressed->ptr, 64, "COMPRESSED", 4);
+
+	igt_debug("Step 3: Testing VM_BIND with DECOMPRESS flag ...\n");
+	/* VM_BIND operation parameters */
+	vm_map_addr = 0x30000000;
+	map_size = ALIGN(size, xe_get_default_alignment(xe));
+
+	/* Create the mapping first; do a separate update to change PAT/flags below. */
+	result = __xe_vm_bind(xe, vm, 0, compressed->handle, 0, vm_map_addr, map_size,
+			      DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0, comp_pat, 0);
+	igt_assert_eq(result, 0);
+
+	/* Update the existing mapping to request a decompressed GPU view */
+	result = __xe_vm_bind(xe, vm, 0, compressed->handle, 0, vm_map_addr, map_size,
+			      DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_DECOMPRESS,
+			      NULL, 0, 0, uncompressed_pat, 0);
+
+	if (result != 0)
+		igt_assert_f(false, "VM_BIND with DECOMPRESS flag failed: %d (%s)",
+			     result, strerror(errno));
+
+	igt_debug("Step 4: Verifying decompression by checking buffer data...\n");
+	/* Get mmap offset for the compressed buffer */
+	mmap_offset.handle = compressed->handle;
+	mmap_offset.flags = 0;
+
+	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
+	igt_assert_eq(result, 0);
+
+	/* Map the buffer for CPU access */
+	mapped_data = xe_bo_map(xe, compressed->handle, size);
+	mapped_ptr = (uint32_t *)mapped_data;
+
+	igt_debug("Buffer data after page fault handling (first 64 bytes):\n");
+	print_buffer_data(mapped_ptr, 64, "AFTER_FAULT", 4);
+
+	/* Verify that the buffer now contains the original test pattern */
+	igt_debug("Checking if buffer contains decompressed data (original pattern)...\n");
+	pattern_matches = verify_test_pattern(mapped_ptr, size, "DECOMPRESSED");
+
+	if (pattern_matches) {
+		igt_info("SUCCESS: Buffer contains original test pattern!\n");
+		igt_debug("Data verification successful:\n");
+	} else {
+		/* provide concise diagnostics for reviewers */
+		igt_debug("Decompression verification failed - showing short dumps\n");
+		print_buffer_data(mapped_ptr, min_t(size_t, 256, size), "CURRENT_STATE", 4);
+		print_buffer_data(src_ptr, min_t(size_t, 256, src->size), "EXPECTED", 4);
+	}
+
+	munmap(mapped_data, size);
+
+	igt_debug("Step 5: Cleaning up resources...\n");
+	/* Unmap the VM binding */
+	unmap_result = __xe_vm_bind(xe, vm, 0, 0, 0, vm_map_addr, map_size,
+				    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+
+	if (unmap_result != 0)
+		igt_warn("VM unmap failed: %d (%s)", unmap_result, strerror(errno));
+
+	/* Remove address mappings from allocator */
+	put_offset(ahnd, src->handle);
+	put_offset(ahnd, compressed->handle);
+	put_offset(ahnd, bb);
+	intel_allocator_bind(ahnd, 0, 0);
+	blt_destroy_object(xe, src);
+	blt_destroy_object(xe, compressed);
+	gem_close(xe, bb);
+	xe_vm_destroy(xe, vm);
+
+	/* SUCCESS: Test only passes if decompression occurred */
+	if (!pattern_matches)
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
+	struct drm_xe_gem_mmap_offset mmap_offset = {};
+	struct drm_xe_exec exec = {};
+	struct drm_xe_sync exec_sync;
+	struct blt_block_copy_data_ext ext = {};
+	struct blt_copy_data blt = {};
+	struct blt_copy_object *compressed, *src;
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	const uint64_t vm_alignment = xe_get_default_alignment(xe);
+	u32 devid = intel_get_drm_devid(xe);
+	u8 uc_mocs = intel_get_uc_mocs_index(xe);
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u64 size = (u64)width * height * 4;
+	intel_ctx_t *fault_ctx = NULL;
+	const size_t ufence_bo_size = SZ_4K;
+	void *mapped_data = MAP_FAILED;
+	uint64_t *ufence_map = NULL;
+	u64 fault_ahnd = 0;
+	u64 cmd_vm_addr = 0;
+	u64 ufence_vm_addr = 0;
+	u32 *mapped_ptr = NULL;
+	u32 *cmd = MAP_FAILED;
+	const u32 bpp = 32;
+	void *src_ptr;
+	int unmap_result = 0;
+	int exec_result = -1;
+	u32 fault_exec_queue = 0;
+	u32 ufence_bo = 0;
+	u32 cmd_bo = 0;
+	u32 uncompressed_pat;
+	u32 comp_pat;
+	u64 vm_map_addr;
+	u32 map_size;
+	u32 vm;
+	u32 bb;
+	bool is_compressed = false;
+	bool pattern_matches = false;
+	int result;
+
+	/* VM_BIND decompression requires XE2+ (Gen 20+) */
+	igt_require(intel_gen(devid) >= 20);
+	igt_require(config->compression);
+	igt_require(blt_uses_extended_block_copy(xe));
+	igt_require(blt_platform_has_flat_ccs_enabled(xe));
+
+	/* PAT index for uncompressed memory access */
+	uncompressed_pat = intel_get_pat_idx_uc(xe);
+	comp_pat = intel_get_pat_idx_uc_comp(xe);
+
+	/* Create FAULT_MODE VM (requires LR_MODE) for VM_BIND operation */
+	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm > 0);
+
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	blt_copy_init(xe, &blt);
+
+	igt_debug("Step 1: Creating source buffer with test pattern...\n");
+	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
+				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
+	src_ptr = src->ptr;
+
+	fill_buffer_simple_pattern(src_ptr, src->size);
+	igt_assert_f(verify_test_pattern(src_ptr, src->size, "SOURCE"),
+		     "Source pattern verification failed");
+
+	igt_debug("Original source data (first 64 bytes):\n");
+	print_buffer_data(src_ptr, 64, "ORIGINAL", 4);
+
+	igt_debug("Step 2: Compressing data using GPU...\n");
+	compressed = blt_create_object(&blt, region2, width, height, bpp, uc_mocs,
+				       tiling, COMPRESSION_ENABLED, comp_type, true);
+
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
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Verify compression occurred */
+	is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, compressed);
+	igt_assert_f(is_compressed, "Surface compression failed - cannot test decompression");
+
+	igt_debug("Compressed data before VM_BIND (first 64 bytes):\n");
+	print_buffer_data(compressed->ptr, 64, "COMPRESSED", 4);
+
+	igt_debug("Step 3: Testing VM_BIND with DECOMPRESS flag in FAULT_MODE...\n");
+	/* VM_BIND operation parameters */
+	vm_map_addr = ALIGN(0x40000, 4096);
+	map_size = ALIGN(size, xe_get_default_alignment(xe));
+
+	/* Create the mapping first; do a separate update to change PAT/flags below */
+	result = __xe_vm_bind(xe, vm, 0, compressed->handle, 0, vm_map_addr, map_size,
+			      DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0, comp_pat, 0);
+	igt_assert_eq(result, 0);
+
+	/* Execute VM_BIND ioctl and request decompression */
+	result = __xe_vm_bind(xe, vm, 0, compressed->handle, 0, vm_map_addr, map_size,
+			      DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_DECOMPRESS,
+			      NULL, 0, 0, uncompressed_pat, 0);
+	if (result != 0) {
+		igt_assert_f(false, "VM_BIND with DECOMPRESS flag failed: %d (%s)",
+			     result, strerror(errno));
+	}
+
+	igt_debug("Step 4: Triggering page fault to activate decompression...\n");
+	/* Create execution context with FAULT_MODE VM */
+	fault_exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+	fault_ctx = intel_ctx_xe(xe, vm, fault_exec_queue, 0, 0, 0);
+	fault_ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+
+	/* Create small command buffer that writes to vm_map_addr to trigger page fault */
+	cmd_bo = xe_bo_create(xe, 0, bb_size, region1, 0);
+	cmd = xe_bo_map(xe, cmd_bo, bb_size);
+
+	cmd_vm_addr = ALIGN(vm_map_addr + map_size, vm_alignment);
+	ufence_vm_addr = ALIGN(cmd_vm_addr + bb_size, vm_alignment);
+	ufence_bo = xe_bo_create_caching(xe, 0, ufence_bo_size,
+					 system_memory(xe), 0,
+					 DRM_XE_GEM_CPU_CACHING_WC);
+	ufence_map = xe_bo_map(xe, ufence_bo, ufence_bo_size);
+	igt_assert(ufence_map && ufence_map != MAP_FAILED);
+	memset(ufence_map, 0, ufence_bo_size);
+
+	/* LR-mode VMs forbid signal syncs on bind, so use direct binds instead. */
+	result = __xe_vm_bind(xe, vm, 0, cmd_bo, 0, cmd_vm_addr, bb_size,
+			      DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			      DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(result, 0);
+	result = __xe_vm_bind(xe, vm, 0, ufence_bo, 0, ufence_vm_addr,
+			      ufence_bo_size, DRM_XE_VM_BIND_OP_MAP, 0,
+			      NULL, 0, 0, DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(result, 0);
+	ufence_map[0] = 0;
+
+	/* Use MI_STORE_DWORD_IMM_GEN4 to write to mapped address */
+	cmd[0] = MI_STORE_DWORD_IMM_GEN4;
+	cmd[1] = lower_32_bits(vm_map_addr);
+	cmd[2] = upper_32_bits(vm_map_addr);
+	cmd[3] = 0xDEADBEEF;
+	cmd[4] = MI_BATCH_BUFFER_END;
+
+	/* Properly initialize exec structure */
+	memset(&exec, 0, sizeof(exec));
+	exec.exec_queue_id = fault_exec_queue;
+	exec.address = cmd_vm_addr;
+	exec.num_batch_buffer = 1;
+	exec.extensions = 0;
+
+	memset(&exec_sync, 0, sizeof(exec_sync));
+	exec_sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	exec_sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	exec_sync.addr = ufence_vm_addr;
+	exec_sync.timeline_value = 1ULL;
+	exec.num_syncs = 1;
+	exec.syncs = to_user_pointer(&exec_sync);
+
+	exec_result = igt_ioctl(xe, DRM_IOCTL_XE_EXEC, &exec);
+
+	if (exec_result != 0) {
+		igt_warn("EXEC ioctl failed: %d (%s) - continuing to verification\n",
+			 exec_result, strerror(errno));
+	} else {
+		xe_wait_ufence(xe, ufence_map, 1ULL,
+			       fault_exec_queue, NSEC_PER_SEC);
+		igt_assert_eq_u64(ufence_map[0], 1ULL);
+	}
+
+	result = __xe_vm_bind(xe, vm, 0, 0, 0, cmd_vm_addr, bb_size,
+			      DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+	igt_assert_eq(result, 0);
+	result = __xe_vm_bind(xe, vm, 0, 0, 0, ufence_vm_addr, ufence_bo_size,
+			      DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+	igt_assert_eq(result, 0);
+
+	munmap(ufence_map, ufence_bo_size);
+	gem_close(xe, ufence_bo);
+
+	/* Cleanup fault test resources */
+	munmap(cmd, bb_size);
+	gem_close(xe, cmd_bo);
+	put_ahnd(fault_ahnd);
+	xe_exec_queue_destroy(xe, fault_exec_queue);
+	free(fault_ctx);
+
+	igt_debug("Step 5: Verifying decompression by checking buffer data...\n");
+	/* Get mmap offset for the compressed buffer */
+	mmap_offset.handle = compressed->handle;
+	mmap_offset.flags = 0;
+
+	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
+	igt_assert_eq(result, 0);
+
+	/* Map the buffer for CPU access */
+	mapped_data = xe_bo_map(xe, compressed->handle, size);
+	igt_assert(mapped_data && mapped_data != MAP_FAILED);
+	mapped_ptr = (uint32_t *)mapped_data;
+
+	igt_debug("Buffer data after page fault handling (first 64 bytes):\n");
+	print_buffer_data(mapped_ptr, 64, "AFTER_FAULT", 4);
+
+	igt_debug("Checking if buffer contains decompressed data (original pattern)...\n");
+	pattern_matches = verify_test_pattern(mapped_ptr, size, "DECOMPRESSED");
+
+	if (pattern_matches) {
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
+	munmap(mapped_data, size);
+
+	igt_debug("Step 6: Cleaning up resources...\n");
+	/* Unmap the VM binding */
+	unmap_result = __xe_vm_bind(xe, vm, 0, 0, 0, vm_map_addr, map_size,
+				    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
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
+	if (!pattern_matches)
+		igt_assert_f(false,
+			     "TEST FAILED: Decompression did not occur during page fault handling");
+}
+
 enum copy_func {
 	BLOCK_COPY,
 	BLOCK_MULTICOPY,
@@ -685,6 +1251,7 @@ static void single_copy(int xe, const struct test_config *config,
 	uint32_t vm, exec_queue;
 	uint32_t sync_bind, sync_out;
 	intel_ctx_t *ctx;
+	u64 ahnd;
 
 	vm = xe_vm_create(xe, 0, 0);
 	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
@@ -693,10 +1260,24 @@ static void single_copy(int xe, const struct test_config *config,
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
@@ -969,6 +1550,33 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
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
+
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
+	}
+
 	igt_fixture() {
 		xe_device_put(xe);
 		close(xe);
-- 
2.50.1

