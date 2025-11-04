Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE89CCCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 11:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900F910E102;
	Tue,  4 Nov 2025 11:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqEuNthv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F4210E102
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762256381; x=1793792381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vlqpyZYLyuW3KsvLwpBPOc7FT0LWyGNfsfhw1V+z4sA=;
 b=LqEuNthvQFqysYc6SBBxlSIqsYLf9w2CNDgr7/nvk+Or/1Oj6EYlZYC5
 ErQauLE+VDl2r1v7xTnN/vxNPH3XCCSo6DHZORcSJ6GtAvonno230/kTH
 qlFjVPKgp4coarOlu1DY3OO5ughw9triJfXy7ycenA6Lj+kb71UqdVkTb
 lWT8CnGvzXWTKVGhwqSS+MtbwDlkF/iXSJMhl1MssSHjGdpx2Rs6Tgyb2
 SnFhxrIsvDtd4oUS/0NUwPQt69wcNccg+KULtkbf5A20EZmIPOzPhZo4A
 wsGYx0vz7b/G7xswj4dCaBQcrNqRnuAogLpTCCrJSU0OQ7AweaU/kvIcS g==;
X-CSE-ConnectionGUID: f+IGDnVARv6e30Pv547x+g==
X-CSE-MsgGUID: /QvWgjh+SjiCLM7vZ/P+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64386952"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64386952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:39:40 -0800
X-CSE-ConnectionGUID: ArU2+z2/TqeRWtUMuGqeWg==
X-CSE-MsgGUID: Mm77zAs3SUmX0ZbKws2IBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187086055"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 03:39:39 -0800
Date: Tue, 4 Nov 2025 12:39:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_peer2peer: gracefully handle
 ENOSUP
Message-ID: <20251104113936.zxet7y5f7r3wn34m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 igt-dev@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20251103131244.28703-3-matthew.auld@intel.com>
 <20251103131244.28703-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251103131244.28703-4-matthew.auld@intel.com>
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

Hi Matthew,
On 2025-11-03 at 13:12:46 +0000, Matthew Auld wrote:

in subject s/ENOSUP/ENOTSUP/ so it will be:

[PATCH i-g-t v2 2/2] tests/intel/xe_peer2peer: gracefully handle ENOTSUP

Regards,
Kamil

> Currently this blows up on the multi-dGPU setup we have in CI when
> importing the VRAM from one device into the other via dma-buf, due the
> P2P internals reporting this as unsupported on this machine. Trying to
> manually white list the hostbridge device on the P2P side is also
> unsuccessful since the read side test fails due to a data mismatch when
> reading from the exported VRAM. There are also no hangs or errors in
> dmesg although strangely the write side test passes. So it appears that
> the direction of the copy is broken when reading the exported VRAM from
> the importer side. Manually disabling/enabling iommu also make no
> difference. And finally hacking the test to force same device
> import/export makes the test pass, which should rule out any kind of
> test defect. With that gracefully skip running the VRAM import subtests
> if this is reported as unsupported by the kernel.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6433
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1173
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  tests/intel/xe_peer2peer.c | 39 ++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> index b777d2b66..70374e56d 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -116,11 +116,24 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  	uint32_t im_xe = im_gpu->fd;
>  	uint32_t ex_src, dmabuf;
>  	uint32_t stride;
> -
>  	struct drm_xe_engine_class_instance inst = {
>  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  	};
>  	intel_ctx_t *ctx;
> +	int err;
> +
> +	blt_copy_init(ex_xe, &ex_blt);
> +	src = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
> +				T_LINEAR, COMPRESSION_DISABLED, 0, true);
> +
> +	dmabuf = prime_handle_to_fd(ex_xe, src->handle);
> +	err = __prime_fd_to_handle(im_xe, dmabuf, &ex_src);
> +	if (err == -ENOTSUP) {
> +		blt_destroy_object(ex_xe, src);
> +		igt_assert(ex_reg != system_memory(ex_xe));
> +		igt_skip("P2P VRAM import not supported on this device, skipping.\n");
> +	}
> +	igt_assert(!err);
>  
>  	vm = xe_vm_create(im_xe, 0, 0);
>  	exec_queue = xe_exec_queue_create(im_xe, vm, &inst, 0);
> @@ -129,17 +142,12 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  					 INTEL_ALLOCATOR_SIMPLE,
>  					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>  
> -	blt_copy_init(ex_xe, &ex_blt);
>  	blt_copy_init(im_xe, &im_blt);
>  
> -	src = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
> -				T_LINEAR, COMPRESSION_DISABLED, 0, true);
>  	dst = blt_create_object(&im_blt, im_reg, width, height, bpp, 0,
>  				T_LINEAR, COMPRESSION_DISABLED, 0, true);
>  	blt_surface_fill_rect(ex_xe, src, width, height);
>  
> -	dmabuf = prime_handle_to_fd(ex_xe, src->handle);
> -	ex_src = prime_fd_to_handle(im_xe, dmabuf);
>  	im_src = calloc(1, sizeof(*im_src));
>  
>  	stride = width * 4;
> @@ -198,11 +206,23 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  	uint32_t im_xe = im_gpu->fd;
>  	uint32_t ex_dst, dmabuf;
>  	uint32_t stride;
> -
>  	struct drm_xe_engine_class_instance inst = {
>  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  	};
>  	intel_ctx_t *ctx;
> +	int err;
> +
> +	blt_copy_init(ex_xe, &ex_blt);
> +	dst = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
> +				T_LINEAR, COMPRESSION_DISABLED, 0, true);
> +	dmabuf = prime_handle_to_fd(ex_xe, dst->handle);
> +	err = __prime_fd_to_handle(im_xe, dmabuf, &ex_dst);
> +	if (err == -ENOTSUP) {
> +		blt_destroy_object(ex_xe, dst);
> +		igt_assert(ex_reg != system_memory(ex_xe));
> +		igt_skip("P2P VRAM import not supported on this device, skipping.\n");
> +	}
> +	igt_assert(!err);
>  
>  	vm = xe_vm_create(im_xe, 0, 0);
>  	exec_queue = xe_exec_queue_create(im_xe, vm, &inst, 0);
> @@ -211,17 +231,12 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  					 INTEL_ALLOCATOR_SIMPLE,
>  					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>  
> -	blt_copy_init(ex_xe, &ex_blt);
>  	blt_copy_init(im_xe, &im_blt);
>  
> -	dst = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
> -				T_LINEAR, COMPRESSION_DISABLED, 0, true);
>  	src = blt_create_object(&im_blt, im_reg, width, height, bpp, 0,
>  				T_LINEAR, COMPRESSION_DISABLED, 0, true);
>  	blt_surface_fill_rect(im_xe, src, width, height);
>  
> -	dmabuf = prime_handle_to_fd(ex_xe, dst->handle);
> -	ex_dst = prime_fd_to_handle(im_xe, dmabuf);
>  	im_dst = calloc(1, sizeof(*im_dst));
>  
>  	stride = width * 4;
> -- 
> 2.51.1
> 
