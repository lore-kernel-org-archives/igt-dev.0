Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B8606A323
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UGHrLOmh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1910E579;
	Mon,  9 Nov 2026 14:29:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F148810F3CE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794234484; x=1825770484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KC9OyuCbKimObFEz0TC9hqglgSPF3mt+jdMY/E9frYE=;
 b=UGHrLOmhtDJmTdArF0WgaJFU3EJntqUxznr0d4cmDDqGB1TDamXmWjon
 LmgQiXFiO3T9Xp5c/aqUcmQg8EK4EjIaj7GLhUOiYnUr7vHyOfKrv+iET
 l85w2Ywp+C52xcxjyk9QtGgH5KzwYYrkmnPR4KRnEhUCbJqM31BW0DHuP
 mTc7WeqUKWeTPfEFuyT7nYk5Uf/Ao6Pn9JSiJ/y3YeFvNeAVV79rIJy9u
 /N25se1mXvF6/Z5g5ryY4xsQ3wHV0uIEDTFxccsbsgzmXmVcavyffqVUN
 HORu4nw/8itjW8D12VqVbf15WkpAbYXAGGShjvnyffOs/l6hBPb7l8a7a Q==;
X-CSE-ConnectionGUID: lfMzSJqRSLaDmWBZqt0WOg==
X-CSE-MsgGUID: vonQhFT4SvWHyOg19tClbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2873810"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2873810"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:28:03 -0800
X-CSE-ConnectionGUID: Qux7rY5IQiqGHxDJhWCTpQ==
X-CSE-MsgGUID: GuLKAEwfTbKsRG1qRbnl8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8202377"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:28:02 -0800
Date: Mon, 9 Nov 2026 15:27:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
Cc: Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib/igt_pvr: Update general heap allocation
 interface to pass flags
Message-ID: <vusi36hw2orfnjrgo45lqoqqcwoks4aigigof5ioskruogbr6a@4duazrh2qt6k>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
 <20261029-b4-render_update-v2-1-b3185bbe8091@imgtec.com>
 <19ad3c6d8360aa6297ab270e77ed3cc4cf23ce81.camel@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19ad3c6d8360aa6297ab270e77ed3cc4cf23ce81.camel@imgtec.com>
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

Hi Luigi,
On 2026-11-03 at 06:46:30 +0000, Luigi Santivetti wrote:
> On Thu, 2026-10-29 at 18:03 +0530, Brajesh Gupta wrote:
> > Update igt_pvr_allocate_general() interface to pass flags for allocation.
> > 
> > Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> 
> Only a minor nit below.
> 
> Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
> 
> > ---
> >  lib/igt_pvr.c                       | 39 ++++++++++++++++++++++++-------------
> >  lib/igt_pvr.h                       |  3 ++-
> >  tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
> >  3 files changed, 37 insertions(+), 18 deletions(-)
> > 
> > diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> > index 799852da5..22b0c2775 100644
> > --- a/lib/igt_pvr.c
> > +++ b/lib/igt_pvr.c
> > @@ -397,9 +397,10 @@ uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
> >  	switch (type) {
> >  	case DRM_PVR_CTX_TYPE_RENDER:
> >  		create_context_args.callstack_addr =
> > -			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
> > -								      vm_ctx_handle,
> > -								      POWERVR_GPU_PAGE_SIZE));
> > +			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx_handle,
> 
> nit: I'd not move `vm_ctx_handle`.
> 

Brajesh, please correct this, add r-b to patches were you got it
and resend.

Regards,
Kamil

