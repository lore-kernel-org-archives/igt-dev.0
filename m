Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C334BCFC28C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAF10E2BF;
	Fri, 21 Nov 2025 16:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdImZyL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C2910E2BF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763743881; x=1795279881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ARjc1TrGGAHwoLyhjCSd4QRBfdj0zsAZx4eO/59cfVg=;
 b=IdImZyL/tXUXu1GcFl1iJV41ZPhGRGh9VszZkesUwfc4tN0AX6n2xvIM
 Jl0sHF+/EMfaaT2Xgmq/g9XFb+5FTMC1RTM2u68/G4R4pWpdLFSoXwDoy
 Sb/SprwIHl++WG3aLT07myDrfinWL0LE+1ktBht30BSHWoGhnid5OJmU8
 HyFWEsvZQLJ9bC2UkkJII5KoBh++lG8A8tOidNRI173P0Jn4RSuL7WNIv
 pqnyXoUjG85ZnIBQh4JSZsEkjN2jF6HIV8/miTMyCShxSVkmqc7eB9TAw
 GB5MR7Sb+zM5HH/EVHixTJ+bSf4dgOI0bJ5V0tx+hEI4Tks5RRYGLnwnV w==;
X-CSE-ConnectionGUID: Cj6cTbsRSnq94vQQy4kISw==
X-CSE-MsgGUID: JyRoTvNXRvuGBs3aEW//DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69698738"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69698738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:51:20 -0800
X-CSE-ConnectionGUID: aMZxj8LfRNq6Zkj63ucz7A==
X-CSE-MsgGUID: MwApqxqGRzqNTzNJ8VHpiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196022568"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.53])
 ([10.245.245.53])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:51:19 -0800
