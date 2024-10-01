Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52A2CE7D10
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 11:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C7110E154;
	Tue,  1 Oct 2024 11:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDowW9UT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278210E154
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727782763; x=1759318763;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=soojE7tD0XvHNVBvGJzg7s0OZgTLpySjJFRmtTCM6G0=;
 b=LDowW9UT1XeH9atz4smY3ns+kVUekH42pD+G4rNuQGqjakdWhbkTXCUy
 LoCJdGu2C0CXROoA/g7JUM+HunA1OcDLSJt4xMce5silWXIGOJ5aGXrOV
 SfXdIsR/I6uhFeZzED5vP+kG7C98YbIHmEVxe6O4s56iiJO1TUS/+qw+Z
 AmgaIACQtm1hqky0zQEP+bvBMpzUOg/+blk6aWQ2hb2q3HZTfFk2QyzZ/
 RKckcRmG2Bf/59MmqqVud1uPZE1vXkSySMowmbzMdij9MQSB4HMh4lyZu
 36xjb2K+5UyaHF/FPbNvz5XYqyjuUE9JXxOH1CerpyoWEy4ci21249As0 g==;
X-CSE-ConnectionGUID: 3briQvy9SCuWv0Inba224Q==
X-CSE-MsgGUID: izkOl+WASpK5Jc7a0bY+MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44374300"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="44374300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 04:39:12 -0700
X-CSE-ConnectionGUID: nFR5O8q2RMSF1CNcgBGFQg==
X-CSE-MsgGUID: WTm1yXbXQnKr5Jeq+jgSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78178402"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 04:39:13 -0700
Date: Tue, 1 Oct 2024 13:38:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH] tests/intel/xe_pm: Fix code style issues
Message-ID: <20241001113854.5ztv7vxubr7q6sqc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
References: <d779e0b6-46c7-4345-b9f9-75fe61e3cb2b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d779e0b6-46c7-4345-b9f9-75fe61e3cb2b@linux.intel.com>
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

Hi Peter,
On 2024-10-01 at 07:13:21 +0200, Peter Senna Tschudin wrote:
> Fix indentation and checkpatch issues that were mostly introduced by
> 8d2086223.
>

s/and checkpatch/and code style/

> CC: Kamil Konieczny <kamil.konieczny@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/xe_pm.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index b50d8dbc7..c57a4ec15 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -95,6 +95,7 @@ static void dpms_on_off(device_t device, int mode)
>  static bool runtime_usage_available(struct pci_device *pci)
>  {
>  	char name[PATH_MAX];
> +
>  	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
>  		 pci->domain, pci->bus, pci->dev, pci->func);
>  	return access(name, F_OK) == 0;
> @@ -215,7 +216,6 @@ static void close_fw_handle(int sig)
>  }
>  
>  #define MAX_VMAS 2
> -

Please keep this empty line here for better readability.

With this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  static void*
>  child_exec(void *arguments)
>  {
> @@ -267,7 +267,7 @@ child_exec(void *arguments)
>  
>  	if (args->flags & USERPTR) {
>  		data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
> -							 bo_size);
> +				     bo_size);
>  		memset(data, 0, bo_size);
>  	} else {
>  		if (args->flags & PREFETCH)
> @@ -284,7 +284,7 @@ child_exec(void *arguments)
>  
>  	for (i = 0; i < args->n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe, vm,
> -											  args->eci, 0);
> +						      args->eci, 0);
>  		bind_exec_queues[i] = 0;
>  		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
>  	};
> @@ -294,7 +294,7 @@ child_exec(void *arguments)
>  	if (bo) {
>  		for (i = 0; i < n_vmas; i++)
>  			xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bo,
> -							 0, addr + i * bo_size, bo_size, sync, 1);
> +					 0, addr + i * bo_size, bo_size, sync, 1);
>  	} else {
>  		xe_vm_bind_userptr_async(args->device.fd_xe, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr, bo_size, sync, 1);
> @@ -302,7 +302,7 @@ child_exec(void *arguments)
>  
>  	if (args->flags & PREFETCH)
>  		xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> -							 addr, bo_size, sync, 1, 0);
> +				     addr, bo_size, sync, 1, 0);
>  
>  	if (check_rpm) {
>  		igt_assert(in_d3(args->device, args->d_state));
> @@ -360,16 +360,16 @@ child_exec(void *arguments)
>  	}
>  
>  	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
> -			   INT64_MAX, 0, NULL));
> +				INT64_MAX, 0, NULL));
>  
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	if (n_vmas > 1)
>  		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync, 1);
>  	else
>  		xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> -						   addr, bo_size, sync, 1);
> +				   addr, bo_size, sync, 1);
>  	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
> -			   INT64_MAX, 0, NULL));
> +				INT64_MAX, 0, NULL));
>  
>  	for (i = 0; i < args->n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> @@ -449,8 +449,8 @@ child_exec(void *arguments)
>  /**
>   * SUBTEST: %s-%s-basic-exec
>   * Description:
> - *	Setup GPU on %arg[2] state then test exec on %arg[1] state
> - * 	without RPM
> + *    Setup GPU on %arg[2] state then test exec on %arg[1] state
> + *    without RPM
>   * Functionality: pm - %arg[1]
>   * GPU requirements: D3 feature should be supported
>   *
> @@ -468,7 +468,7 @@ child_exec(void *arguments)
>  /**
>   * SUBTEST: %s-vm-bind-%s
>   * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
> - * 		with vm bind %arg[2] combination
> + *              with vm bind %arg[2] combination
>   * Functionality: pm - %arg[1]
>   *
>   * arg[1]:
> @@ -499,8 +499,8 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
>  		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
>  		  unsigned int flags)
>  {
> -	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ? 
> -								SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> +				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  	struct drm_xe_engine_class_instance *eci;
>  	int active_threads = 0;
>  	pthread_t threads[65]; /* MAX_ENGINES + 1 */
> @@ -519,7 +519,7 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
>  		active_threads++;
>  
>  		pthread_mutex_lock(&child_ready_lock);
> -		while(!child_ready)
> +		while (!child_ready)
>  			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
>  		child_ready = false;
>  		pthread_mutex_unlock(&child_ready_lock);
> @@ -582,7 +582,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  		}
>  	}
>  
> -	threshold = vram_used_mb + (SIZE / 1024 /1024);
> +	threshold = vram_used_mb + (SIZE / 1024 / 1024);
>  	igt_require(threshold < vram_total_mb);
>  
>  	bo = xe_bo_create(device.fd_xe, 0, SIZE, placement, 0);
> -- 
> 2.34.1
> 
