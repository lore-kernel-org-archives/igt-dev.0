Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACFCCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 13:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4E10E70D;
	Wed, 12 Nov 2025 13:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTsuFHo1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C2610E025
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762952931; x=1794488931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=1sa1NUa3QWJM9sk3ISjBEAKj3Es0UjWbANfpuDQnSh0=;
 b=MTsuFHo1kVB9NED2y0fDbuOjTv5U0M1POLDdl9zKwK2b7TL22U86Eimf
 9nWdBucxpmHhLFyyT2ufvS0PylyVS5KxSLK4ziyIGN2rnwC7pLdNCnXgR
 Xi9WiaeH1nTF4dsuLDfBDVAGRefvw2U8o+etVsTYYgESL+8F2H70GG43F
 QDS6CAJxTlMIQgED6oMYGHxH7ON9DnYlAPyfcDicls/C3w8QREmI1BEG6
 0xKGNQxq8l/SruzwJGJ+Ef1aho6aQglaF6hVPDayZ6gqg1c3iK983yDB6
 4LQrJhQsTmxExpFTWL0qKt3A5gkfkyWAthNWWxH25v9rrKEBu3rcOb/qT Q==;
X-CSE-ConnectionGUID: 2oPGFT6PS4K1V8RMjgcyDg==
X-CSE-MsgGUID: BtmeXhAnRpCpSMVtlrjbjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82645404"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208,217";a="82645404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:08:50 -0800
X-CSE-ConnectionGUID: wQmM6lxvRV6zLRCujCtGLw==
X-CSE-MsgGUID: bdWKEz7oQxuTnDUOmx39gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
 d="scan'208,217";a="188473245"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:08:46 -0800
Content-Type: multipart/alternative;
 boundary="------------R8WubqxS8SmKpQzg6YikvMRc"
Message-ID: <cef8ecc4-640a-485e-926b-d0a6f158a2cb@intel.com>
Date: Wed, 12 Nov 2025 18:38:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v16,1/3] tests/kms_prime: Add XE support
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20251104085640.795121-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251104085640.795121-2-santhosh.reddy.guddati@intel.com>
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
--------------R8WubqxS8SmKpQzg6YikvMRc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Santhosh,

Please find review comments inline,

