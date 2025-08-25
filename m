Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC4ECA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 11:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39B10E255;
	Mon, 25 Aug 2025 11:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQG9H9AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED2A10E255
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756122330; x=1787658330;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=JoF5+uhoBC7F/olx1iOHZg8o7Aws8/D3TBfbkFLaAaQ=;
 b=iQG9H9AH85sGeqbVRWPlv55lw88wg341clOIfDUUFUrP4QxTImt8EwMX
 GmVdD0TeilElSWdiO/cK6ABBLJemIV/duIYDakFUGA+pkgxUDOrUNLMYf
 fNI6gBhxGvv2yxFSTGzbTDkMG8i05njdfjGBJZjbNX8OMNwgSkvYIsp6v
 QMKCWLR4eptXfKJCaBVL+2d77VROLlCsIMUqMHxb4qhxewbJhR1cvgvny
 uwbe+sXhr85bMc65kmfbEZy/le5hZFupBM094pxVS/3o6NDR/0RORXRWF
 xRoOasWBvyWdHdIhtlpErz36A7bdFIi+ca1H505IqLtJyKmZ/3VSCB/uV Q==;
X-CSE-ConnectionGUID: geUr2gReSQ6MGgpPbyprRw==
X-CSE-MsgGUID: hGUXeeW0TAuxq9CcONcHnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61974726"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="61974726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:45:29 -0700
X-CSE-ConnectionGUID: N4CDHNzETpOZ38uWRZ2UBQ==
X-CSE-MsgGUID: f5sJ9NdPRoS1FUsMv9LhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
 d="scan'208,217";a="168781469"
Received: from ksreedev-mobl.gar.corp.intel.com (HELO [10.247.251.121])
 ([10.247.251.121])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:45:26 -0700
Content-Type: multipart/alternative;
 boundary="------------0lh1XQKg5KkQI8WPfQe9xNWC"
Message-ID: <3ae36125-a6d1-46be-88d3-8ab65436aed7@intel.com>
Date: Mon, 25 Aug 2025 17:15:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v9,1/2] tests/kms_prime: Add XE support
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@gmail.com,
 anshuman.gupta@intel.com, matthew.auld@intel.com, kamil.konieczny@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Nidhi Gupta <nidhi1.gupta@intel.com>
References: <20250808112050.987926-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250808112050.987926-1-santhosh.reddy.guddati@intel.com>
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

