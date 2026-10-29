Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8221606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mTHxenLg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAC11221C;
	Thu, 29 Oct 2026 11:31:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127F510E4CB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273406; x=1824809406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qtNHm53YLXOb4Ly3m04t1yMwUVjmw3atrVnPpLJPUNo=;
 b=mTHxenLgZiGoAF8ZdBnJHbR99lUObgSDjFUN57I5yUZJyWWb90fkyHc3
 8OacOhc06lkuL9NR+d96SB8OZlHrC/8vE88D7bhujr685wfNo0KxGzPK9
 SypuwnSNwecskT8kFrqPds3epEDVtPnu9do4BmDOAy4mCdOYmfTsJUujq
 nZ71qzpFUk7DT04zJwE/2lF/EEHqceMH2DdLvS7AfEjf1JSoiFF81BwH5
 3KgELNeBP8WgaIVtExamzC4gysUysMlchnvNcXn2n1xLmKnS+IyxOpsX3
 Sr6dDabSY3HuEaD6KD7br+H8/tE+LUA+8yVixGj+n+1g2nmiE6j4pTaYh g==;
X-CSE-ConnectionGUID: Ho/hXJ2lQHKRKKRcvmRyQg==
X-CSE-MsgGUID: 0IxUgnz5RM6NWqMWJfnogA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2011665"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2011665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:30:05 -0700
X-CSE-ConnectionGUID: 3eXqQiGfS6uwvkbl91hgwA==
X-CSE-MsgGUID: EPo7uud4Rd+13vJ9ZMLcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5456700"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:30:04 -0700
Date: Thu, 29 Oct 2026 12:30:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t 1/2] Drop CPU access flag for a few Render related
 allocations
Message-ID: <20261029113001.ydli5rt5l6lgqyvj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
 <20261029-b4-render_update-v1-1-4a92ec210d6a@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-b4-render_update-v1-1-4a92ec210d6a@imgtec.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brajesh,
On 2026-10-29 at 08:22:26 +0530, Brajesh Gupta wrote:

please use a prefix indicating for which GPU you introduce changes,
so here:

[PATCH i-g-t 1/2] imagination: Drop CPU access flag for a few Render related allocations

> tests/imagination: Skip CPU access flag for a few render related allocations
> 
> Skip passing CPU access flag for BO's that don't need access.
> 
> lib/igt: Interface update to pass extra flags for general heap allocation

lib/igt_pvr:

> 
> Allow users to pass specific flag other than DRM_PVR_BO_BYPASS_DEVICE_CACHE
> for general heap allocation.
> 
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> ---
>  lib/igt_pvr.c                       | 23 +++++++++++------------
>  lib/igt_pvr.h                       |  3 ++-
>  tests/imagination/pvr_submit_jobs.c |  9 ++++++---

imho these should be two patches, first you change lib and make
tests follow it, then you change a test for that 'skip CPU access'
so there will be clear picture where was a real change here.

>  3 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 799852da5..ecca46c48 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -397,9 +397,8 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
>  	switch (type) {
>  	case DRM_PVR_CTX_TYPE_RENDER:
>  		create_context_args.callstack_addr =
> -			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
> -								      vm_ctx_handle,
> -								      POWERVR_GPU_PAGE_SIZE));
> +			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,
> +								      POWERVR_GPU_PAGE_SIZE, 0));
>  		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
>  		create_context_args.static_context_state_len =
>  			init_render_context_state_stream(init_render_context_stream);
> @@ -673,16 +672,16 @@ struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size
>   * @fd: The file descriptor of the DRM device.
>   * @vm_ctx: The virtual memory context.
>   * @size: The size of the allocation.
> + * @flags: Extra allocation flags.
>   *
>   * Function to allocate and map GPU memory from the general heap.
>   *
>   * Returns: Pointer to the allocation structure.
>   */
> -struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size)
> +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size, uint64_t flags)
>  {
>  	return igt_pvr_allocate(fd, vm_ctx, size,
> -				DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> -				DRM_PVR_BO_BYPASS_DEVICE_CACHE,
> +				flags | DRM_PVR_BO_BYPASS_DEVICE_CACHE,

You introduced flags here so why a lib function adds '| other_flag'?
Well, it is your code so it is up to you, so

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. please tell me if you want to merge it as is or you will change
anything here. Should I wait for review by Alessio or Luigi?


>  				DRM_PVR_HEAP_GENERAL);
>  }
>  
> @@ -817,11 +816,11 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
>  					       *geom_data_args)
>  {
>  	geom_data_args->rtc_dev_addr =
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
>  	geom_data_args->tpc_dev_addr =
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
>  	geom_data_args->vheap_table_dev_addr =
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
>  	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
>  	geom_data_args->tpc_stride = 0x1;
>  }
> @@ -839,11 +838,11 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
>  					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
>  {
>  	rt_data_args->pm_mlist_dev_addr =
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
>  	rt_data_args->macrotile_array_dev_addr =
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
>  	rt_data_args->region_header_dev_addr =
> -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE, 0));
>  }
>  
>  /**
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index b6e3dd676..bed02f968 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -67,7 +67,8 @@ struct igt_pvr_allocation *igt_pvr_allocate_addr(int fd, uint32_t vm_ctx, size_t
>  						 uint64_t flags, uint64_t gpu_addr);
>  struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size, uint64_t flags,
>  					    uint32_t heap_index);
> -struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size);
> +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size,
> +					    uint64_t flags);
>  void *igt_pvr_get_cpu_addr(int fd, struct igt_pvr_allocation *alloc);
>  uint64_t igt_pvr_get_gpu_addr(struct igt_pvr_allocation *alloc);
>  size_t igt_pvr_get_size(struct igt_pvr_allocation *alloc);
> diff --git a/tests/imagination/pvr_submit_jobs.c b/tests/imagination/pvr_submit_jobs.c
> index 566f9d2b2..78a4b0bbf 100644
> --- a/tests/imagination/pvr_submit_jobs.c
> +++ b/tests/imagination/pvr_submit_jobs.c
> @@ -52,7 +52,8 @@ static uint32_t init_compute_cmd_stream(int fd, uint32_t vm_ctx,
>  	void *cdm_stream_map;
>  	uint32_t stream_length;
>  
> -	struct igt_pvr_allocation *cdm_stream_alloc = igt_pvr_allocate_general(fd, vm_ctx, 0x1000);
> +	struct igt_pvr_allocation *cdm_stream_alloc =
> +		igt_pvr_allocate_general(fd, vm_ctx, 0x1000, DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
>  
>  	cdm_stream_gpu_addr = igt_pvr_get_gpu_addr(cdm_stream_alloc);
>  
> @@ -212,14 +213,16 @@ int igt_main()
>  		pds_buffer_base[0x20] = pds_inst_encode_halt();
>  
>  		vdm_alloc =
> -			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
> +						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
>  
>  		vdm_buffer = igt_pvr_get_cpu_addr(fd, vdm_alloc);
>  
>  		size = PVR_BO_SIZE;
>  
>  		ppp_alloc =
> -			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
> +						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
>  
>  		ppp_buffer_base = igt_pvr_get_cpu_addr(fd, ppp_alloc);
>  
> 
> -- 
> 2.43.0
> 