Message-ID: <7a7e63d5-1b84-4c06-965c-080772de5eaa@intel.com>
Date: Fri, 21 Nov 2025 16:51:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic
 decompression tests
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20251114054037.1824150-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251114054037.1824150-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/11/2025 05:40, Nitin Gote wrote:
> Add new userspace uapi flag DRM_XE_VM_BIND_FLAG_DECOMPRESS to request a
> decompressed GPU view when mapping compressed BOs. These tests validate
> VM_BIND DECOMPRESS support. Corresponding KMD series:
> https://patchwork.freedesktop.org/series/154714/ (KMD patch required).
> 
> Add two tests to xe_ccs.c:
>   1. vm-bind-decompress:
>      - Map compressed BO with DECOMPRESS flag and verifies decompression.
>   2. vm-bind-fault-mode-decompress:
>      - Verifies decompression via the page_fault path in FAULT_MODE VMs.
> 
> Tests use the blitter to produce compressed surfaces and verify
> correctness via GPU operations; they also ensure allocator ordering
> to avoid implicit VM_BINDs that carry a signal (LR/FAULT mode).
> Requires XE2+ and compression support;
> Add small utilities (pattern fill, print, verify) used by tests.
> 
> v3: (Matthew Auld)
>    - Avoid manual edit in xe_drm.h, instead put change in
>      include/drm-uapi-experimental/intel_drm_local.h and after
>      official header is re-generated then drop this change.
>    - Add a comment to give idea about sparse pattern values
>    - Set pat_index to something well define before calling first
>      vm_bind ioctl.
>    - Nits
> 
> v2:
>      When unmapping a VM_BIND explicitly clear the DECOMPRESS flag
>      (bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>      to ensure the unmap/update operation is not interpreted as a
>      decompression request. This prevents the kernel from attempting
>      a decompress on an unmap.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Hi Matt,
> 
> In these tests, I have covered the positive scenarios.
> The IGT team is currently working on implementing the negative
> test cases for this feature.
> 
> -Nitin
> 
>   .../drm-uapi-experimental/intel_drm_local.h   |   2 +
>   tests/intel/xe_ccs.c                          | 622 +++++++++++++++++-
>   2 files changed, 620 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> index b48c9e219..10cc011f7 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,6 +20,8 @@ extern "C" {
>    * clean these up when kernel uapi headers are sync'd.
>    */
>   
> +#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 7)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 61cf97d52..1b2ad8acd 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -11,6 +11,8 @@
>   #endif
>   #include <sys/ioctl.h>
>   #include <sys/time.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
>   #include <malloc.h>
>   #include "drm.h"
>   #include "igt.h"
> @@ -60,6 +62,12 @@
>    *
>    * SUBTEST: suspend-resume
>    * Description: Check flatccs data persists after suspend / resume (S0)
> + *
> + * SUBTEST: vm-bind-decompress
> + * Description: Validate VM_BIND with DECOMPRESS flag functionality
> + *
> + * SUBTEST: vm-bind-fault-mode-decompress
> + * Description: Validate VM_BIND with DECOMPRESS flag functionality in fault mode
>    */
>   
>   IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression on Xe");
> @@ -90,6 +98,8 @@ struct test_config {
>   	bool surfcopy;
>   	bool new_ctx;
>   	bool suspend_resume;
> +	bool vm_bind_decompress;
> +	bool vm_bind_fault_mode_decompress;
>   	int width_increment;
>   	int width_steps;
>   	int overwrite_width;
> @@ -104,6 +114,115 @@ struct test_config {
>   	if (param.write_png) \
>   		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
>   
> +/**
> + * verify_test_pattern() - Verify buffer contains expected test pattern
> + * @buffer: pointer to buffer data
> + * @size: buffer size in bytes
> + * @label: label for debug output
> + * @return: true if pattern is correct, false otherwise
> + */
> +static bool verify_test_pattern(const void *buffer, size_t size, const char *label)
> +{
> +	const u32 *buffer_u32 = (const u32 *)buffer;
> +	size_t num_u32_elements = size / sizeof(uint32_t);
> +	size_t errors = 0;
> +	size_t max_errors_to_show = 10;
> +
> +	igt_info("Verifying test pattern in %s buffer (%zu elements)...\n",
> +		 label, num_u32_elements);
> +
> +	for (size_t i = 0; i < num_u32_elements && errors < max_errors_to_show; i++) {
> +		/* Calculate expected value based on sparse pattern with many zeros */
> +		u32 expected;
> +
> +		switch (i & 0xf) {
> +		case 0:
> +			expected = 0xdeadbeef; break;
> +		case 4:
> +			expected = 0xefbed000; break;
> +		case 8:
> +			expected = 0x00cfe111; break;
> +		case 12:
> +			expected = 0x11e0f222; break;
> +		default:
> +			expected = 0x00000000; break;
> +		}
> +
> +		if (buffer_u32[i] != expected) {
> +			igt_info("Pattern mismatch at offset %zu: expected 0x%08X, found 0x%08X\n",
> +				 i * sizeof(uint32_t), expected, buffer_u32[i]);
> +			errors++;
> +		}
> +	}
> +
> +	if (errors == 0) {
> +		igt_info("Pattern verification SUCCESS for %s buffer - all %zu elements correct\n",
> +			 label, num_u32_elements);
> +		return true;
> +	}
> +
> +	igt_info("Pattern verification FAILED for %s buffer - %zu errors found%s\n",
> +		 label, errors, errors >= max_errors_to_show ? " (truncated)" : "");
> +	return false;
> +}
> +
> +/**
> + * print_buffer_data() - Print buffer data in hex format for debugging
> + * @data: pointer to buffer data
> + * @size: buffer size in bytes
> + * @label: label to identify the data (e.g., "BEFORE", "AFTER")
> + * @max_lines: maximum number of lines to print (each line = 16 bytes)
> + */
> +static void print_buffer_data(const void *data, size_t size, const char *label, int max_lines)
> +{
> +	const u8 *bytes = (const uint8_t *)data;
> +	size_t lines_to_print = min((size + 15) / 16, (size_t)max_lines);
> +	size_t i, j;
> +
> +	igt_info("Buffer Data [%s] (showing first %zu lines, %zu bytes each):\n",
> +		 label, lines_to_print, min(size, lines_to_print * 16));
> +
> +	for (i = 0; i < lines_to_print && i * 16 < size; i++) {
> +		igt_info("%s [%04zx]: ", label, i * 16);
> +
> +		/* Print hex bytes */
> +		for (j = 0; j < 16 && (i * 16 + j) < size; j++)
> +			igt_info("%02x ", bytes[i * 16 + j]);
> +
> +		/* Pad if last line is incomplete */
> +		for (; j < 16; j++)
> +			igt_info("   ");
> +
> +		igt_info("\n");
> +	}
> +
> +	if (size > lines_to_print * 16)
> +		igt_info("%s [...] (%zu more bytes not shown)\n",
> +			 label, size - lines_to_print * 16);

Should these be igt_debug() ?

> +}
> +
> +/* Simple helper to fill buffer with a more compressible pattern */
> +static void fill_buffer_simple_pattern(void *ptr, size_t size)
> +{
> +	u32 *buffer = (uint32_t *)ptr;
> +	size_t num_elements = size / sizeof(uint32_t);
> +	size_t i;
> +
> +	/* Sparse pattern chosen to produce highly compressible data;
> +	 * non‑zero sentinels every 16 dwords (0xDEADBEEF, ..)
> +	 * ensure we aren’t relying on clear-zero CCS encoding.
> +	 */

Out of curiosity I tried this locally on BMG and looks to be working as 
expected (in terms of non-clear-zero encoding).

> +	for (i = 0; i < num_elements; i += 16) {
> +		buffer[i] = 0xdeadbeef;
> +		if (i + 4 < num_elements)
> +			buffer[i + 4] = 0xefbed000;
> +		if (i + 8 < num_elements)
> +			buffer[i + 8] = 0x00cfe111;
> +		if (i + 12 < num_elements)
> +			buffer[i + 12] = 0x11e0f222;
> +	}
> +}
> +
>   static void surf_copy(int xe,
>   		      intel_ctx_t *ctx,
>   		      uint64_t ahnd,
> @@ -654,6 +773,460 @@ static void block_copy_large(int xe,
>   	igt_assert_f(result, "ccs data must have no zeros!\n");
>   }
>   
> +/**
> + * vm_bind_decompress_test()
> + *
> + * This test validates the VM_BIND with DECOMPRESS flag:
> + * 1. Create source data with known pattern
> + * 2. Compress data using GPU blit engine
> + * 3. Use VM_BIND_OP_MAP_DECOMPRESS to test in-place decompression
> + * 4. Verify API functionality
> + * 5. Test data integrity before/after VM_BIND operations
> + *
> + * SUCCESS: Decompressed data must match original source pattern
> + * FAILURE: Any other outcome results in test failure
> + */
> +static void vm_bind_decompress_test(int xe,
> +				    intel_ctx_t *ctx,
> +				    u64 ahnd,
> +				    u32 region1,
> +				    u32 region2,
> +				    u32 width,
> +				    u32 height,
> +				    enum blt_tiling_type tiling,
> +				    const struct test_config *config)
> +{
> +	struct drm_xe_vm_bind bind_args = {};
> +	struct drm_xe_gem_mmap_offset mmap_offset = {};
> +	struct blt_copy_data blt = {};
> +	struct blt_block_copy_data_ext ext = {};
> +	struct blt_copy_object *compressed, *src;
> +	const u32 bpp = 32;
> +	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> +	u64 bb_size = xe_bb_size(xe, SZ_4K);
> +	u64 vm_map_addr;
> +	u64 size = width * height * 4;
> +	u32 map_size;
> +	u32 uncompressed_pat;
> +	u32 vm;
> +	u32 bb;
> +	u32 devid = intel_get_drm_devid(xe);
> +	u8 uc_mocs = intel_get_uc_mocs_index(xe);
> +	void *mapped_data = MAP_FAILED;
> +	void *src_ptr;
> +	u32 *mapped_ptr = NULL;
> +	int result, unmap_result = 0;
> +	bool pattern_matches = false;
> +
> +	/* VM_BIND decompression requires XE2+ (Gen 20+) */
> +	igt_require(intel_gen(devid) >= 20);
> +	igt_require(config->compression);
> +	igt_require(blt_uses_extended_block_copy(xe));
> +
> +	/* PAT index for uncompressed memory access */
> +	uncompressed_pat = intel_get_pat_idx_uc(xe);
> +
> +	vm = xe_vm_create(xe, 0, 0);
> +	igt_assert(vm > 0);
> +
> +	bb = xe_bo_create(xe, 0, bb_size, region1,
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	igt_assert(bb > 0);
> +	blt_copy_init(xe, &blt);
> +
> +	igt_debug("Step 1: Creating source buffer with test pattern...\n");
> +	src = blt_create_object(&blt, region1, width, height,
> +				bpp, uc_mocs, T_LINEAR, COMPRESSION_DISABLED,
> +				comp_type, true);
> +
> +	src_ptr = src->ptr;
> +	igt_assert(src && src->ptr);
> +
> +	fill_buffer_simple_pattern(src_ptr, src->size);
> +	igt_assert_f(verify_test_pattern(src_ptr, src->size, "SOURCE"),
> +		     "Source pattern verification failed");
> +
> +	igt_debug("Original source data (first 64 bytes):\n");
> +	print_buffer_data(src_ptr, 64, "ORIGINAL", 4);
> +
> +	igt_debug("Step 2: Compressing data using GPU...\n");
> +	compressed = blt_create_object(&blt, region2, width, height,
> +				       bpp, uc_mocs, tiling, COMPRESSION_ENABLED,
> +				       comp_type, true);
> +	igt_assert(compressed);
> +
> +	/* Configure blit operation to compress source data into compressed buffer */
> +	blt.color_depth = CD_32bit;
> +	blt.print_bb = param.print_bb;
> +
> +	/* Set source and destination objects for the blit operation */
> +	blt_set_copy_object(&blt.src, src);
> +	blt_set_copy_object(&blt.dst, compressed);
> +
> +	/* Configure extended blit parameters for compression */
> +	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
> +
> +	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
> +	intel_ctx_xe_sync(ctx, true);
> +
> +	/* Verify compression occurred */
> +	if (blt_platform_has_flat_ccs_enabled(xe)) {
> +		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, compressed);
> +
> +		if (!is_compressed)
> +			igt_assert_f(false,
> +				     "Surface compression failed - cannot test decompression");
> +	}
> +
> +	igt_debug("Compressed data before VM_BIND (first 64 bytes):\n");
> +	print_buffer_data(compressed->ptr, 64, "COMPRESSED", 4);
> +
> +	igt_debug("Step 3: Testing VM_BIND with DECOMPRESS flag ...\n");
> +	/* VM_BIND operation parameters */
> +	vm_map_addr = 0x30000000;
> +	map_size = ALIGN(size, xe_get_default_alignment(xe));
> +
> +	/* Configure the VM bind operation for decompression mapping */
> +	memset(&bind_args, 0, sizeof(bind_args));
> +	bind_args.vm_id = vm;
> +	bind_args.num_binds = 1;
> +	bind_args.bind.obj = compressed->handle;
> +	bind_args.bind.obj_offset = 0;
> +	bind_args.bind.range = map_size;
> +	bind_args.bind.addr = vm_map_addr;
> +	bind_args.bind.pat_index = intel_get_pat_idx_uc_comp(xe);
> +	bind_args.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +
> +	/* Create the mapping first; do a separate update to change PAT/flags below. */
> +	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
> +	igt_assert_eq(result, 0);
> +
> +	/* Update the existing mapping to request a decompressed GPU view */
> +	bind_args.bind.pat_index = uncompressed_pat;
> +	bind_args.bind.flags = DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +
> +	/* Execute VM_BIND ioctl */
> +	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
> +	if (result != 0)
> +		igt_assert_f(false, "VM_BIND with DECOMPRESS flag failed: %d (%s)",
> +			     result, strerror(errno));
> +
> +	igt_debug("Step 4: Verifying decompression by checking buffer data...\n");
> +	/* Get mmap offset for the compressed buffer */
> +	mmap_offset.handle = compressed->handle;
> +	mmap_offset.flags = 0;
> +
> +	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
> +	igt_assert_eq(result, 0);
> +
> +	/* Map the buffer for CPU access */
> +	mapped_data = mmap(NULL, size, PROT_READ, MAP_SHARED, xe, mmap_offset.offset);
> +	igt_assert(mapped_data != MAP_FAILED);

There is xe_bo_map() lib function for this.

> +
> +	mapped_ptr = (uint32_t *)mapped_data;
> +
> +	igt_debug("Buffer data after page fault handling (first 64 bytes):\n");
> +	print_buffer_data(mapped_ptr, 64, "AFTER_FAULT", 4);
> +
> +	/* Verify that the buffer now contains the original test pattern */
> +	igt_debug("Checking if buffer contains decompressed data (original pattern)...\n");
> +	pattern_matches = verify_test_pattern(mapped_ptr, size, "DECOMPRESSED");
> +
> +	if (pattern_matches) {
> +		igt_info("SUCCESS: Buffer contains original test pattern!\n");
> +		igt_debug("Data verification successful:\n");
> +	} else {
> +		/* provide concise diagnostics for reviewers */
> +		igt_debug("Decompression verification failed - showing short dumps\n");
> +		print_buffer_data(mapped_ptr, min_t(size_t, 256, size), "CURRENT_STATE", 4);
> +		print_buffer_data(src_ptr, min_t(size_t, 256, src->size), "EXPECTED", 4);
> +	}
> +
> +	munmap(mapped_data, size);
> +
> +	igt_debug("Step 5: Cleaning up resources...\n");
> +	/* Unmap the VM binding */
> +	bind_args.bind.op = DRM_XE_VM_BIND_OP_UNMAP;
> +	bind_args.bind.obj = 0;
> +	bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +
> +	unmap_result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);

I think there is a lib function for this. Or is there some reason for 
not using it? Elsewhere also.

> +	if (unmap_result != 0)
> +		igt_warn("VM unmap failed: %d (%s)", unmap_result, strerror(errno));
> +
> +	/* Remove address mappings from allocator */
> +	put_offset(ahnd, src->handle);
> +	put_offset(ahnd, compressed->handle);
> +	put_offset(ahnd, bb);
> +	intel_allocator_bind(ahnd, 0, 0);
> +	blt_destroy_object(xe, src);
> +	blt_destroy_object(xe, compressed);
> +	gem_close(xe, bb);
> +	xe_vm_destroy(xe, vm);
> +
> +	/* SUCCESS: Test only passes if decompression occurred */
> +	if (!pattern_matches)
> +		igt_assert_f(false, "TEST FAILED: Decompression did not occurred");
> +}
> +
> +/**
> + * vm_bind_fault_mode_decompress_test()
> + *
> + * This test validates that VM_BIND with DECOMPRESS flag triggers actual decompression
> + * when a page fault occurs in FAULT_MODE VMs. Success is determined by comparing
> + * decompressed data with the original source pattern.
> + *
> + * SUCCESS: Decompressed data must match original source pattern
> + * FAILURE: Any other outcome results in test failure
> + */
> +static void vm_bind_fault_mode_decompress_test(int xe,
> +					       intel_ctx_t *ctx,
> +					       u64 ahnd,
> +					       u32 region1,
> +					       u32 region2,
> +					       u32 width,
> +					       u32 height,
> +					       enum blt_tiling_type tiling,
> +					       const struct test_config *config)
> +{
> +	struct drm_xe_vm_bind bind_args = {};
> +	struct drm_xe_gem_mmap_offset mmap_offset = {};
> +	struct drm_xe_exec exec = {};
> +	struct blt_block_copy_data_ext ext = {};
> +	struct blt_copy_data blt = {};
> +	struct blt_copy_object *compressed, *src;
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +	const u32 bpp = 32;
> +	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> +	u64 bb_size = xe_bb_size(xe, SZ_4K);
> +	u64 vm_map_addr;
> +	u64 size = (u64)width * height * 4;
> +	u32 map_size;
> +	u32 uncompressed_pat;
> +	u32 vm;
> +	u32 bb;
> +	u32 devid = intel_get_drm_devid(xe);
> +	u8 uc_mocs = intel_get_uc_mocs_index(xe);
> +	void *mapped_data = MAP_FAILED;
> +	void *src_ptr;
> +	u32 *mapped_ptr = NULL;
> +	u32 *cmd = MAP_FAILED;
> +	u64 fault_ahnd = 0;
> +	u32 fault_exec_queue = 0;
> +	u32 cmd_bo = 0;
> +	int unmap_result = 0;
> +	int exec_result = -1;
> +	int result;
> +	bool pattern_matches = false;
> +	intel_ctx_t *fault_ctx = NULL;
> +
> +	/* VM_BIND decompression requires XE2+ (Gen 20+) */
> +	igt_require(intel_gen(devid) >= 20);
> +	igt_require(config->compression);
> +	igt_require(blt_uses_extended_block_copy(xe));

I think needs special handling for igpu now? We could add a query flag 
with the kmd patch, which UMD might prefer to know if DECOMP flag is 
supported or not, and that might make this silighly nicer. Also it is 
more reliable when mixing new IGT and older KMD, where it will just 
gracefully skip or whatever.

> +
> +	/* PAT index for uncompressed memory access */
> +	uncompressed_pat = intel_get_pat_idx_uc(xe);
> +
> +	/* Create FAULT_MODE VM (requires LR_MODE) for VM_BIND operation */
> +	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	igt_assert(vm > 0);
> +
> +	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	igt_assert(bb > 0);

I think you can drop this assert.  It should already assert if something 
goes wrong. If this is genuinly something extra we need, we should 
rather add to the lib.

> +	blt_copy_init(xe, &blt);
> +
> +	igt_debug("Step 1: Creating source buffer with test pattern...\n");
> +	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
> +				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> +	igt_assert(src && src->ptr);

Same here. I think this will trigger an assert in blt_create_object.

> +	src_ptr = src->ptr;
> +	igt_assert(src && src->ptr);

Here also.

> +
> +	fill_buffer_simple_pattern(src_ptr, src->size);
> +	igt_assert_f(verify_test_pattern(src_ptr, src->size, "SOURCE"),
> +		     "Source pattern verification failed");
> +
> +	igt_debug("Original source data (first 64 bytes):\n");
> +	print_buffer_data(src_ptr, 64, "ORIGINAL", 4);
> +
> +	igt_debug("Step 2: Compressing data using GPU...\n");
> +	compressed = blt_create_object(&blt, region2, width, height, bpp, uc_mocs,
> +				       tiling, COMPRESSION_ENABLED, comp_type, true);
> +	igt_assert(compressed);

Ditto.

> +	blt.color_depth = CD_32bit;
> +	blt.print_bb = param.print_bb;
> +
> +	/* Set source and destination objects for the blit operation */
> +	blt_set_copy_object(&blt.src, src);
> +	blt_set_copy_object(&blt.dst, compressed);
> +
> +	/* Configure extended blit parameters for compression */
> +	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
> +
> +	blt_set_batch(&blt.bb, bb, bb_size, region1);
> +	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
> +	intel_ctx_xe_sync(ctx, true);
> +
> +	/* Verify compression occurred */
> +	if (blt_platform_has_flat_ccs_enabled(xe)) {

I think some newer dgpu platform are missing compression support, but 
the vm_bind is rejected with the new flag, so I don't thik this check 
can ever be false. Or if it can I think something will blow up? I think 
ideally just handle all the platforms at the beginning and skip the test 
where the flag is going to be rejected?

> +		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, compressed);
> +
> +		if (!is_compressed)
> +			igt_assert_f(false,
> +				     "Surface compression failed - cannot test decompression");
> +	}
> +
> +	igt_debug("Compressed data before VM_BIND (first 64 bytes):\n");
> +	print_buffer_data(compressed->ptr, 64, "COMPRESSED", 4);
> +
> +	igt_debug("Step 3: Testing VM_BIND with DECOMPRESS flag in FAULT_MODE...\n");
> +	/* VM_BIND operation parameters */
> +	vm_map_addr = ALIGN(0x40000, 4096);
> +	map_size = ALIGN(size, xe_get_default_alignment(xe));
> +
> +	/* Configure VM_BIND operation */
> +	memset(&bind_args, 0, sizeof(bind_args));
> +	bind_args.vm_id = vm;
> +	bind_args.num_binds = 1;
> +	bind_args.bind.obj = compressed->handle;
> +	bind_args.bind.obj_offset = 0;
> +	bind_args.bind.range = map_size;
> +	bind_args.bind.addr = vm_map_addr;
> +	bind_args.bind.pat_index = intel_get_pat_idx_uc_comp(xe);
> +	bind_args.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +
> +	/* Ensure no syncobj/signal usage in LR/FAULT mode */
> +	bind_args.num_syncs = 0;
> +	bind_args.syncs = 0;
> +	bind_args.extensions = 0;
> +
> +	/* Create the mapping first; do a separate update to change PAT/flags below */
> +	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
> +	igt_assert_eq(result, 0);

I think there is a vm_bind lib function, which might be cleaner than 
directly open coding the ioctl.

> +
> +	/* Update the existing mapping to request a decompressed GPU view */
> +	bind_args.bind.pat_index = uncompressed_pat;
> +	bind_args.bind.flags = DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +
> +	/* Execute VM_BIND ioctl */
> +	result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);
> +	if (result != 0) {
> +		igt_assert_f(false, "VM_BIND with DECOMPRESS flag failed: %d (%s)",
> +			     result, strerror(errno));
> +	}
> +
> +	igt_debug("Step 4: Triggering page fault to activate decompression...\n");
> +	/* Create execution context with FAULT_MODE VM */
> +	fault_exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> +	fault_ctx = intel_ctx_xe(xe, vm, fault_exec_queue, 0, 0, 0);
> +	fault_ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
> +
> +	/* Create small command buffer that writes to vm_map_addr to trigger page fault */
> +	cmd_bo = xe_bo_create(xe, 0, 4096, region1, 0);

For bb stuff prefer, bb_size = xe_bb_size(fd, SZ_4K) for the sizing. 
Since that will account for the worst case overfetch, which has a habit 
of changing platform to platform. Actually I think you already have that 
defined somewhere, but just not using it here.

> +	cmd = xe_bo_map(xe, cmd_bo, 4096);
> +	igt_assert(cmd && cmd != MAP_FAILED);

Already asserted by the lib, I think.

> +
> +	/* Use MI_STORE_DWORD_IMM to write to mapped address */
> +	cmd[0] = 0x00000000;

Do we need this?

> +	cmd[1] = MI_STORE_DWORD_IMM | (1 << 22);
> +	cmd[2] = (uint32_t)(vm_map_addr);
> +	cmd[3] = (uint32_t)(vm_map_addr >> 32);
> +	cmd[4] = 0xDEADBEEF;
> +	cmd[5] = MI_BATCH_BUFFER_END;
> +
> +	/* Properly initialize exec structure */
> +	memset(&exec, 0, sizeof(exec));
> +	exec.exec_queue_id = fault_exec_queue;
> +	exec.address = get_offset(fault_ahnd, cmd_bo, 4096, 0);
> +	exec.num_batch_buffer = 1;
> +	exec.num_syncs = 0;
> +	exec.syncs = 0;
> +	exec.num_syncs = 0;
> +	exec.extensions = 0;
> +
> +	exec_result = igt_ioctl(xe, DRM_IOCTL_XE_EXEC, &exec);
> +	if (exec_result != 0) {
> +		igt_warn("EXEC ioctl failed: %d (%s) - continuing to verification\n",
> +			 exec_result, strerror(errno));
> +	} else {
> +		/*
> +		 * Wait for GPU submission that used fault_ctx to
> +		 * finish so page-fault handling completes
> +		 */
> +		usleep(10000);

I think proper ufence is maybe better here.

> +	}
> +
> +	/* Cleanup fault test resources */
> +	if (cmd && cmd != MAP_FAILED)

I think this can be dropped.

> +		munmap(cmd, 4096);
> +	gem_close(xe, cmd_bo);
> +	put_ahnd(fault_ahnd);
> +	xe_exec_queue_destroy(xe, fault_exec_queue);
> +	free(fault_ctx);
> +
> +	igt_debug("Step 5: Verifying decompression by checking buffer data...\n");
> +	/* Get mmap offset for the compressed buffer */
> +	mmap_offset.handle = compressed->handle;
> +	mmap_offset.flags = 0;
> +
> +	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
> +	igt_assert_eq(result, 0);
> +
> +	/* Map the buffer for CPU access */
> +	mapped_data = mmap(NULL, size, PROT_READ, MAP_SHARED, xe, mmap_offset.offset);
> +	igt_assert(mapped_data != MAP_FAILED);

xe_bo_map() ?

> +	mapped_ptr = (uint32_t *)mapped_data;
> +
> +	igt_debug("Buffer data after page fault handling (first 64 bytes):\n");
> +	print_buffer_data(mapped_ptr, 64, "AFTER_FAULT", 4);
> +
> +	igt_debug("Checking if buffer contains decompressed data (original pattern)...\n");
> +	pattern_matches = verify_test_pattern(mapped_ptr, size, "DECOMPRESSED");
> +
> +	if (pattern_matches) {
> +		igt_info("SUCCESS: Buffer contains original test pattern!\n");
> +		/* Show comparison */
> +		igt_debug("Data verification successful:\n");
> +	} else {
> +		/* provide concise diagnostics for reviewers */
> +		igt_debug("Decompression verification failed - showing short dumps\n");
> +		print_buffer_data(mapped_ptr, min_t(size_t, 256, size), "CURRENT_STATE", 4);
> +		print_buffer_data(src_ptr, min_t(size_t, 256, src->size), "EXPECTED", 4);
> +	}
> +
> +	munmap(mapped_data, size);
> +
> +	igt_debug("Step 6: Cleaning up resources...\n");
> +	/* Unmap the VM binding */
> +	bind_args.bind.op = DRM_XE_VM_BIND_OP_UNMAP;
> +	bind_args.bind.obj = 0;
> +	bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> +	unmap_result = igt_ioctl(xe, DRM_IOCTL_XE_VM_BIND, &bind_args);

lib function?

Otherwise I think looks good.

> +	if (unmap_result != 0)
> +		igt_warn("VM unmap failed: %d (%s)", unmap_result, strerror(errno));
> +
> +	/* Clean up memory resources */
> +	put_offset(ahnd, src->handle);
> +	put_offset(ahnd, compressed->handle);
> +	put_offset(ahnd, bb);
> +	intel_allocator_bind(ahnd, 0, 0);
> +	blt_destroy_object(xe, src);
> +	blt_destroy_object(xe, compressed);
> +	gem_close(xe, bb);
> +	xe_vm_destroy(xe, vm);
> +
> +	/* SUCCESS CRITERIA: Test only passes if decompression occurred */
> +	if (!pattern_matches)
> +		igt_assert_f(false,
> +			     "TEST FAILED: Decompression did not occur during page fault handling");
> +}
> +
>   enum copy_func {
>   	BLOCK_COPY,
>   	BLOCK_MULTICOPY,
> @@ -685,6 +1258,7 @@ static void single_copy(int xe, const struct test_config *config,
>   	uint32_t vm, exec_queue;
>   	uint32_t sync_bind, sync_out;
>   	intel_ctx_t *ctx;
> +	u64 ahnd;
>   
>   	vm = xe_vm_create(xe, 0, 0);
>   	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> @@ -693,10 +1267,24 @@ static void single_copy(int xe, const struct test_config *config,
>   	ctx = intel_ctx_xe(xe, vm, exec_queue,
>   			   0, sync_bind, sync_out);
>   
> -	copyfns[copy_function].copyfn(xe, ctx,
> -				      region1, region2,
> -				      width, height,
> -				      tiling, config);
> +	if (config->vm_bind_fault_mode_decompress) {
> +		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
> +		vm_bind_fault_mode_decompress_test(xe, ctx, ahnd,
> +						   region1, region2, width,
> +						   height, tiling, config);
> +		put_ahnd(ahnd);
> +	} else if (config->vm_bind_decompress) {
> +		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
> +		vm_bind_decompress_test(xe, ctx, ahnd,
> +					region1, region2, width,
> +					height, tiling, config);
> +		put_ahnd(ahnd);
> +	} else {
> +		copyfns[copy_function].copyfn(xe, ctx,
> +					      region1, region2,
> +					      width, height,
> +					      tiling, config);
> +	}
>   
>   	xe_exec_queue_destroy(xe, exec_queue);
>   	xe_vm_destroy(xe, vm);
> @@ -969,6 +1557,32 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>   		block_copy_test(xe, &config, set, BLOCK_COPY);
>   	}
>   
> +	igt_describe("Validate VM_BIND with DECOMPRESS flag functionality");
> +	igt_subtest("vm-bind-decompress") {
> +		struct test_config config = { .compression = true,
> +					      .vm_bind_decompress = true };
> +		u32 region1 = system_memory(xe);
> +		u32 region2 = vram_if_possible(xe, 0);
> +		int tiling = T_LINEAR;
> +		int width = param.width;
> +		int height = param.height;
> +
> +		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
> +	}
> +
> +	igt_describe("Validate VM_BIND with DECOMPRESS flag functionality in fault mode");
> +	igt_subtest("vm-bind-fault-mode-decompress") {
> +		struct test_config config = { .compression = true,
> +					      .vm_bind_fault_mode_decompress = true };
> +		u32 region1 = system_memory(xe);
> +		u32 region2 = vram_if_possible(xe, 0);
> +		int tiling = T_LINEAR;
> +		int width = param.width;
> +		int height = param.height;
> +
> +		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
> +	}
> +
>   	igt_fixture {
>   		xe_device_put(xe);
>   		close(xe);

