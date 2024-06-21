Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3213AC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 11:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B397D10F157;
	Fri, 21 Jun 2024 11:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McF7UcAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD710F157
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718968184; x=1750504184;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/m/RQMiF+NppS40shU+zMfx/wfKiUdGeUxSqYdaKaxo=;
 b=McF7UcAo1eNjnNIkHjzKtV0CiRwiQ0LLgUl0rueLl77YQLYgOfeWOL9Z
 bHtC7/jOxQ9MPDj92x5S3mYb7+m9eUMUJotQL6NVPEkUP8hgF7c602n1I
 xuaRvcgbzgOgVJHOowB2StVbcV8pnU10/osuAnF6N+ZELFj+OiLrRZjNf
 CLUx/63EaAoqF8OueDqTDhMI12ugZuTYeDoSTuo6d0UjuisydEdDJmxn7
 SyRriKgYPC9dNZqbtYBOh1Bq0m+Q3DoCZvl+hffMBDJtPn/utlul9fxkg
 YCmxDlLcmr7I3FYE83l6nASH4DjEkvn1HVDmI5COQdXI3Q6Nd6/nt7/bz w==;
X-CSE-ConnectionGUID: veTcK+YcTtqxN82C3PxnBg==
X-CSE-MsgGUID: yVtdxYTISBWoRuYrKe59Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16138589"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="16138589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 04:09:43 -0700
X-CSE-ConnectionGUID: xh1B7X6PQ2iyFcJ7iUmSKw==
X-CSE-MsgGUID: owyc7VmpT9SAzuKaBHbYoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="47477113"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.53])
 ([10.245.244.53])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 04:09:42 -0700
Message-ID: <96953a51-cb66-46cf-a346-065153ad01d1@intel.com>
Date: Fri, 21 Jun 2024 12:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xe_vm: Add bind array -ENOBUFS section
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20240620235437.3722232-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240620235437.3722232-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21/06/2024 00:54, Matthew Brost wrote:
> Add section which has a large enough array of binds which triggers BB
> suballocation failure. Verify -ENOBUFS is returned in this case.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

tests/intel/xe_vm: or similar for the commit title prefix.

> ---
>   lib/xe/xe_ioctl.c   | 19 +++++++++++++++++
>   lib/xe/xe_ioctl.h   |  4 ++++
>   tests/intel/xe_vm.c | 50 ++++++++++++++++++++++++++++++++++-----------
>   3 files changed, 61 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index a437fd828a..9072801ce1 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -115,6 +115,25 @@ void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
>   	igt_assert_eq(-errno, -ENOSPC);
>   }
>   
> +void xe_vm_bind_array_enobufs(int fd, uint32_t vm, uint32_t exec_queue,
> +			      struct drm_xe_vm_bind_op *bind_ops,
> +			      uint32_t num_bind, struct drm_xe_sync *sync,
> +			      uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind = {
> +		.vm_id = vm,
> +		.num_binds = num_bind,
> +		.vector_of_binds = (uintptr_t)bind_ops,
> +		.num_syncs = num_syncs,
> +		.syncs = (uintptr_t)sync,
> +		.exec_queue_id = exec_queue,
> +	};
> +
> +	igt_assert(num_bind > 1);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), -1);
> +	igt_assert_eq(-errno, -ENOBUFS);

I think we can replace with:

do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, ENOBUFS);

Do we really need this in lib/ ? Are we expecting other users?