> > +								      POWERVR_GPU_PAGE_SIZE,
> > +								      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +								      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);
> >  		create_context_args.static_context_state_len =
> >  			init_render_context_state_stream(init_render_context_stream);
> > @@ -673,17 +674,15 @@ struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size
> >   * @fd: The file descriptor of the DRM device.
> >   * @vm_ctx: The virtual memory context.
> >   * @size: The size of the allocation.
> > + * @flags: Allocation flags.
> >   *
> >   * Function to allocate and map GPU memory from the general heap.
> >   *
> >   * Returns: Pointer to the allocation structure.
> >   */
> > -struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size)
> > +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size, uint64_t flags)
> >  {
> > -	return igt_pvr_allocate(fd, vm_ctx, size,
> > -				DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > -				DRM_PVR_BO_BYPASS_DEVICE_CACHE,
> > -				DRM_PVR_HEAP_GENERAL);
> > +	return igt_pvr_allocate(fd, vm_ctx, size, flags, DRM_PVR_HEAP_GENERAL);
> >  }
> >  
> >  /**
> > @@ -817,11 +816,17 @@ static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
> >  					       *geom_data_args)
> >  {
> >  	geom_data_args->rtc_dev_addr =
> > -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> > +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
> > +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  	geom_data_args->tpc_dev_addr =
> > -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> > +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
> > +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  	geom_data_args->vheap_table_dev_addr =
> > -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> > +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
> > +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
> >  	geom_data_args->tpc_stride = 0x1;
> >  }
> > @@ -839,11 +844,17 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
> >  					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
> >  {
> >  	rt_data_args->pm_mlist_dev_addr =
> > -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> > +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
> > +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  	rt_data_args->macrotile_array_dev_addr =
> > -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> > +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
> > +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  	rt_data_args->region_header_dev_addr =
> > -		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> > +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
> > +							      DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
> >  }
> >  
> >  /**
> > diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> > index b6e3dd676..bed02f968 100644
> > --- a/lib/igt_pvr.h
> > +++ b/lib/igt_pvr.h
> > @@ -67,7 +67,8 @@ struct igt_pvr_allocation *igt_pvr_allocate_addr(int fd, uint32_t vm_ctx, size_t
> >  						 uint64_t flags, uint64_t gpu_addr);
> >  struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size, uint64_t flags,
> >  					    uint32_t heap_index);
> > -struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size);
> > +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size,
> > +					    uint64_t flags);
> >  void *igt_pvr_get_cpu_addr(int fd, struct igt_pvr_allocation *alloc);
> >  uint64_t igt_pvr_get_gpu_addr(struct igt_pvr_allocation *alloc);
> >  size_t igt_pvr_get_size(struct igt_pvr_allocation *alloc);
> > diff --git a/tests/imagination/pvr_submit_jobs.c b/tests/imagination/pvr_submit_jobs.c
> > index 566f9d2b2..21ccb03fd 100644
> > --- a/tests/imagination/pvr_submit_jobs.c
> > +++ b/tests/imagination/pvr_submit_jobs.c
> > @@ -52,7 +52,10 @@ static uint32_t init_compute_cmd_stream(int fd, uint32_t vm_ctx,
> >  	void *cdm_stream_map;
> >  	uint32_t stream_length;
> >  
> > -	struct igt_pvr_allocation *cdm_stream_alloc = igt_pvr_allocate_general(fd, vm_ctx, 0x1000);
> > +	struct igt_pvr_allocation *cdm_stream_alloc =
> > +		igt_pvr_allocate_general(fd, vm_ctx, 0x1000,
> > +				         DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +				         DRM_PVR_BO_BYPASS_DEVICE_CACHE);
> >  
> >  	cdm_stream_gpu_addr = igt_pvr_get_gpu_addr(cdm_stream_alloc);
> >  
> > @@ -212,14 +215,18 @@ int igt_main()
> >  		pds_buffer_base[0x20] = pds_inst_encode_halt();
> >  
> >  		vdm_alloc =
> > -			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> > +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
> > +						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +						 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
> >  
> >  		vdm_buffer = igt_pvr_get_cpu_addr(fd, vdm_alloc);
> >  
> >  		size = PVR_BO_SIZE;
> >  
> >  		ppp_alloc =
> > -			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> > +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size,
> > +						 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> > +						 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
> >  
> >  		ppp_buffer_base = igt_pvr_get_cpu_addr(fd, ppp_alloc);
> >  
> > 
> 
