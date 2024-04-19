Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18DCC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 16:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594D10E936;
	Fri, 19 Apr 2024 16:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIPYQxi2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE6310F8E2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713543525; x=1745079525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=giKMoww1Ht8u/CbnsqBQPOPe3qpN8mq4z2zKKg5Gt70=;
 b=IIPYQxi2AjZgTverh1w257rWjne5yCSYFEUjG4GmMhE8zAeQRf4y8LPW
 TbeXBTKT/P6rDzUnGpEeNf0M4nc/FOJbICcylaonbKNKTukBgcnQ/BqG4
 ohkGa5mTpgq0qnDtjMkTT8hhKOFbmhWUF/bTfc654jAB8onwEJ1ayzlW0
 ExWRA+UBfdli8RD7tqvedG9svjHcj/8I0kiFCoRFssAxnu5xYHaY66dTt
 5nT9EJ10vKm2h6RApXu/Il4F1L4vPlDN22UJFihE0ZIowkadGBOjqw5jI
 uwQo96BxlUZB/plNC2P3B/hgZzah+A57rOwkKav5F3YpnL2So1bbBKp3u w==;
X-CSE-ConnectionGUID: 0/l+E2W8RsWzaSui5F1yYQ==
X-CSE-MsgGUID: VH6vew7MRPyaRETK3Utsxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9012179"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9012179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:18:45 -0700
X-CSE-ConnectionGUID: 8ibUkfsNSKWA+NDdEHwW+w==
X-CSE-MsgGUID: s3ipidQjTomQ/Qh/CwMBpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23444167"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 09:18:43 -0700
Date: Fri, 19 Apr 2024 18:18:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t, v2 3/3] drm-uapi/xe: Restore flags
 VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
Message-ID: <20240419161840.cn7evukixoxziv3v@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240412142159.6-1-francois.dugast@intel.com>
 <20240412142159.6-4-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240412142159.6-4-francois.dugast@intel.com>
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

