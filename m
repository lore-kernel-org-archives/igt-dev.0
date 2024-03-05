Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C46CC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 14:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBC1112B4B;
	Tue,  5 Mar 2024 14:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emLp+y4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF40112B56
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709649105; x=1741185105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QapeVivXWGoLptZLctmZZhixLhu4TFoALA0Un0H16I4=;
 b=emLp+y4nhx2ZIbdtgoRHym7FAY1P6RmOoBdAlXPHGiaIOGPM1nlhXAp/
 2E7njmIS+Dg036Ov7yZUwfuVk/coXIHN51i2Kpcxb7GfBQ8LurLoYBrvy
 4VlDJiUBbiJtK94JH4h3SVgipOca7dDOlNer8E5VTVbQoRgfdLTmZo0Ic
 2tFRg8IJREftYbLDOvYptsaCZCPo5HPvWRTMHlJPIsJcee6vajGghoFPk
 YWApagpqp8nzblIHEN1EEmTYc4hHPOe9UqIXXcib0O0B90V66ZzwrGZPi
 Q9SKO/1/ea+el9Z/N3lItqOKRPxE/YS/pK/cnWPv0YIasuPfCs5oDBzaz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15631484"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15631484"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9797294"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:31:43 -0800
Date: Tue, 5 Mar 2024 15:31:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: Re: [PATCH] xe_exec_compute_mode: Add malloc-ufence test
Message-ID: <20240305143140.wh2de353ldq6fldr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
References: <20240227023956.141475-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240227023956.141475-1-matthew.brost@intel.com>
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
On 2024-02-26 at 18:39:56 -0800, Matthew Brost wrote:
> The get user page ufence path is not triggered by the test as ufence
> memory is a mapped BO. To trigger this path use a malloc'd address.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 7dad715093..c0cddbc02b 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -31,6 +31,7 @@
>  #define BIND_EXECQUEUE		(0x1 << 4)
>  #define VM_FOR_BO			(0x1 << 5)
>  #define EXEC_QUEUE_EARLY	(0x1 << 6)
> +#define MALLOC_USER_FENCE		(0x1 <<7)
------------------------------------------ ^
Put space before 7:
#define MALLOC_USER_FENCE		(0x1 << 7)

>  
>  /**
>   * SUBTEST: twice-%s
> @@ -48,6 +49,7 @@
>   * arg[1]:
>   *
>   * @basic:				basic
> + * @malloc-ufence:			malloc user fence

You need this also for many-execqueues subtest below.

Regards,
Kamil

>   * @preempt-fence-early:		preempt fence early
>   * @userptr:				userptr
>   * @rebind:				rebind
> @@ -110,6 +112,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		uint64_t exec_sync;
>  		uint32_t data;
>  	} *data;
> +	uint64_t *vm_sync;
>  	int i, j, b;
>  	int map_fd = -1;
>  	int64_t fence_timeout;
> @@ -149,6 +152,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  	memset(data, 0, bo_size);
>  
> +	if (flags & MALLOC_USER_FENCE)
> +		vm_sync = malloc(sizeof(*vm_sync));
> +	else
> +		vm_sync = &data[0].vm_sync;
> +	igt_assert(vm_sync);
> +
>  	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXECQUEUE)
> @@ -158,7 +167,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			bind_exec_queues[i] = 0;
>  	};
>  
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	sync[0].addr = to_user_pointer(vm_sync);
>  	if (bo)
>  		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
>  				 bo_size, sync, 1);
> @@ -171,9 +180,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
>  
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], fence_timeout);
> -	data[0].vm_sync = 0;
> +	*vm_sync = 0;
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> @@ -202,7 +211,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
>  					   addr, bo_size, NULL, 0);
>  
> -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +			sync[0].addr = to_user_pointer(vm_sync);
>  			addr += bo_size;
>  			if (bo)
>  				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
> @@ -213,9 +222,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  							 to_user_pointer(data),
>  							 addr, bo_size, sync,
>  							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
>  				       bind_exec_queues[e], fence_timeout);
> -			data[0].vm_sync = 0;
> +			*vm_sync = 0;
>  		}
>  
>  		if (flags & INVALIDATE && i + 1 != n_execs) {
> @@ -264,10 +273,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & INVALIDATE)
>  		usleep(250000);
>  
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	sync[0].addr = to_user_pointer(vm_sync);
>  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
>  			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], fence_timeout);
>  
>  	for (i = j; i < n_execs; i++)
> @@ -288,6 +297,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	xe_vm_destroy(fd, vm);
>  	if (map_fd != -1)
>  		close(map_fd);
> +	if (flags & MALLOC_USER_FENCE)
> +		free(vm_sync);
>  }
>  
>  /**
> @@ -408,6 +419,7 @@ igt_main
>  		unsigned int flags;
>  	} sections[] = {
>  		{ "basic", 0 },
> +		{ "malloc-ufence", MALLOC_USER_FENCE },
>  		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
>  		{ "userptr", USERPTR },
>  		{ "rebind", REBIND },
> -- 
> 2.34.1
> 
