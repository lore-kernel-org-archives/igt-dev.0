Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF455D12694
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 10:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811FB10E12A;
	Wed,  3 Dec 2025 10:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrrR00o4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABD610E12A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764759174; x=1796295174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y/QJdzbm1DronflFKSrDAhdD0LUTvmHM1SlEwwRFPPs=;
 b=lrrR00o4G1fJ1fQyLEtWAYyerni0ggYo+wnk9M8BhcISDPZQZSUeBYzH
 qlVP1xnH2zJ2wbxlT4IKkz/F+/+uzrJf7Cy6mO3oeU63BgH76cTvEOcz5
 WjMFtEUYctmanEQS7rHB2icsbTa5ahdWvjvxqSAZE9jPoqMDAHUFMNX0l
 fhz3a7Eb+be9HM442gcM0+wreHWIbWMbeuI+MUJg0gpcCP7bvMnRRJwcr
 /QgQaQgg4euLGe88gxogJUxeXLTBdNyOjEXGOOfDSJ1MEOMLluVkhWG0d
 RTdRP9v5hxLsbOhr6lsGEFBOopP9toqzsewNMLgPqBFe8o5UvETS1BJdT g==;
X-CSE-ConnectionGUID: PSYVwBtMTtmwQ1xomknY/Q==
X-CSE-MsgGUID: zS5fhwbdTgKTYrdu4sJpLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78097216"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="78097216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 02:52:54 -0800
X-CSE-ConnectionGUID: ycg9L7D0T/uVx59y5owEow==
X-CSE-MsgGUID: 8GuW8uRNRNGxNXFKAHM64w==
X-ExtLoop1: 1
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 02:52:51 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.auld@intel.com
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic
 decompression tests
Date: Wed,  3 Dec 2025 16:53:20 +0530
Message-ID: <20251203112324.361315-2-nitin.r.gote@intel.com>
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

v4: (Matthew Auld)
  - Instead of mmap(), use xe_bo_map()
  - Use __xe_vm_bind() lib function
  - Add blt_platform_has_flat_ccs_enabled() check
    at the beginning
  - Remove unnecessary igt_assert
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
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi Matt,

Since you have tested this igt patch, I would like to add you
as Tested-by, if that’s okay with you.
Also, I intentionally kept igt_info() instead of igt_debug()
in print_buffer_data() to check and verify the decompressed data.
I have also addressed the other review comments in this version.

- Nitin


 .../drm-uapi-experimental/intel_drm_local.h   |   2 +
 tests/intel/xe_ccs.c                          | 575 +++++++++++++++++-
 2 files changed, 573 insertions(+), 4 deletions(-)

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
index 61cf97d52..338d42763 100644
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
@@ -654,6 +773,413 @@ static void block_copy_large(int xe,
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
+	struct blt_block_copy_data_ext ext = {};
+	struct blt_copy_data blt = {};
+	struct blt_copy_object *compressed, *src;
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	const u32 bpp = 32;
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u64 vm_map_addr;
+	u64 size = (u64)width * height * 4;
+	u32 map_size;
+	u32 uncompressed_pat;
+	u32 vm;
+	u32 bb;
+	u32 devid = intel_get_drm_devid(xe);
+	u8 uc_mocs = intel_get_uc_mocs_index(xe);
+	void *mapped_data = MAP_FAILED;
+	void *src_ptr;
+	u32 *mapped_ptr = NULL;
+	u32 *cmd = MAP_FAILED;
+	u64 fault_ahnd = 0;
+	u32 fault_exec_queue = 0;
+	u32 cmd_bo = 0;
+	u32 comp_pat;
+	int unmap_result = 0;
+	int exec_result = -1;
+	int result;
+	bool is_compressed = false;
+	bool pattern_matches = false;
+	intel_ctx_t *fault_ctx = NULL;
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
+
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
+	/* Use MI_STORE_DWORD_IMM to write to mapped address */
+	cmd[0] = MI_STORE_DWORD_IMM | (1 << 22);
+	cmd[1] = (uint32_t)(vm_map_addr);
+	cmd[2] = (uint32_t)(vm_map_addr >> 32);
+	cmd[3] = 0xDEADBEEF;
+	cmd[4] = MI_BATCH_BUFFER_END;
+
+	/* Properly initialize exec structure */
+	memset(&exec, 0, sizeof(exec));
+	exec.exec_queue_id = fault_exec_queue;
+	exec.address = get_offset(fault_ahnd, cmd_bo, bb_size, 0);
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
@@ -685,6 +1211,7 @@ static void single_copy(int xe, const struct test_config *config,
 	uint32_t vm, exec_queue;
 	uint32_t sync_bind, sync_out;
 	intel_ctx_t *ctx;
+	u64 ahnd;
 
 	vm = xe_vm_create(xe, 0, 0);
 	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
@@ -693,10 +1220,24 @@ static void single_copy(int xe, const struct test_config *config,
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
@@ -969,6 +1510,32 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
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