Hi Francois,
On 2024-04-12 at 14:21:59 +0000, Francois Dugast wrote:
> The commit ca4607939 ("drm/xe/uapi: Remove unused flags") is partially
> reverted. At the time, flags not used by user space were removed during
> cleanup. As a consequence, tests depending on those flags were also
> removed. Some of those flags are now needed by user space, so bring them
> back and the removed tests as well.
> 
> Align with kernel commit ("drm/xe/uapi: Restore flags \
> VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE").
> 
> v2: Fix missing period in kernel doc (Ashutosh Dixit)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h                |  8 +++
>  tests/intel-ci/xe-fast-feedback.testlist | 10 ++++
>  tests/intel/xe_exec_fault_mode.c         | 65 ++++++++++++++++++++----
>  tests/intel/xe_vm.c                      | 16 ++++--
>  4 files changed, 85 insertions(+), 14 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index d8816df83..0b709b374 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -871,6 +871,12 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>   *
>   * and the @flags can be:
> + *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
> + *    to ensure write protection
> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
> + *    MAP operation immediately rather than deferring the MAP to the page
> + *    fault handler. This is implied on a non-faulting VM as there is no
> + *    fault handler to defer to.
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> @@ -963,6 +969,8 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> +#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  	/** @flags: Bind flags */
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f9dbf5705..c57706f25 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -223,6 +223,16 @@ igt@xe_exec_fault_mode@twice-bindexecqueue-userptr
>  igt@xe_exec_fault_mode@twice-bindexecqueue-rebind
>  igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind
>  igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate
> +igt@xe_exec_fault_mode@twice-basic-imm
> +igt@xe_exec_fault_mode@twice-userptr-imm
> +igt@xe_exec_fault_mode@twice-rebind-imm
> +igt@xe_exec_fault_mode@twice-userptr-rebind-imm
> +igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
>  igt@xe_exec_fault_mode@twice-basic-prefetch
>  igt@xe_exec_fault_mode@twice-userptr-prefetch
>  igt@xe_exec_fault_mode@twice-rebind-prefetch
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 40fe1743e..9f8cda289 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -29,10 +29,11 @@
>  #define INVALIDATE	(0x1 << 2)
>  #define RACE		(0x1 << 3)
>  #define BIND_EXEC_QUEUE	(0x1 << 4)
> -#define PREFETCH	(0x1 << 5)
> -#define INVALID_FAULT	(0x1 << 6)
> -#define INVALID_VA	(0x1 << 7)
> -#define ENABLE_SCRATCH  (0x1 << 8)
> +#define IMMEDIATE	(0x1 << 5)
> +#define PREFETCH	(0x1 << 6)
> +#define INVALID_FAULT	(0x1 << 7)
> +#define INVALID_VA	(0x1 << 8)
> +#define ENABLE_SCRATCH  (0x1 << 9)
>  
>  /**
>   * SUBTEST: invalid-va
> @@ -75,6 +76,21 @@
>   *					bindexecqueue userptr invalidate
>   * @bindexecqueue-userptr-invalidate-race:
>   *					bindexecqueue userptr invalidate race
> + * @basic-imm:				basic imm
> + * @userptr-imm:			userptr imm
> + * @rebind-imm:				rebind imm
> + * @userptr-rebind-imm:			userptr rebind imm
> + * @userptr-invalidate-imm:		userptr invalidate imm
> + * @userptr-invalidate-race-imm:	userptr invalidate race imm
> + * @bindexecqueue-imm:			bindexecqueue imm
> + * @bindexecqueue-userptr-imm:		bindexecqueue userptr imm
> + * @bindexecqueue-rebind-imm:		bindexecqueue rebind imm
> + * @bindexecqueue-userptr-rebind-imm:
> + *					bindexecqueue userptr rebind imm
> + * @bindexecqueue-userptr-invalidate-imm:
> + *					bindexecqueue userptr invalidate imm
> + * @bindexecqueue-userptr-invalidate-race-imm:
> + *					bindexecqueue userptr invalidate race imm
>   * @basic-prefetch:			basic prefetch
>   * @userptr-prefetch:			userptr prefetch
>   * @rebind-prefetch:			rebind prefetch
> @@ -170,12 +186,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> +	if (flags & IMMEDIATE) {
> +		if (bo)
> +			xe_vm_bind_async_flags(fd, vm, bind_exec_queues[0], bo, 0,
> +					       addr, bo_size, sync, 1,
> +					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +		else
> +			xe_vm_bind_userptr_async_flags(fd, vm, bind_exec_queues[0],
> +						       to_user_pointer(data),
> +						       addr, bo_size, sync, 1,
> +						       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> +	} else {
> +		if (bo)
> +			xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
>  					 bo_size, sync, 1);
> +		else
> +			xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> +						 to_user_pointer(data), addr,
> +						 bo_size, sync, 1);
> +	}
> +
>  #define ONE_SEC	MS_TO_NS(1000)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], ONE_SEC);
> @@ -336,6 +366,23 @@ igt_main
>  			INVALIDATE },
>  		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
>  			INVALIDATE | RACE },
> +		{ "basic-imm", IMMEDIATE },
> +		{ "userptr-imm", IMMEDIATE | USERPTR },
> +		{ "rebind-imm", IMMEDIATE | REBIND },
> +		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND },
> +		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE },
> +		{ "userptr-invalidate-race-imm", IMMEDIATE | USERPTR |
> +			INVALIDATE | RACE },
> +		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE },
> +		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE | USERPTR },
> +		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE | REBIND },
> +		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> +			USERPTR | REBIND },
> +		{ "bindexecqueue-userptr-invalidate-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> +			USERPTR | INVALIDATE },
> +		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
> +			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
> +
>  		{ "basic-prefetch", PREFETCH },
>  		{ "userptr-prefetch", PREFETCH | USERPTR },
>  		{ "rebind-prefetch", PREFETCH | REBIND },
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index ecb2a783c..968f864f6 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1799,6 +1799,16 @@ static void bind_flag_invalid(int fd)
>  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>  	syncobj_reset(fd, &sync[0].handle, 1);
>  
> +	bind.bind.flags = DRM_XE_VM_BIND_FLAG_READONLY;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +
> +	bind.bind.flags = DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +
>  	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
>  	bind.bind.obj = 0;
>  	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> @@ -1812,11 +1822,7 @@ static void bind_flag_invalid(int fd)
>  	syncobj_reset(fd, &sync[0].handle, 1);
>  
>  	/* Using invalid flags should not work */
> -	bind.bind.flags = 1 << 0;

Why not 14? That way we could have fewer changes here.

> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> -
> -	bind.bind.flags = 1 << 1;
> +	bind.bind.flags = 1 << 4;

Wy not 15 for invalid flag? So we will not change it soon.

These are minors so with that changed or not,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
>  	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
>  
> -- 
> 2.34.1
> 
