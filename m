Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0338CD3ABFF
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5510E5E1;
	Tue, 12 Nov 2024 13:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmDJaewz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEC310E5E1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731417825; x=1762953825;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XDwsZyfe7h9bxojWe6qRHWTlWNUrjmjB/ned7NfAWqA=;
 b=EmDJaewzOkeoqYr09IutdYakPU3PnsBbf//RGCfDmtpOlK+zWpJ5rQhq
 nxfsCXQmj9aEiRv9rKMVaBO1hhVlq3kM/O3UvnmUGyqVW417kXCfZI9rN
 WkQUoteXypaTliA1UVhKWvHVadkT9/cy5BFMfH4km2mhEKD1VuVNLNbVz
 SJ5hbe22lJ3CBaScXXR1lZfVMxM/tEIYw0nTCpDcGbmdjuR3C5qR5ZXAF
 DW7fKqpzCqjFQbD3H8jyqcau1tCBxMOmXtXaJoqVUiGrSAg8B+BorCZH4
 Z3nn2ONinNW8FbZbHg3Kit/ugbEbzBdtR9bjrkwThT0bXn28QYBaPRvRU A==;
X-CSE-ConnectionGUID: iEAjbt9QTgucFJAS6dzJtw==
X-CSE-MsgGUID: bE0IHwpCTJykf+xI/BaOHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34117262"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34117262"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:23:44 -0800
X-CSE-ConnectionGUID: 1U7ah6+CSH2cvw3P5FS0UQ==
X-CSE-MsgGUID: GMR7E2geTOGCh+Uc/r/6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92235623"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.134.205])
 ([10.245.134.205])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:23:43 -0800
Message-ID: <b4a64095-32eb-46db-9c10-3752612b95af@linux.intel.com>
Date: Tue, 12 Nov 2024 14:23:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 1/4] tests/intel/xe_exec_fault_mode: separate
 exec_sync and batch buffer
To: fei.yang@intel.com, igt-dev@lists.freedesktop.org
References: <20241108011041.2257553-1-fei.yang@intel.com>
 <20241108011041.2257553-2-fei.yang@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241108011041.2257553-2-fei.yang@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 11/8/2024 2:10 AM, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> In INVALIDATE cases the test purposely remap the data buffer to a