This is a multi-part message in MIME format.
--------------0lh1XQKg5KkQI8WPfQe9xNWC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08-08-2025 16:50, Santhosh Reddy Guddati wrote:
> From: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>
> Add XE driver support for kms tests.
>
> V2: - Use rendercopy method for both i915 & xe
>      - Minor cleanup
> V3: - New patch for cleanup & rendercopy
> V4: - Fallback to blitter
> V5: - Rebase
> v7: - Rebase and patch cleanup
> v8: - D3hot subtest is not required for xe
> v9: - nitpicks (Matthew)
> v10:- Rebase
> v11:- Split the commits per subtest and refactor code (Kamil, Kunal)
>        - Enable basic-crc-hybrid subtest for xe.
>        - Added Xe Prime support for hybrid graphics by enabling
>          buffer sharing between integrated and discrete GPUs.
>        - Refactor buffer creation function for Xe discrete buffers.
>        - Introduced helper functions for creating and mapping dumb buffers.
>        	Also, implement fast buffer import for Xe discrete GPUs
> 	using BLT copy operations.
> v12: Fix CRC mismatch by using correct color depth constant.
>
> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta<nidhi1.gupta@intel.com>
> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_prime.c | 192 +++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 156 insertions(+), 36 deletions(-)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 1d011327c..c6720e984 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -34,10 +34,18 @@
>   #include "igt_debugfs.h"
>   #include "igt_sysfs.h"
>   #include <fcntl.h>
> +#include <limits.h>
>   
>   #include <poll.h>
>   #include <sys/ioctl.h>
>   #include <time.h>
> +#include "lib/intel_blt.h"
> +#include "lib/intel_common.h"
> +#include "lib/intel_pat.h"
> +#include "lib/intel_mocs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
>   
>   /**
>    * SUBTEST: D3hot
> @@ -117,10 +125,13 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
>   		igt_display_reset(display);
>   
>   		igt_output_set_pipe(output, *pipe);
> -		if (intel_pipe_output_combo_valid(display)) {
> -			found = true;
> -			break;
> +		if (is_intel_dgfx(importer_fd)) {
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
Is check no longer required for igpu?
>   		}
> +
> +		found = true;
> +		break;
>   	}
>   
>   	igt_require_f(found, "No valid connector/pipe found\n");
> @@ -128,24 +139,63 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
>   	return output;
>   }
>   
> +static uint32_t *create_and_map_dump_bo(int fd, struct dumb_bo *bo,
Typo dump -> dumb
> +					uint32_t width, uint32_t height,
> +					uint32_t bpp, uint32_t *pitch,
> +					uint64_t *size)
> +{
> +	uint32_t *ptr;
> +
> +	bo->width = width;
> +	bo->height = height;
> +	bo->bpp = bpp;
> +
> +	bo->handle = kmstest_dumb_create(fd, bo->width,
Why we don't align now?
previously bo->width = ALIGN(width, 256)
> +					 bo->height, bo->bpp, pitch, size);
> +
> +	ptr = kmstest_dumb_map_buffer(fd, bo->handle, *size, PROT_READ | PROT_WRITE);
> +	igt_assert(ptr != MAP_FAILED);
> +
> +	return ptr;
> +}
> +
> +static uint32_t *prepare_xe_dgfx_scratch(int exporter_fd, struct dumb_bo *scratch)
> +{
> +	uint32_t *ptr;
> +	struct blt_copy_data ex_blt = {};
> +	struct blt_copy_object *src = NULL;
> +	uint32_t region;
> +
> +	region = DRM_XE_MEM_REGION_CLASS_VRAM;
> +	igt_info("Preparing scratch buffer for DGfx exporter\n");
> +	blt_copy_init(exporter_fd, &ex_blt);
> +	src = blt_create_object(&ex_blt, region,
> +				scratch->width, scratch->height,
> +				scratch->bpp, 0, T_LINEAR,
> +				COMPRESSION_DISABLED, 0, true);
> +	scratch->handle = src->handle;
> +	scratch->size = src->size;
> +	scratch->pitch = src->pitch;
> +	ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle, scratch->size,
> +			     PROT_READ | PROT_WRITE);
> +	igt_assert(ptr != MAP_FAILED);
> +	return ptr;
> +}
> +
>   static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>   			    drmModeModeInfo *mode, uint32_t color)
>   {
>   	uint32_t *ptr;
> +	bool is_dgfx;
>   
>   	scratch->width = mode->hdisplay;
>   	scratch->height = mode->vdisplay;
>   	scratch->bpp = 32;
> +	is_dgfx = is_intel_dgfx(exporter_fd);
>   
> -	if (!is_i915_device(exporter_fd)) {
> -		scratch->handle = kmstest_dumb_create(exporter_fd,
> -						      ALIGN(scratch->width, 256),
> -						      scratch->height, scratch->bpp,
> -						      &scratch->pitch, &scratch->size);
> -
> -		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
> -					      scratch->size, PROT_WRITE);
> -	} else {
i915 iGPU patch changed to used dumb BO
> +	if (is_xe_device(exporter_fd) && is_dgfx) {
> +		ptr = prepare_xe_dgfx_scratch(exporter_fd, scratch);
> +	} else if (is_i915_device(exporter_fd) && is_dgfx) {
>   		struct igt_fb fb;
>   
>   		igt_init_fb(&fb, exporter_fd, mode->hdisplay, mode->vdisplay,
> @@ -165,6 +215,11 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>   
>   		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
>   						PROT_WRITE | PROT_READ);
> +	} else {
> +		ptr = create_and_map_dump_bo(exporter_fd, scratch,
> +					     scratch->width, scratch->height,
> +					     scratch->bpp, &scratch->pitch,
> +					     &scratch->size);
>   	}
>   
>   	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
> @@ -184,40 +239,109 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
>   }
>   
>   static void import_fb(int importer_fd, struct igt_fb *fb,
> -		      int dmabuf_fd, uint32_t pitch)
> +		      int dmabuf_fd, struct dumb_bo *scratch)
>   {
>   	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
>   	int ret;
>   
> -	if (is_i915_device(importer_fd)) {
> -		if (gem_has_lmem(importer_fd)) {
> -			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
> -			uint64_t fb_size = 0;
> +	igt_debug("Importing FB: importer_fd=%d, dmabuf_fd=%d, width=%u, height=%u\n",
> +		  importer_fd, dmabuf_fd, fb->width, fb->height);
>   
> -			igt_info("Importer is dGPU\n");
> -			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
> -			igt_assert(temp_buf_handle > 0);
> -			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
> -								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
> -			igt_assert(fb->gem_handle > 0);
> +	if (is_intel_dgfx(importer_fd)) {
> +		uint64_t fb_size = 0;
> +		uint64_t ahnd = 0;
> +
> +		igt_info("Importer is dGPU\n");
> +		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
> +		igt_assert(temp_buf_handle > 0);
> +		fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width,
> +							       fb->height, fb->drm_format,
> +							       fb->modifier, scratch->pitch,
> +							       &fb_size, NULL, NULL);
> +		igt_assert(fb->gem_handle > 0);
> +
> +		if (is_i915_device(importer_fd)) {
> +			ahnd = get_reloc_ahnd(importer_fd, 0);
>   
>   			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
> -					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
> -					     fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier,
> -					     0, 0, fb_size);
> +						 0, scratch->pitch, fb->modifier,
> +						 0, 0, fb_size, fb->width,
> +						 fb->height, 32, fb->gem_handle,
> +						 0, scratch->pitch, fb->modifier,
> +						 0, 0, fb_size);
>   
>   			gem_sync(importer_fd, fb->gem_handle);
>   			gem_close(importer_fd, temp_buf_handle);
>   			put_ahnd(ahnd);
> -		} else {
> -			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
> +		}  else if (is_xe_device(importer_fd)) {
> +			uint32_t xe_bb;
> +			struct blt_copy_data blt = {0};
> +			struct blt_copy_object *src, *dst;
> +			uint32_t vm, xe_exec;
> +			intel_ctx_t *xe_ctx;
> +
> +			struct drm_xe_engine_class_instance inst = {
> +				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +			};
> +
> +			vm = xe_vm_create(importer_fd, 0, 0);
> +			xe_exec = xe_exec_queue_create(importer_fd, vm, &inst, 0);
Close/Destroy temp_buf_handle, |vm and exec in xe path|
> +			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
> +			ahnd = intel_allocator_open_full(importer_fd, xe_ctx->vm, 0, 0,
> +							 INTEL_ALLOCATOR_SIMPLE,
> +							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +			igt_init_fb(fb, importer_fd, scratch->width, scratch->height,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +
> +			igt_calc_fb_size(fb);
Rely on caller (Already done in prepare_fb), can be removed
> +
> +			fb->gem_handle = xe_bo_create(importer_fd, 0, fb->size,
> +						      vram_if_possible(importer_fd, 0), 0);
> +			igt_require(fb->gem_handle);
> +
> +			blt_copy_init(importer_fd, &blt);
> +
> +			src = blt_create_object(&blt, vram_if_possible(importer_fd, 0),
> +						scratch->width, scratch->height, 32, 0,
> +						T_LINEAR, COMPRESSION_DISABLED, 0, true);
> +			blt_set_object(src, temp_buf_handle, scratch->size,
> +				       vram_if_possible(importer_fd, 0), 0,
> +				       DEFAULT_PAT_INDEX,
> +				       T_LINEAR, COMPRESSION_DISABLED, 0);
> +
> +			dst = blt_create_object(&blt, vram_if_possible(importer_fd, 0),
> +						scratch->width, scratch->height, 32, 0,
> +						T_LINEAR, COMPRESSION_DISABLED, 0, true);
> +			blt_set_object(dst, fb->gem_handle, fb->size,
> +				       vram_if_possible(importer_fd, 0), 0,
> +				       DEFAULT_PAT_INDEX,
> +				       T_LINEAR, COMPRESSION_DISABLED, 0);
> +
> +			blt.color_depth = CD_32bit;
> +			blt_set_copy_object(&blt.src, src);
> +			blt_set_copy_object(&blt.dst, dst);
> +
> +			xe_bb = xe_bo_create(importer_fd, 0, fb->size,
> +					     vram_if_possible(importer_fd, 0), 0);
> +
> +			blt_set_batch(&blt.bb, xe_bb, fb->size, vram_if_possible(importer_fd, 0));
> +			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &blt);
> +
> +			put_offset(ahnd, dst->handle);
> +			put_offset(ahnd, src->handle);
> +			put_offset(ahnd, xe_bb);
> +			intel_allocator_bind(ahnd, 0, 0);
> +			put_ahnd(ahnd);
>   		}
>   	} else {
>   		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
> +		igt_assert(fb->gem_handle > 0);
>   	}
>   
>   	handles[0] = fb->gem_handle;
> -	pitches[0] = pitch;
> +	pitches[0] = scratch->pitch;
>   	offsets[0] = 0;
>   
>   	ret = drmModeAddFB2(importer_fd, fb->width, fb->height,
> @@ -284,7 +408,7 @@ static void test_crc(int exporter_fd, int importer_fd)
>   		gem_close(exporter_fd, scratch.handle);
>   
>   		prepare_fb(importer_fd, &scratch, &fb);
> -		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
> +		import_fb(importer_fd, &fb, dmabuf_fd, &scratch);
>   		close(dmabuf_fd);
>   
>   		colors[i].prime_crc.name = "prime";
> @@ -475,6 +599,8 @@ igt_main
>   			igt_require(second_fd_vgem >= 0);
>   			if (is_i915_device(first_fd))
>   				igt_require(!gem_has_lmem(first_fd));
> +			if (is_xe_device(first_fd))
> +				igt_require(!xe_has_vram(first_fd));
>   		}
>   
>   		igt_describe("Make a dumb color buffer, export to another device and"
> @@ -485,11 +611,5 @@ igt_main
>   				igt_dynamic("second-to-first")
>   					test_crc(second_fd_vgem, first_fd);
>   		}
> -
> -		igt_fixture
> -			drm_close_driver(second_fd_vgem);
>   	}
> -
> -	igt_fixture
> -		drm_close_driver(first_fd);
>   }
Keep drm_close_driver(second_fd_vgem), drm_close_driver(first_fd)

Thanks and Regards
Kunal Joshi
--------------0lh1XQKg5KkQI8WPfQe9xNWC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-08-2025 16:50, Santhosh Reddy
      Guddati wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">From: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>

Add XE driver support for kms tests.

V2: - Use rendercopy method for both i915 &amp; xe
    - Minor cleanup
V3: - New patch for cleanup &amp; rendercopy
V4: - Fallback to blitter
V5: - Rebase
v7: - Rebase and patch cleanup
v8: - D3hot subtest is not required for xe
v9: - nitpicks (Matthew)
v10:- Rebase
v11:- Split the commits per subtest and refactor code (Kamil, Kunal)
      - Enable basic-crc-hybrid subtest for xe.
      - Added Xe Prime support for hybrid graphics by enabling
        buffer sharing between integrated and discrete GPUs.
      - Refactor buffer creation function for Xe discrete buffers.
      - Introduced helper functions for creating and mapping dumb buffers.
      	Also, implement fast buffer import for Xe discrete GPUs
	using BLT copy operations.
v12: Fix CRC mismatch by using correct color depth constant.

Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
Signed-off-by: Nidhi Gupta <a class="moz-txt-link-rfc2396E" href="mailto:nidhi1.gupta@intel.com">&lt;nidhi1.gupta@intel.com&gt;</a>
Signed-off-by: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
---
 tests/kms_prime.c | 192 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 156 insertions(+), 36 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1d011327c..c6720e984 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -34,10 +34,18 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include &lt;fcntl.h&gt;
+#include &lt;limits.h&gt;
 
 #include &lt;poll.h&gt;
 #include &lt;sys/ioctl.h&gt;
 #include &lt;time.h&gt;
+#include "lib/intel_blt.h"
+#include "lib/intel_common.h"
+#include "lib/intel_pat.h"
+#include "lib/intel_mocs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
 
 /**
  * SUBTEST: D3hot
@@ -117,10 +125,13 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, *pipe);
-		if (intel_pipe_output_combo_valid(display)) {
-			found = true;
-			break;</pre>
    </blockquote>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+		if (is_intel_dgfx(importer_fd)) {
+			if (!intel_pipe_output_combo_valid(display))
+				continue;</pre>
    </blockquote>
    Is check no longer required for igpu?
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
 		}
+
+		found = true;
+		break;
 	}
 
 	igt_require_f(found, "No valid connector/pipe found\n");
@@ -128,24 +139,63 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	return output;
 }
 
+static uint32_t *create_and_map_dump_bo(int fd, struct dumb_bo *bo,</pre>
    </blockquote>
    Typo dump -&gt; dumb
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+					uint32_t width, uint32_t height,
+					uint32_t bpp, uint32_t *pitch,
+					uint64_t *size)
+{
+	uint32_t *ptr;
+
+	bo-&gt;width = width;
+	bo-&gt;height = height;
+	bo-&gt;bpp = bpp;
+
+	bo-&gt;handle = kmstest_dumb_create(fd, bo-&gt;width,</pre>
    </blockquote>
    Why we don't align now?<br>
    previously bo-&gt;width = ALIGN(width, 256)
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+					 bo-&gt;height, bo-&gt;bpp, pitch, size);
+
+	ptr = kmstest_dumb_map_buffer(fd, bo-&gt;handle, *size, PROT_READ | PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
+
+	return ptr;
+}
+
+static uint32_t *prepare_xe_dgfx_scratch(int exporter_fd, struct dumb_bo *scratch)
+{
+	uint32_t *ptr;
+	struct blt_copy_data ex_blt = {};
+	struct blt_copy_object *src = NULL;
+	uint32_t region;
+
+	region = DRM_XE_MEM_REGION_CLASS_VRAM;
+	igt_info("Preparing scratch buffer for DGfx exporter\n");
+	blt_copy_init(exporter_fd, &amp;ex_blt);
+	src = blt_create_object(&amp;ex_blt, region,
+				scratch-&gt;width, scratch-&gt;height,
+				scratch-&gt;bpp, 0, T_LINEAR,
+				COMPRESSION_DISABLED, 0, true);
+	scratch-&gt;handle = src-&gt;handle;
+	scratch-&gt;size = src-&gt;size;
+	scratch-&gt;pitch = src-&gt;pitch;
+	ptr = xe_bo_mmap_ext(exporter_fd, scratch-&gt;handle, scratch-&gt;size,
+			     PROT_READ | PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
+	return ptr;
+}
+
 static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 			    drmModeModeInfo *mode, uint32_t color)
 {
 	uint32_t *ptr;
+	bool is_dgfx;
 
 	scratch-&gt;width = mode-&gt;hdisplay;
 	scratch-&gt;height = mode-&gt;vdisplay;
 	scratch-&gt;bpp = 32;
+	is_dgfx = is_intel_dgfx(exporter_fd);
 
-	if (!is_i915_device(exporter_fd)) {
-		scratch-&gt;handle = kmstest_dumb_create(exporter_fd,
-						      ALIGN(scratch-&gt;width, 256),
-						      scratch-&gt;height, scratch-&gt;bpp,
-						      &amp;scratch-&gt;pitch, &amp;scratch-&gt;size);
-
-		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch-&gt;handle,
-					      scratch-&gt;size, PROT_WRITE);
-	} else {</pre>
    </blockquote>
    i915 iGPU patch changed to used dumb BO
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+	if (is_xe_device(exporter_fd) &amp;&amp; is_dgfx) {
+		ptr = prepare_xe_dgfx_scratch(exporter_fd, scratch);
+	} else if (is_i915_device(exporter_fd) &amp;&amp; is_dgfx) {
 		struct igt_fb fb;
 
 		igt_init_fb(&amp;fb, exporter_fd, mode-&gt;hdisplay, mode-&gt;vdisplay,
@@ -165,6 +215,11 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
 		ptr = gem_mmap__device_coherent(exporter_fd, scratch-&gt;handle, 0, scratch-&gt;size,
 						PROT_WRITE | PROT_READ);
+	} else {
+		ptr = create_and_map_dump_bo(exporter_fd, scratch,
+					     scratch-&gt;width, scratch-&gt;height,
+					     scratch-&gt;bpp, &amp;scratch-&gt;pitch,
+					     &amp;scratch-&gt;size);
 	}
 
 	for (size_t idx = 0; idx &lt; scratch-&gt;size / sizeof(*ptr); ++idx)
@@ -184,40 +239,109 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 }
 
 static void import_fb(int importer_fd, struct igt_fb *fb,
-		      int dmabuf_fd, uint32_t pitch)
+		      int dmabuf_fd, struct dumb_bo *scratch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
 
-	if (is_i915_device(importer_fd)) {
-		if (gem_has_lmem(importer_fd)) {
-			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
-			uint64_t fb_size = 0;
+	igt_debug("Importing FB: importer_fd=%d, dmabuf_fd=%d, width=%u, height=%u\n",
+		  importer_fd, dmabuf_fd, fb-&gt;width, fb-&gt;height);
 
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle &gt; 0);
-			fb-&gt;gem_handle = igt_create_bo_with_dimensions(importer_fd, fb-&gt;width, fb-&gt;height,
-								       fb-&gt;drm_format, fb-&gt;modifier, pitch, &amp;fb_size, NULL, NULL);
-			igt_assert(fb-&gt;gem_handle &gt; 0);
+	if (is_intel_dgfx(importer_fd)) {
+		uint64_t fb_size = 0;
+		uint64_t ahnd = 0;
+
+		igt_info("Importer is dGPU\n");
+		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(temp_buf_handle &gt; 0);
+		fb-&gt;gem_handle = igt_create_bo_with_dimensions(importer_fd, fb-&gt;width,
+							       fb-&gt;height, fb-&gt;drm_format,
+							       fb-&gt;modifier, scratch-&gt;pitch,
+							       &amp;fb_size, NULL, NULL);
+		igt_assert(fb-&gt;gem_handle &gt; 0);
+
+		if (is_i915_device(importer_fd)) {
+			ahnd = get_reloc_ahnd(importer_fd, 0);
 
 			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
-					     0, pitch, fb-&gt;modifier, 0, 0, fb_size, fb-&gt;width,
-					     fb-&gt;height, 32, fb-&gt;gem_handle, 0, pitch, fb-&gt;modifier,
-					     0, 0, fb_size);
+						 0, scratch-&gt;pitch, fb-&gt;modifier,
+						 0, 0, fb_size, fb-&gt;width,
+						 fb-&gt;height, 32, fb-&gt;gem_handle,
+						 0, scratch-&gt;pitch, fb-&gt;modifier,
+						 0, 0, fb_size);
 
 			gem_sync(importer_fd, fb-&gt;gem_handle);
 			gem_close(importer_fd, temp_buf_handle);
 			put_ahnd(ahnd);
-		} else {
-			fb-&gt;gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		}  else if (is_xe_device(importer_fd)) {
+			uint32_t xe_bb;
+			struct blt_copy_data blt = {0};
+			struct blt_copy_object *src, *dst;
+			uint32_t vm, xe_exec;
+			intel_ctx_t *xe_ctx;
+
+			struct drm_xe_engine_class_instance inst = {
+				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			};
+
+			vm = xe_vm_create(importer_fd, 0, 0);
+			xe_exec = xe_exec_queue_create(importer_fd, vm, &amp;inst, 0);</pre>
    </blockquote>
    Close/Destroy temp_buf_handle, <code>vm and exec in xe path</code>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
+			ahnd = intel_allocator_open_full(importer_fd, xe_ctx-&gt;vm, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+			igt_init_fb(fb, importer_fd, scratch-&gt;width, scratch-&gt;height,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+
+			igt_calc_fb_size(fb);</pre>
    </blockquote>
    Rely on caller (Already done in prepare_fb), can be removed
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+
+			fb-&gt;gem_handle = xe_bo_create(importer_fd, 0, fb-&gt;size,
+						      vram_if_possible(importer_fd, 0), 0);
+			igt_require(fb-&gt;gem_handle);
+
+			blt_copy_init(importer_fd, &amp;blt);
+
+			src = blt_create_object(&amp;blt, vram_if_possible(importer_fd, 0),
+						scratch-&gt;width, scratch-&gt;height, 32, 0,
+						T_LINEAR, COMPRESSION_DISABLED, 0, true);
+			blt_set_object(src, temp_buf_handle, scratch-&gt;size,
+				       vram_if_possible(importer_fd, 0), 0,
+				       DEFAULT_PAT_INDEX,
+				       T_LINEAR, COMPRESSION_DISABLED, 0);
+
+			dst = blt_create_object(&amp;blt, vram_if_possible(importer_fd, 0),
+						scratch-&gt;width, scratch-&gt;height, 32, 0,
+						T_LINEAR, COMPRESSION_DISABLED, 0, true);
+			blt_set_object(dst, fb-&gt;gem_handle, fb-&gt;size,
+				       vram_if_possible(importer_fd, 0), 0,
+				       DEFAULT_PAT_INDEX,
+				       T_LINEAR, COMPRESSION_DISABLED, 0);
+
+			blt.color_depth = CD_32bit;
+			blt_set_copy_object(&amp;blt.src, src);
+			blt_set_copy_object(&amp;blt.dst, dst);
+
+			xe_bb = xe_bo_create(importer_fd, 0, fb-&gt;size,</pre>
    </blockquote>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+					     vram_if_possible(importer_fd, 0), 0);
+
+			blt_set_batch(&amp;blt.bb, xe_bb, fb-&gt;size, vram_if_possible(importer_fd, 0));
+			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &amp;blt);
+
+			put_offset(ahnd, dst-&gt;handle);
+			put_offset(ahnd, src-&gt;handle);
+			put_offset(ahnd, xe_bb);
+			intel_allocator_bind(ahnd, 0, 0);
+			put_ahnd(ahnd);
 		}
 	} else {
 		fb-&gt;gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(fb-&gt;gem_handle &gt; 0);
 	}
 
 	handles[0] = fb-&gt;gem_handle;
-	pitches[0] = pitch;
+	pitches[0] = scratch-&gt;pitch;
 	offsets[0] = 0;
 
 	ret = drmModeAddFB2(importer_fd, fb-&gt;width, fb-&gt;height,
@@ -284,7 +408,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 		gem_close(exporter_fd, scratch.handle);
 
 		prepare_fb(importer_fd, &amp;scratch, &amp;fb);
-		import_fb(importer_fd, &amp;fb, dmabuf_fd, scratch.pitch);
+		import_fb(importer_fd, &amp;fb, dmabuf_fd, &amp;scratch);
 		close(dmabuf_fd);
 
 		colors[i].prime_crc.name = "prime";
@@ -475,6 +599,8 @@ igt_main
 			igt_require(second_fd_vgem &gt;= 0);
 			if (is_i915_device(first_fd))
 				igt_require(!gem_has_lmem(first_fd));
+			if (is_xe_device(first_fd))
+				igt_require(!xe_has_vram(first_fd));
 		}
 
 		igt_describe("Make a dumb color buffer, export to another device and"
@@ -485,11 +611,5 @@ igt_main
 				igt_dynamic("second-to-first")
 					test_crc(second_fd_vgem, first_fd);
 		}
-
-		igt_fixture
-			drm_close_driver(second_fd_vgem);
 	}
-
-	igt_fixture
-		drm_close_driver(first_fd);
 }</pre>
    </blockquote>
    Keep drm_close_driver(second_fd_vgem), drm_close_driver(first_fd)<br>
    <br>
    Thanks and Regards<br>
    Kunal Joshi
  </body>
</html>

--------------0lh1XQKg5KkQI8WPfQe9xNWC--