On 04-11-2025 14:26, Santhosh Reddy Guddati wrote:
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
> v13: Align B0 width to 256 for consitancy with existing logic,
>       cleanup of xe resources after use (Kunal)
>       - Reorder header includes and add missing closing calls (Kamil)
> v14: Include igt headers in appropriate order (Kamil)
>       - Fix VGEM detection before checking for Intel dGPU
> v15: cleanup blt resources and avoid mutating width (Kunal)
> v16: ADD *_VISIBLE_VRAM to all xe_bo_create() , so batch buffers and
>       import buffers reside in visible VRAM , preventing SIGBUS/ invalid
>       access on dGPU.
>       - Fix incorrect blt_rdestroy_object param, and stop blt_destroy_obj
>       for dst as it still wraps fb->gem_handle to avoid freeing as it is
>       still needed for import.
>
> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
> Signed-off-by: Nidhi Gupta<nidhi1.gupta@intel.com>
> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_prime.c | 189 ++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 159 insertions(+), 30 deletions(-)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 1d011327c..d210f23a9 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -29,15 +29,23 @@
>    * Mega feature: General Display Features
>    */
>   
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <poll.h>
> +#include <sys/ioctl.h>
> +#include <time.h>
> +
>   #include "igt.h"
>   #include "igt_device.h"
>   #include "igt_debugfs.h"
>   #include "igt_sysfs.h"
> -#include <fcntl.h>
>   
> -#include <poll.h>
> -#include <sys/ioctl.h>
> -#include <time.h>
> +#include "lib/intel_blt.h"
> +#include "lib/intel_common.h"
> +#include "lib/intel_pat.h"
> +#include "lib/intel_mocs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * SUBTEST: D3hot
> @@ -128,24 +136,65 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
>   	return output;
>   }
>   
> +static uint32_t *create_and_map_dumb_bo(int fd, struct dumb_bo *bo,
> +					uint32_t width, uint32_t height,
> +					uint32_t bpp, uint32_t *pitch,
> +					uint64_t *size)
> +{
> +	uint32_t *ptr;
> +	const uint32_t alloc_w = ALIGN(width, 256);
> +
> +	bo->height = height;
> +	bo->bpp = bpp;
> +	bo->handle = kmstest_dumb_create(fd, alloc_w,
> +					 bo->height, bo->bpp, pitch, size);
> +
> +	ptr = kmstest_dumb_map_buffer(fd, bo->handle, *size, PROT_READ | PROT_WRITE);
> +	igt_assert(ptr != MAP_FAILED);
Assert can be dropped as kmstest_dumb_map_buffer takes care of it
> +
> +	return ptr;
> +}
> +
> +static uint32_t *prepare_xe_dgfx_scratch(int exporter_fd, struct dumb_bo *scratch)
> +{
> +	uint32_t *ptr;
> +	struct blt_copy_data ex_blt = {};
> +	struct blt_copy_object *src = NULL;
> +
> +	igt_debug("Preparing scratch buffer for DGfx exporter\n");
> +
> +	blt_copy_init(exporter_fd, &ex_blt);
> +	src = blt_create_object(&ex_blt, DRM_XE_MEM_REGION_CLASS_VRAM,
> +				scratch->width, scratch->height,
> +				scratch->bpp, 0, T_LINEAR,
> +				COMPRESSION_DISABLED, 0, true);
> +	scratch->handle = src->handle;
> +	scratch->size = src->size;
> +	scratch->pitch = src->pitch;
> +	ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle, scratch->size,
> +			     PROT_READ | PROT_WRITE);
> +	igt_assert(ptr != MAP_FAILED);
Same here can be dropped
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
>   
> -	if (!is_i915_device(exporter_fd)) {
> -		scratch->handle = kmstest_dumb_create(exporter_fd,
> -						      ALIGN(scratch->width, 256),
> -						      scratch->height, scratch->bpp,
> -						      &scratch->pitch, &scratch->size);
> +	if (drm_get_chipset(exporter_fd) == DRIVER_VGEM)
> +		is_dgfx = false;
> +	else
> +		is_dgfx = is_intel_dgfx(exporter_fd);
>   
> -		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
> -					      scratch->size, PROT_WRITE);
> -	} else {
> +	if (is_xe_device(exporter_fd) && is_dgfx) {
> +		ptr = prepare_xe_dgfx_scratch(exporter_fd, scratch);
> +	} else if (is_i915_device(exporter_fd)) {
>   		struct igt_fb fb;
>   
>   		igt_init_fb(&fb, exporter_fd, mode->hdisplay, mode->vdisplay,
> @@ -165,6 +214,11 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>   
>   		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
>   						PROT_WRITE | PROT_READ);
> +	} else {
> +		ptr = create_and_map_dumb_bo(exporter_fd, scratch,
> +					     scratch->width, scratch->height,
> +					     scratch->bpp, &scratch->pitch,
> +					     &scratch->size);
>   	}
>   
>   	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
> @@ -184,40 +238,113 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
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
> +
> +	if (is_intel_dgfx(importer_fd)) {
> +		uint64_t fb_size = 0;
> +		uint64_t ahnd = 0;
>   
> -			igt_info("Importer is dGPU\n");
> -			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
> -			igt_assert(temp_buf_handle > 0);
> -			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
> -								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
> -			igt_assert(fb->gem_handle > 0);
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
> +			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
> +			ahnd = intel_allocator_open_full(importer_fd, xe_ctx->vm, 0, 0,
> +							 INTEL_ALLOCATOR_SIMPLE,
> +							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +			igt_calc_fb_size(fb);
> +
> +			fb->gem_handle = xe_bo_create(importer_fd, 0, fb->size,
> +						      vram_if_possible(importer_fd, 0),
> +						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
Have uint64_t bb_size
And use bb_size = xe_bb_size(..) instead passing fb->size
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
> +					     vram_if_possible(importer_fd, 0),
> +					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +			blt_set_batch(&blt.bb, xe_bb, fb->size, vram_if_possible(importer_fd, 0));
> +			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &blt);
> +
> +			put_offset(ahnd, dst->handle);
> +			put_offset(ahnd, src->handle);
> +			put_offset(ahnd, xe_bb);

> +			intel_allocator_bind(ahnd, 0, 0);
> +			put_ahnd(ahnd);
- Use intel_allocator_close(ahnd)
> +
> +			xe_exec_queue_destroy(importer_fd, xe_exec);
> +			xe_vm_destroy(importer_fd, vm);
> +			blt_destroy_object(importer_fd, src);

- blt_destroy_object(importer_fd, dst);

- Close temp_buf_handle in xe path as well

With all above changes done, Reviewed-by: Kunal Joshi 
<kunal1.joshi@intel.com>


> +			gem_close(importer_fd, xe_bb);
> +			intel_allocator_close(ahnd);
> +			intel_ctx_destroy(importer_fd, xe_ctx);
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
> @@ -284,7 +411,7 @@ static void test_crc(int exporter_fd, int importer_fd)
>   		gem_close(exporter_fd, scratch.handle);
>   
>   		prepare_fb(importer_fd, &scratch, &fb);
> -		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
> +		import_fb(importer_fd, &fb, dmabuf_fd, &scratch);
>   		close(dmabuf_fd);
>   
>   		colors[i].prime_crc.name = "prime";
> @@ -475,6 +602,8 @@ igt_main
>   			igt_require(second_fd_vgem >= 0);
>   			if (is_i915_device(first_fd))
>   				igt_require(!gem_has_lmem(first_fd));
> +			if (is_xe_device(first_fd))
> +				igt_require(!xe_has_vram(first_fd));
>   		}
>   
>   		igt_describe("Make a dumb color buffer, export to another device and"
--------------R8WubqxS8SmKpQzg6YikvMRc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Santhosh,<br>
      <br>
      Please find review comments inline,</p>
    <div class="moz-cite-prefix">On 04-11-2025 14:26, Santhosh Reddy
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
v13: Align B0 width to 256 for consitancy with existing logic,
     cleanup of xe resources after use (Kunal)
     - Reorder header includes and add missing closing calls (Kamil)
v14: Include igt headers in appropriate order (Kamil)
     - Fix VGEM detection before checking for Intel dGPU
v15: cleanup blt resources and avoid mutating width (Kunal)
v16: ADD *_VISIBLE_VRAM to all xe_bo_create() , so batch buffers and
     import buffers reside in visible VRAM , preventing SIGBUS/ invalid
     access on dGPU.
     - Fix incorrect blt_rdestroy_object param, and stop blt_destroy_obj
     for dst as it still wraps fb-&gt;gem_handle to avoid freeing as it is
     still needed for import.

Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
Signed-off-by: Nidhi Gupta <a class="moz-txt-link-rfc2396E" href="mailto:nidhi1.gupta@intel.com">&lt;nidhi1.gupta@intel.com&gt;</a>
Signed-off-by: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
---
 tests/kms_prime.c | 189 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 159 insertions(+), 30 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1d011327c..d210f23a9 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -29,15 +29,23 @@
  * Mega feature: General Display Features
  */
 
+#include &lt;fcntl.h&gt;
+#include &lt;limits.h&gt;
+#include &lt;poll.h&gt;
+#include &lt;sys/ioctl.h&gt;
+#include &lt;time.h&gt;
+
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
-#include &lt;fcntl.h&gt;
 
-#include &lt;poll.h&gt;
-#include &lt;sys/ioctl.h&gt;
-#include &lt;time.h&gt;
+#include "lib/intel_blt.h"
+#include "lib/intel_common.h"
+#include "lib/intel_pat.h"
+#include "lib/intel_mocs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 /**
  * SUBTEST: D3hot
@@ -128,24 +136,65 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	return output;
 }
 
+static uint32_t *create_and_map_dumb_bo(int fd, struct dumb_bo *bo,
+					uint32_t width, uint32_t height,
+					uint32_t bpp, uint32_t *pitch,
+					uint64_t *size)
+{
+	uint32_t *ptr;
+	const uint32_t alloc_w = ALIGN(width, 256);
+
+	bo-&gt;height = height;
+	bo-&gt;bpp = bpp;
+	bo-&gt;handle = kmstest_dumb_create(fd, alloc_w,
+					 bo-&gt;height, bo-&gt;bpp, pitch, size);
+
+	ptr = kmstest_dumb_map_buffer(fd, bo-&gt;handle, *size, PROT_READ | PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
</pre>
    </blockquote>
    <span style="white-space: pre-wrap">Assert can be dropped as kmstest_dumb_map_buffer</span> takes
    care of it
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+
+	return ptr;
+}
+
+static uint32_t *prepare_xe_dgfx_scratch(int exporter_fd, struct dumb_bo *scratch)
+{
+	uint32_t *ptr;
+	struct blt_copy_data ex_blt = {};
+	struct blt_copy_object *src = NULL;
+
+	igt_debug("Preparing scratch buffer for DGfx exporter\n");
+
+	blt_copy_init(exporter_fd, &amp;ex_blt);
+	src = blt_create_object(&amp;ex_blt, DRM_XE_MEM_REGION_CLASS_VRAM,
+				scratch-&gt;width, scratch-&gt;height,
+				scratch-&gt;bpp, 0, T_LINEAR,
+				COMPRESSION_DISABLED, 0, true);
+	scratch-&gt;handle = src-&gt;handle;
+	scratch-&gt;size = src-&gt;size;
+	scratch-&gt;pitch = src-&gt;pitch;
+	ptr = xe_bo_mmap_ext(exporter_fd, scratch-&gt;handle, scratch-&gt;size,
+			     PROT_READ | PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);</pre>
    </blockquote>
    Same here can be dropped
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
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
 
-	if (!is_i915_device(exporter_fd)) {
-		scratch-&gt;handle = kmstest_dumb_create(exporter_fd,
-						      ALIGN(scratch-&gt;width, 256),
-						      scratch-&gt;height, scratch-&gt;bpp,
-						      &amp;scratch-&gt;pitch, &amp;scratch-&gt;size);
+	if (drm_get_chipset(exporter_fd) == DRIVER_VGEM)
+		is_dgfx = false;
+	else
+		is_dgfx = is_intel_dgfx(exporter_fd);
 
-		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch-&gt;handle,
-					      scratch-&gt;size, PROT_WRITE);
-	} else {
+	if (is_xe_device(exporter_fd) &amp;&amp; is_dgfx) {
+		ptr = prepare_xe_dgfx_scratch(exporter_fd, scratch);
+	} else if (is_i915_device(exporter_fd)) {
 		struct igt_fb fb;
 
 		igt_init_fb(&amp;fb, exporter_fd, mode-&gt;hdisplay, mode-&gt;vdisplay,
@@ -165,6 +214,11 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
 		ptr = gem_mmap__device_coherent(exporter_fd, scratch-&gt;handle, 0, scratch-&gt;size,
 						PROT_WRITE | PROT_READ);
+	} else {
+		ptr = create_and_map_dumb_bo(exporter_fd, scratch,
+					     scratch-&gt;width, scratch-&gt;height,
+					     scratch-&gt;bpp, &amp;scratch-&gt;pitch,
+					     &amp;scratch-&gt;size);
 	}
 
 	for (size_t idx = 0; idx &lt; scratch-&gt;size / sizeof(*ptr); ++idx)
@@ -184,40 +238,113 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
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
+
+	if (is_intel_dgfx(importer_fd)) {
+		uint64_t fb_size = 0;
+		uint64_t ahnd = 0;
 
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle &gt; 0);
-			fb-&gt;gem_handle = igt_create_bo_with_dimensions(importer_fd, fb-&gt;width, fb-&gt;height,
-								       fb-&gt;drm_format, fb-&gt;modifier, pitch, &amp;fb_size, NULL, NULL);
-			igt_assert(fb-&gt;gem_handle &gt; 0);
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
+			xe_exec = xe_exec_queue_create(importer_fd, vm, &amp;inst, 0);
+			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
+			ahnd = intel_allocator_open_full(importer_fd, xe_ctx-&gt;vm, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+			igt_calc_fb_size(fb);
+
+			fb-&gt;gem_handle = xe_bo_create(importer_fd, 0, fb-&gt;size,
+						      vram_if_possible(importer_fd, 0),
+						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);</pre>
    </blockquote>
    Have uint64_t bb_size<br>
    And use bb_size = xe_bb_size(..) instead passing fb-&gt;size    
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
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
+			xe_bb = xe_bo_create(importer_fd, 0, fb-&gt;size,
+					     vram_if_possible(importer_fd, 0),
+					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+			blt_set_batch(&amp;blt.bb, xe_bb, fb-&gt;size, vram_if_possible(importer_fd, 0));
+			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &amp;blt);
+
+			put_offset(ahnd, dst-&gt;handle);
+			put_offset(ahnd, src-&gt;handle);
+			put_offset(ahnd, xe_bb);</pre>
    </blockquote>
    <br>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+			intel_allocator_bind(ahnd, 0, 0);
+			put_ahnd(ahnd);</pre>
    </blockquote>
    - Use intel_allocator_close(ahnd)
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+
+			xe_exec_queue_destroy(importer_fd, xe_exec);
+			xe_vm_destroy(importer_fd, vm);
+			blt_destroy_object(importer_fd, src);</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">- blt_destroy_object(importer_fd, dst);</span></p>
    <p><span style="white-space: pre-wrap">- Close temp_buf_handle in xe path as well</span></p>
    <p><span style="white-space: pre-wrap">
With all above changes done,
Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span></p>
    <br>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+			gem_close(importer_fd, xe_bb);
+			intel_allocator_close(ahnd);
+			intel_ctx_destroy(importer_fd, xe_ctx);
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
@@ -284,7 +411,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 		gem_close(exporter_fd, scratch.handle);
 
 		prepare_fb(importer_fd, &amp;scratch, &amp;fb);
-		import_fb(importer_fd, &amp;fb, dmabuf_fd, scratch.pitch);
+		import_fb(importer_fd, &amp;fb, dmabuf_fd, &amp;scratch);
 		close(dmabuf_fd);
 
 		colors[i].prime_crc.name = "prime";
@@ -475,6 +602,8 @@ igt_main
 			igt_require(second_fd_vgem &gt;= 0);
 			if (is_i915_device(first_fd))
 				igt_require(!gem_has_lmem(first_fd));
+			if (is_xe_device(first_fd))
+				igt_require(!xe_has_vram(first_fd));
 		}
 
 		igt_describe("Make a dumb color buffer, export to another device and"
</pre>
    </blockquote>
  </body>
</html>

--------------R8WubqxS8SmKpQzg6YikvMRc--