> different physical location in the midle of execution to exercise the
> page fault handling flow. After the remapping we lose access to the old
> physical location, and that would cause a problem for comparing ufence
> value at the end of the execution. To fix this the exec_sync data needs
> to be separated from the batch buffer for instructions, and during the
> execution we don't remap the exec_sync data.
>
> v2: Separate only exec_sync. Keep data field together with the batch
>     buffer (Matt Roper)
>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
Tested it locally
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 66 ++++++++++++++++++++++++--------
>  1 file changed, 50 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index d416c773b..ae40e099b 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -116,6 +116,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> +	uint64_t sync_addr = 0x101a0000;
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -128,15 +129,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> -	size_t bo_size;
> +	size_t bo_size, sync_size;
>  	uint32_t bo = 0;
>  	struct {
>  		uint32_t batch[16];
>  		uint64_t pad;
>  		uint64_t vm_sync;
> -		uint64_t exec_sync;
>  		uint32_t data;
>  	} *data;
> +	uint64_t *exec_sync;
>  	int i, j, b;
>  	int map_fd = -1;
>  
> @@ -151,6 +152,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
> +	sync_size = sizeof(*exec_sync) * n_execs;
> +	sync_size = xe_bb_size(fd, sync_size);
>  
>  	if (flags & USERPTR) {
>  #define	MAP_ADDRESS	0x00007fadeadbe000
> @@ -178,6 +181,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  	memset(data, 0, bo_size);
>  
> +#define EXEC_SYNC_ADDRESS	0x00007fbdeadbe000
> +	exec_sync = mmap((void *)EXEC_SYNC_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
> +			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_sync != MAP_FAILED);
> +	memset(exec_sync, 0, sync_size);
> +
>  	for (i = 0; i < n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXEC_QUEUE)
> @@ -212,6 +221,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		       bind_exec_queues[0], NSEC_PER_SEC);
>  	data[0].vm_sync = 0;
>  
> +	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> +				 to_user_pointer(exec_sync), sync_addr,
> +				 sync_size, sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues[0], NSEC_PER_SEC);
> +	data[0].vm_sync = 0;
> +
>  	if (flags & PREFETCH) {
>  		/* Should move to system memory */
>  		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> @@ -239,14 +255,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>  		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>  
> -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +		sync[0].addr = sync_addr + (char *)&exec_sync[i] - (char *)exec_sync;
>  
>  		exec.exec_queue_id = exec_queues[e];
>  		exec.address = batch_addr;
>  		xe_exec(fd, &exec);
>  
>  		if (flags & REBIND && i + 1 != n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +			xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
>  				       exec_queues[e], NSEC_PER_SEC);
>  			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
>  					   addr, bo_size, NULL, 0);
> @@ -275,7 +291,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 * physical memory on next mmap call triggering
>  				 * an invalidate.
>  				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> +				xe_wait_ufence(fd, &exec_sync[i],
>  					       USER_FENCE_VALUE, exec_queues[e],
>  					       NSEC_PER_SEC);
>  				igt_assert_eq(data[i].data, 0xc0ffee);
> @@ -311,48 +327,66 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		 * submission here. For RACE cases we need to wait for all submissions
>  		 * to complete because the GuC scheduling can be out of order, the
>  		 * completion of the last submission doesn't mean all submission are
> -		 * completed.
> +		 * completed. For REBIND cases we only need to wait for the last
> +		 * submission.
>  		 */
> -		j = (flags & INVALIDATE && !(flags & RACE)) ? n_execs - 1 : 0;
> +		j = ((flags & INVALIDATE && !(flags & RACE)) ||
> +		     (flags & REBIND)) ? n_execs - 1 : 0;
>  
>  		for (i = j; i < n_execs; i++) {
>  			int64_t timeout = NSEC_PER_SEC;
>  
>  			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
> -				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +				igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
>  							       exec_queues[i % n_exec_queues], &timeout), -EIO);
>  			else
> -				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +				igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
>  							       exec_queues[i % n_exec_queues], &timeout), 0);
>  		}
>  	}
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], NSEC_PER_SEC);
>  
>  	if (flags & INVALID_FAULT) {
>  		for (i = 0; i < n_execs; i++) {
>  			int ret;
>  			int64_t timeout = NSEC_PER_SEC;
>  
> -			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +			ret = __xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
>  					       exec_queues[i % n_exec_queues], &timeout);
>  			igt_assert(ret == -EIO || ret == 0);
>  		}
>  	} else if (!(flags & INVALID_VA)) {
> +		/*
> +		 * For INVALIDATE && RACE cases, due the the remmap in the
> +		 * middle of the execution, we lose access to some of the
> +		 * 0xc0ffee written to the old location, so check only for
> +		 * the second half of the submissions.
> +		 */
> +		if (flags & INVALIDATE && flags & RACE)
> +			j = n_execs / 2 + 1;
>  		for (i = j; i < n_execs; i++)
>  			igt_assert_eq(data[i].data, 0xc0ffee);
> -
>  	}
>  
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	data[0].vm_sync = 0;
> +	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, sync_addr, sync_size,
> +			   sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +		       bind_exec_queues[0], NSEC_PER_SEC);
> +	data[0].vm_sync = 0;
> +	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> +			   sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +		       bind_exec_queues[0], NSEC_PER_SEC);
> +
>  	for (i = 0; i < n_exec_queues; i++) {
>  		xe_exec_queue_destroy(fd, exec_queues[i]);
>  		if (bind_exec_queues[i])
>  			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
>  	}
>  
> +	munmap(exec_sync, sync_size);
> +
>  	if (bo) {
>  		munmap(data, bo_size);
>  		gem_close(fd, bo);
