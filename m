Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24692C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 08:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7310E694;
	Wed, 20 Mar 2024 08:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SP+2WOV3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8345410E694
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710924447; x=1742460447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3A6LGoZoUE/BBgA9B47x9OkKyZfn/Klfeh8WKQM3chc=;
 b=SP+2WOV3GBNZDiEO1WRJocbhHpp19Mx5Iye5nCXRNjxDb6r1x9cwzWee
 jCldboH14028j4MEzkWs6NX61VlcwXIzCG2JR0ipXS/Iqcqo+msTT92Mu
 6NNava9/Gqz/gjRudEbXmlCd5kbKQoKvRIAJ91TW5eO5OVzeTdt3tWLiQ
 z8ZOananXO24mo35d547XK4cCI9IPqlW7hDjb9NC5upvSM1ynLbXN4gWG
 jn7fWNsUIsIMc+S40AI4OxtUWaLCBXX+JhrQZfndiSUIMqcT34SGOnBBa
 dOlL++OB8iApxS3LlYe1y+I8ByKkHQquIvluWpJJMishNoQhdGOIb8Grn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="31269019"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="31269019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 01:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="14159515"
Received: from unknown (HELO localhost) ([10.245.246.240])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 01:46:55 -0700
Date: Wed, 20 Mar 2024 09:46:52 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: add access to control surface
 on xe2
Message-ID: <20240320084652.gyd4w5sc6fufqf2u@zkempczy-mobl2>
References: <20240318114758.108006-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318114758.108006-1-juhapekka.heikkila@gmail.com>
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

On Mon, Mar 18, 2024 at 01:47:58PM +0200, Juha-Pekka Heikkila wrote:
> On random ccs test randomize also control surface content
> and on crc tests add check ccs image is compressed.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Hi JP.

I got two comments, one is minor nit, but second likely needs to be
addressed. See below.

> ---
>  tests/intel/kms_ccs.c | 77 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 4f8e30791..96beb2de1 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -365,6 +365,77 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color
>  	}
>  }
>  
> +static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
> +{
> +	uint64_t bb_size, ccssize = fb->size / CCS_RATIO(fb->fd);
> +	uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fb->fd));
> +	struct blt_ctrl_surf_copy_data surf = {};
> +	uint32_t sysmem = system_memory(fb->fd);
> +	uint32_t bb1, ccs, *ccsmap;
> +	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
> +	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
> +	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &
> +						xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
> +
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +
> +	uint64_t surf_ahnd;
> +	uint32_t vm, exec_queue;
> +	intel_ctx_t *surf_ctx;
> +
> +	vm = xe_vm_create(fb->fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fb->fd, vm, &inst, 0);
> +	surf_ctx = intel_ctx_xe(fb->fd, vm, exec_queue, 0, 0, 0);
> +	surf_ahnd = intel_allocator_open(fb->fd, surf_ctx->vm,
> +						INTEL_ALLOCATOR_RELOC);
> +
> +	ccs = xe_bo_create_caching(fb->fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
> +
> +	blt_ctrl_surf_copy_init(fb->fd, &surf);
> +	blt_set_ctrl_surf_object(&surf.src, fb->gem_handle, region, fb->size,
> +				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
> +	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
> +				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> +
> +	bb_size = xe_bb_size(fb->fd, SZ_4K);
> +	bb1 = xe_bo_create(fb->fd, 0, bb_size, sysmem, 0);
> +	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
> +	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
> +	intel_ctx_xe_sync(surf_ctx, true);
> +
> +	ccsmap = xe_bo_map(fb->fd, ccs, surf.dst.size);
> +
> +	if (verify_compression) {
> +		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++) {
> +			if (ccsmap[i] != 0)
> +				goto ccs_vefiried;

That's minor nit, s/vefiried/verified/g.

Second doesn't reside in this code, it is in the test itself:

static void fill_fb_random(int drm_fd, igt_fb_t *fb)
{
...
	for (i = 0; i < fb->size; i++)
		p[i] = rand();
...

Randomized data might lead your surface won't be surprised at all (data
are noise). I experimented with this some time ago when I played with
ctrl-surf-copy. Noise wasn't compressible so I think you should less
random data in case you want to check the ccs data.

--
Zbigniew

> +		}
> +		igt_assert_f(false, "framebuffer was not compressed!\n");
> +	} else {
> +		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
> +			ccsmap[i] = rand();
> +	}
> +
> +	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
> +				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> +	blt_set_ctrl_surf_object(&surf.dst, fb->gem_handle, region, fb->size,
> +				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
> +	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
> +	intel_ctx_xe_sync(surf_ctx, true);
> +
> +ccs_vefiried:
> +	munmap(ccsmap, ccssize);
> +	gem_close(fb->fd, ccs);
> +	gem_close(fb->fd, bb1);
> +	xe_exec_queue_destroy(fb->fd, exec_queue);
> +	xe_vm_destroy(fb->fd, vm);
> +	free(surf_ctx);
> +	put_ahnd(surf_ahnd);
> +}
> +
>  static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>  {
>  	void *map;
> @@ -382,6 +453,10 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>  		p[i] = rand();
>  
>  	igt_assert(gem_munmap(map, fb->size) == 0);
> +
> +	/* randomize also ccs surface on Xe2 */
> +	if (AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 20))
> +		access_flat_ccs_surface(fb, false);
>  }
>  
>  static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plane,
> @@ -640,6 +715,8 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
>  	xe_exec_queue_destroy(dst_fb->fd, exec_queue);
>  	xe_vm_destroy(dst_fb->fd, vm);
>  	free(xe_ctx);
> +
> +	access_flat_ccs_surface(fb, true);
>  }
>  
>  static void generate_fb(data_t *data, struct igt_fb *fb,
> -- 
> 2.25.1
> 
