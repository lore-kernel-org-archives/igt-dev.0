Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC230CA1010
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 15:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27EA10EBED;
	Fri,  5 Sep 2025 15:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yiw351zB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C69C10EBED
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757086796; x=1788622796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C2pdM55uWK2SxyLGo3H42ys9kzf89U4kijRuAJAiF7M=;
 b=Yiw351zBzPgIe+P1sgGJhP4T4an2MWy4141GJcaH5XrdahIHNCoUYyQ9
 0SM/CHR4GBRWPuRE3Vno+u1SDUK0QqL4VcG5Jlu3I52hSOaYfzOhwu/px
 mOLiwG81FBAndnFw3LUYrSqr9j2uH0MOm5rjm4QFcvordSZADFiNxqHSB
 KGXK2Dfz2I9d0HmyF2LQDEu921qUyDuegtpVUDuVDT4OIDn/KtRCnxikN
 /7sY3sK8j9rM1TPiS7XrJa5Eb+B6tb8akwja6/Mr3mYgwrDG1VGHPbYWS
 AyME5r1HRAcskG/ueGlXWjqdT0+ZYYXcvexyXAsUtzuDde3SE9Oh+FYNv w==;
X-CSE-ConnectionGUID: PnmcTGPQST6BRA0eSvH0sg==
X-CSE-MsgGUID: VQAo6z54QuWALSspL+wmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59513371"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59513371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:39:55 -0700
X-CSE-ConnectionGUID: GLccVlW0RbODHMMDgU9GLA==
X-CSE-MsgGUID: rwI4kYCkRBqcNWGsJxVj3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="176528859"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 08:39:54 -0700
Date: Fri, 5 Sep 2025 17:39:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v12 3/5] lib/xe: Add Helper to get memory attributes
Message-ID: <20250905153939.76mn52ggk5ry6x5g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
 <20250904082701.2154029-4-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904082701.2154029-4-nishit.sharma@intel.com>
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

Hi Nishit,
On 2025-09-04 at 08:26:59 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> xe_vm_print_mem_attr_values_in_range() function added which calls
> QUERY_MEM_RANGES_ATTRS ioctl to get different memory attributes from KMD
> and then prints memory attributes returned by KMD for different access
> policies like atomic access, preferred loc and pat index.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  4 +++
>  2 files changed, 96 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 5608c8780..28b7d5bec 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -57,6 +57,98 @@ uint64_t xe_bb_size(int fd, uint64_t reqsize)
>  	             xe_get_default_alignment(fd));
>  }
>  
> +int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr)
> +{
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, vmas_attr))
> +		return -errno;

Add newline.

> +	return 0;
> +}
> +
> +int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr)

Align.

> +{
> +	if (!mem_attr)
> +		return -EINVAL;
> +
> +	vmas_attr->vector_of_mem_attr = (uintptr_t)mem_attr;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, vmas_attr))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_print_mem_attr_values_in_range:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @start: start of the virtual address range
> + * @range: size of the virtual address range
> + *
> + * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
> + * memory ranges from KMD. prints memory attributes as returned by KMD for
> + * atomic, prefrred loc and pat index types.
> + *
> + * Returns 0 for success or error for failure
> + */
> +
> +int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
> +{
> +

Remove empty line.

> +	void *ptr_start, *ptr;
> +	int err;
> +	struct drm_xe_vm_query_mem_range_attr query = {
> +		.vm_id = vm,
> +		.start = start,
> +		.range = range,
> +		.num_mem_ranges = 0,
> +		.sizeof_mem_range_attr = 0,
> +		.vector_of_mem_attr = (uintptr_t)NULL,
> +	};
> +
> +	igt_debug("mem_attr_values_in_range called start = %"PRIu64"\n range = %"PRIu64"\n",
> +		  start, range);
> +
> +	err  = xe_vm_number_vmas_in_range(fd, &query);
> +	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
> +		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
> +		igt_debug("vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n",

Why both warn and debug?

> +			 err, query.num_mem_ranges, query.sizeof_mem_range_attr);
> +		return err;
> +	}
> +
> +	/* Allocate buffer for the memory region attributes */
> +	ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
> +	ptr_start = ptr;
> +
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err = xe_vm_vma_attrs(fd, &query, ptr);
> +	if (err) {
> +		igt_warn("ioctl failed for vma_attrs err = %d\n", err);
> +		return err;
> +	}
> +
> +	/* Iterate over the returned memory region attributes */
> +	for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
> +		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
> +
> +		igt_debug("vma_id = %d\nvma_start = 0x%016llx\nvma_end = 0x%016llx\n"
> +				"vma:atomic = %d\nvma:pat_index = %d\nvma:preferred_loc_region = %d\n"
> +				"vma:preferred_loc_devmem_fd = %d\n\n\n", i, mem_attrs->start,
> +				mem_attrs->end,
> +				mem_attrs->atomic.val, mem_attrs->pat_index.val,
> +				mem_attrs->preferred_mem_loc.migration_policy,
> +				mem_attrs->preferred_mem_loc.devmem_fd);
> +
> +		ptr += query.sizeof_mem_range_attr;
> +	}
> +
> +	free(ptr_start);
> +	return 0;
> +}
> +
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
>  {
>  	struct drm_xe_vm_create create = {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 8e13ffe65..14245eeec 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -103,4 +103,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
>  		    uint32_t type, uint32_t op_val, uint16_t policy);
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
>  		  uint32_t type, uint32_t op_val, uint16_t policy);
> +int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
> +int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
> +		    struct drm_xe_mem_range_attr *mem_attr);

Align.

Regards,
Kamil

> +int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
>  #endif /* XE_IOCTL_H */
> -- 
> 2.43.0
> 
