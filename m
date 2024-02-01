Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BFEC48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 18:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DBE10EF7E;
	Thu,  1 Feb 2024 18:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8/o2SKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BEA10EF80
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706813336; x=1738349336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lnnHiiQryq0lSg+APLObl+hnmly/TTgFsGSHHtYDLF0=;
 b=S8/o2SKLrnqioRMzRFyARIgcx283m2BWpYIiS7KACRfdfHkfcZXgP+e0
 qFZRRswBmqBRulB1LpW5YcB097veApwwelP96JbBre6OPwpcsLpx8OCgz
 Rb5MS9qPy3N9Uj8CPYI+roDm/CO9qgxKdSp/Wjqjft47X4K3RK5mREKYL
 eSnExIL88A4u+FGuwPTWk4dxr/NvHZ+qDVtjmlprSBcUz3x5WpvGTqT+S
 +/9dahDGwHsAz/EBF/tkoJUtd4i5r/ZtJ94GLGmdtLs0zyP3GxZDwGmNI
 sKb0pxd7SwyaNcw+NkOlK8pllX5L/+tnLeJgJVOHLwd3l/fv4azheBLw2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="160268"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="160268"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 10:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="85984"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 10:48:50 -0800
Date: Thu, 1 Feb 2024 19:48:47 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: fix xe_bb_size() conversion
Message-ID: <20240201184847.zql56l4pfdzoz4sk@zkempczy-mobl2>
References: <20240201100637.315023-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240201100637.315023-1-matthew.auld@intel.com>
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

On Thu, Feb 01, 2024 at 10:06:37AM +0000, Matthew Auld wrote:
> The large* tests need to be able to partition the bo_size without
> breaking any alignment restrictions, and adding on the pre-fetch size
> breaks that.  Rather keep the passed in bo_size as-is and add the
> prefetch size as hidden padding at the end.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_vm.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 67276b220..fe667e64d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -954,6 +954,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		.num_syncs = 2,
>  		.syncs = to_user_pointer(sync),
>  	};
> +	size_t bo_size_prefetch, padding;
>  	uint64_t addr = 0x1ull << 30, base_addr = 0x1ull << 30;
>  	uint32_t vm;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> @@ -975,20 +976,21 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	vm = xe_vm_create(fd, 0, 0);
>  
> -	bo_size = xe_bb_size(fd, bo_size);
> -
>  	if (flags & LARGE_BIND_FLAG_USERPTR) {
> -		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
> +		bo_size_prefetch = xe_bb_size(fd, bo_size);
> +		map = aligned_alloc(xe_get_default_alignment(fd), bo_size_prefetch);
>  		igt_assert(map);
>  	} else {
>  		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
>  			    xe_visible_vram_size(fd, 0));
>  
> -		bo = xe_bo_create(fd, vm, bo_size,
> +		bo_size_prefetch = xe_bb_size(fd, bo_size);
> +		bo = xe_bo_create(fd, vm, bo_size_prefetch,
>  				  vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		map = xe_bo_map(fd, bo, bo_size);
>  	}
> +	padding = bo_size_prefetch - bo_size;
>  
>  	for (i = 0; i < n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> @@ -1001,19 +1003,19 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(map),
>  						 addr, bo_size / 2, NULL, 0);
>  			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(map) + bo_size / 2,
> -						 addr + bo_size / 2, bo_size / 2,
> +						 addr + bo_size / 2, bo_size / 2 + padding,
>  						 sync, 1);
>  		} else {
>  			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(map),
> -						 addr, bo_size, sync, 1);
> +						 addr, bo_size + padding, sync, 1);
>  		}
>  	} else {
>  		if (flags & LARGE_BIND_FLAG_SPLIT) {
>  			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size / 2, NULL, 0);
>  			xe_vm_bind_async(fd, vm, 0, bo, bo_size / 2, addr + bo_size / 2,
> -					 bo_size / 2, sync, 1);
> +					 bo_size / 2 + padding, sync, 1);
>  		} else {
> -			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size + padding, sync, 1);
>  		}
>  	}
>  
> @@ -1061,9 +1063,9 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_unbind_async(fd, vm, 0, 0, base_addr,
>  				   bo_size / 2, NULL, 0);
>  		xe_vm_unbind_async(fd, vm, 0, 0, base_addr + bo_size / 2,
> -				   bo_size / 2, sync, 1);
> +				   bo_size / 2 + padding, sync, 1);
>  	} else {
> -		xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size,
> +		xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size + padding,
>  				   sync, 1);
>  	}
>  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -- 
> 2.43.0
> 

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