Anyway, having a test like this to ensure we don't trigger any kernel 
warnings or similar makes sense to me,

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +}
> +
>   int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>   		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
>   		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 2c7506caaf..a9954d0d41 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -61,6 +61,10 @@ void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
>   			     struct drm_xe_vm_bind_op *bind_ops,
>   			     uint32_t num_bind, struct drm_xe_sync *sync,
>   			     uint32_t num_syncs);
> +void xe_vm_bind_array_enobufs(int fd, uint32_t vm, uint32_t exec_queue,
> +			      struct drm_xe_vm_bind_op *bind_ops,
> +			      uint32_t num_bind, struct drm_xe_sync *sync,
> +			      uint32_t num_syncs);
>   void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
>   			    uint32_t bo, struct drm_xe_sync *sync,
>   			    uint32_t num_syncs);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7be85da62f..b116d7da1b 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -728,7 +728,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>   }
>   
>   #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
> -
> +#define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
>   
>   /**
>    * SUBTEST: bind-array-twice
> @@ -741,6 +741,11 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>    * Functionality: bind exec_queues
>    * Test category: functionality test
>    *
> + * SUBTEST: bind-array-enobufs
> + * Description: Test bind array which too large are trigger -ENOBUFs error
> + * Functionality: bind exec_queues
> + * Test category: functionality test
> + *
>    * SUBTEST: bind-array-exec_queue-twice
>    * Description: Test bind array exec_queue twice
>    * Functionality: bind exec_queues
> @@ -753,10 +758,10 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>    */
>   static void
>   test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
> -		unsigned int flags)
> +		uint64_t addr, size_t bo_size, unsigned int flags)
>   {
>   	uint32_t vm;
> -	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
> +	uint64_t base_addr = addr;
>   	struct drm_xe_sync sync[2] = {
>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -766,9 +771,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   		.syncs = to_user_pointer(sync),
>   	};
>   	uint32_t exec_queue, bind_exec_queue = 0;
> -#define BIND_ARRAY_MAX_N_EXEC	16
> -	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC] = { };
> -	size_t bo_size;
> +	struct drm_xe_vm_bind_op *bind_ops;
>   	uint32_t bo = 0;
>   	struct {
>   		uint32_t batch[16];
> @@ -777,10 +780,11 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   	} *data;
>   	int i, b;
>   
> -	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
> +	bind_ops = malloc(sizeof(*bind_ops) * n_execs);
> +	igt_assert(bind_ops);
>   
>   	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = sizeof(*data) * n_execs;
> +	bo_size = bo_size ?: sizeof(*data) * n_execs;
>   	bo_size = xe_bb_size(fd, bo_size);
>   
>   	bo = xe_bo_create(fd, vm, bo_size,
> @@ -808,6 +812,22 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   	}
>   
>   	sync[0].handle = syncobj_create(fd, 0);
> +	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
> +		struct xe_cork cork;
> +
> +		xe_cork_init(fd, eci, &cork);
> +
> +		sync[1].handle = xe_cork_sync_handle(&cork);
> +		sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +
> +		xe_vm_bind_array_enobufs(fd, vm, bind_exec_queue, bind_ops,
> +					 n_execs, sync, 2);
> +		xe_cork_end(&cork);
> +		xe_cork_wait_done(&cork);
> +		xe_cork_fini(&cork);
> +		n_execs = n_execs / 2;
> +	}
> +
>   	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
>   
>   	addr = base_addr;
> @@ -867,6 +887,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   	munmap(data, bo_size);
>   	gem_close(fd, bo);
>   	xe_vm_destroy(fd, vm);
> +	free(bind_ops);
>   }
>   
>   /**
> @@ -2251,20 +2272,25 @@ igt_main
>   
>   	igt_subtest("bind-array-twice")
>   		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 2, 0);
> +			test_bind_array(fd, hwe, 2, 0x1a0000, 0, 0);
>   
>   	igt_subtest("bind-array-many")
>   		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 16, 0);
> +			test_bind_array(fd, hwe, 16, 0x1a0000, 0, 0);
> +
> +	igt_subtest("bind-array-enobufs")
> +		xe_for_each_engine(fd, hwe)
> +			test_bind_array(fd, hwe, 512, 0x1a0000, SZ_2M,
> +					BIND_ARRAY_ENOBUFS_FLAG);
>   
>   	igt_subtest("bind-array-exec_queue-twice")
>   		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 2,
> +			test_bind_array(fd, hwe, 2, 0x1a0000, 0,
>   					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
>   
>   	igt_subtest("bind-array-exec_queue-many")
>   		xe_for_each_engine(fd, hwe)
> -			test_bind_array(fd, hwe, 16,
> +			test_bind_array(fd, hwe, 16, 0x1a0000, 0,
>   					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
>   
>   	igt_subtest("bind-array-conflict")
