Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C7CD3ABFF
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43F510E16A;
	Tue, 12 Nov 2024 13:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V21UTx2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0610B10E16A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731417793; x=1762953793;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7XaWduOTzYNYkXGq0BfMI+IAeOqE70ZqOFWaMqtypG8=;
 b=V21UTx2zR+KXDfFbJB8qSD0XJUUkFiV0DgGmaBg6tuawCLU9GYqm4wnN
 /u7FfqVJLcOiweWr4U69BJM3ohWGiv8eEfUxQbxf/FMZBLqkgQ0+5G2rG
 5+ZIFpNwDvknFmdE5w5YgbIzwUsCzgmgikhAyYD5K9uaBmj1FvGb6Zoe0
 uty0gpWu1QfUr4PGM2u3+4JDnV9iDiS9YK8T6Cdam8gZuAzC3Ego+bxBL
 VTHE+HFXI6ocgKy0kaaVFUh522CjUAq3JcPoUcOBVO71wgdQr22GFZyE6
 lIjAETx98BIiGoiuOupngC3S+H7UBGtmaVKhQ9oOwGfHDVO5OlxF9QqL6 g==;
X-CSE-ConnectionGUID: nADmOz+EQbaJYkUZssWRSg==
X-CSE-MsgGUID: 8OxHGdQOSwCAW/o9lzGKYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34117195"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34117195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:23:12 -0800
X-CSE-ConnectionGUID: WUcj12wgT96ePiRuel7Qsg==
X-CSE-MsgGUID: yiPqj0ruTtqBFpWHDKBd/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92235553"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.134.205])
 ([10.245.134.205])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:23:10 -0800
Message-ID: <210f5c47-4ae0-4273-aa1a-a33922a5f8c0@linux.intel.com>
Date: Tue, 12 Nov 2024 14:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 4/4] tests/intel/xe_exec_threads: separate exec_sync
 and batch buffer
To: fei.yang@intel.com, igt-dev@lists.freedesktop.org
References: <20241108011041.2257553-1-fei.yang@intel.com>
 <20241108011041.2257553-5-fei.yang@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241108011041.2257553-5-fei.yang@intel.com>
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
>  tests/intel/xe_exec_threads.c | 55 +++++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 19 deletions(-)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 433f2620a..661117bed 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -241,6 +241,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		  struct drm_xe_engine_class_instance *eci,
>  		  int n_exec_queues, int n_execs, unsigned int flags)
>  {
> +	uint64_t sync_addr = addr + 0x10000000;
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -253,15 +254,15 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	};
>  	int64_t fence_timeout;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
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
>  	bool owns_vm = false, owns_fd = false;
> @@ -280,6 +281,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
> +	sync_size = sizeof(*exec_sync) * n_execs;
> +	sync_size = xe_bb_size(fd, sync_size);
>  
>  	if (flags & USERPTR) {
>  		if (flags & INVALIDATE) {
> @@ -301,6 +304,12 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	}
>  	memset(data, 0, bo_size);
>  
> +	exec_sync = mmap(from_user_pointer(userptr + 0x10000000),
> +			 sync_size, PROT_READ | PROT_WRITE,
> +			 MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_sync != MAP_FAILED);
> +	memset(exec_sync, 0, sync_size);
> +
>  	for (i = 0; i < n_exec_queues; i++)
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  
> @@ -312,9 +321,12 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  	else
>  		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
> -
>  	fence_timeout = (igt_run_in_simulation() ? 30 : 3) * NSEC_PER_SEC;
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
> +	data[0].vm_sync = 0;
>  
> +	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(exec_sync),
> +				 sync_addr, sync_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>  	data[0].vm_sync = 0;
>  
> @@ -333,7 +345,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>  		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>  
> -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +		sync[0].addr = sync_addr + (char *)&exec_sync[i] - (char *)exec_sync;
>  
>  		exec.exec_queue_id = exec_queues[e];
>  		exec.address = batch_addr;
> @@ -341,7 +353,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  		if (flags & REBIND && i && !(i & 0x1f)) {
>  			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
> -				xe_wait_ufence(fd, &data[j].exec_sync,
> +				xe_wait_ufence(fd, &exec_sync[j],
>  					       USER_FENCE_VALUE,
>  					       exec_queues[e], fence_timeout);
>  			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
> @@ -371,7 +383,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  				 * an invalidate.
>  				 */
>  				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
> -					xe_wait_ufence(fd, &data[j].exec_sync,
> +					xe_wait_ufence(fd, &exec_sync[j],
>  						       USER_FENCE_VALUE,
>  						       exec_queues[e],
>  						       fence_timeout);
> @@ -409,16 +421,9 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		/*
>  		 * For !RACE cases xe_wait_ufence has been called in above for-loop
>  		 * except the last batch of submissions. For RACE cases we will need
> -		 * to wait for the second half of the submissions to complete. There
> -		 * is a potential race here because the first half submissions might
> -		 * have updated the fence in the old physical location while the test
> -		 * is remapping the buffer from a different physical location, but the
> -		 * wait_ufence only checks the fence from the new location which would
> -		 * never be updated. We have to assume the first half of the submissions
> -		 * complete before the second half. Will have a follow up patch to fix
> -		 * this completely.
> +		 * to wait for all submissions to complete.
>  		 */
> -		j = (flags & RACE) ? (n_execs / 2 + 1) : (((n_execs - 1) & ~0x1f) + 1);
> +		j = (flags & RACE) ? 0 : (((n_execs - 1) & ~0x1f) + 1);
>  	else if (flags & REBIND)
>  		/*
>  		 * For REBIND cases xe_wait_ufence has been called in above for-loop
> @@ -427,19 +432,31 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		j = ((n_execs - 1) & ~0x1f) + 1;
>  
>  	for (i = j; i < n_execs; i++)
> -		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +		xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
>  			       exec_queues[i % n_exec_queues], fence_timeout);
>  
> +	/*
> +	 * For INVALIDATE && RACE cases, due the the remmap in the
> +	 * middle of the execution, we lose access to some of the
> +	 * 0xc0ffee written to the old location, so check only for
> +	 * the second half of the submissions.
> +	 */
> +	if (flags & INVALIDATE && flags & RACE)
> +		j = n_execs / 2 + 1;
> +	for (i = j; i < n_execs; i++)
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, sync_addr, sync_size, sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
> +	data[0].vm_sync = 0;
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>  
> -	for (i = j; i < n_execs; i++)
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> -
>  	for (i = 0; i < n_exec_queues; i++)
>  		xe_exec_queue_destroy(fd, exec_queues[i]);
>  
> +	munmap(exec_sync, sync_size);
>  	if (bo) {
>  		munmap(data, bo_size);
>  		gem_close(fd, bo);
