Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEAECA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 15:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678F710EBFC;
	Fri,  5 Sep 2025 15:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhD0iMYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C44B10EBFC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757087727; x=1788623727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d8WlnAqX7wivqw8eZODXFp7x3a5md00l0BGexdf2A50=;
 b=bhD0iMYTNl/8ZTIYJ0m4XM08UFXwt14YAqPn7bmXhIXN0xySiYlRGmWD
 2rdmRJ2Qbh6E/bRrgsthKGIcxXwjhxo8oXIketV/WQIRHF/eYd1AaCPMg
 9k8eiYtFNwoCyYK6Ep29oYxpTdF2rePeEuYd9aFQiRO7rVkLnX14cG7gd
 Ud+B4n2FQnwMYigebeD7XrV/vZCAow0dFKb/o8pS57hM5MyqpK0FcPj+7
 qjKzcHOyWYKJj+tHUcSiTdyTbaQHPx7NpeAcfJyNS38jOIxMtVOks82Nz
 xdZHP+EOq9qx8X8FLTRb5eWk/bR8NpAU46mRYMwQxmV03QTIGGs+Gmrbe w==;
X-CSE-ConnectionGUID: lnmm+ADmQ9mRN5+/ZpgCPw==
X-CSE-MsgGUID: CHh7WZfTSXuAjbsj9uzKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59514780"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59514780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:55:26 -0700
X-CSE-ConnectionGUID: g1+C1YpLROqTDEpKXsJv2A==
X-CSE-MsgGUID: mZ5F8PuTS8CwmxQy2zaLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="176532983"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 08:55:25 -0700
Date: Fri, 5 Sep 2025 17:55:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v12 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Message-ID: <20250905155523.zcrfgjutdh6wh3qm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
 <20250904082701.2154029-5-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904082701.2154029-5-nishit.sharma@intel.com>
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
On 2025-09-04 at 08:27:00 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>

imho subject should not mension 'swizzle', so better:

[PATCH v12 4/5] tests/intel/xe_exec_system_allocator: Add madvise subtests

> 
> madvise-swizzle test introduced which is called in combination with other

I do not see madvise-swizzle tests, is it a name of a kernel
function you want to test? imho rather than that you could name
all new tests you added.

> tests as well. In this test the buffer object preferred location is
> system memory.

Seems inconsistent, in next sentence you wrote about changing it
in loop between system and device mem.

> MADVISE_SWIZZLE called in main loop to toggle between

You do not need to write flag name here.

> SYSTEM/DEVICE on each pass.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e7f3d423a..8d9696a33 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -777,6 +777,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  #define PROCESSES		(0x1 << 24)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define MADVISE_SWIZZLE			(0x1 << 27)
>  
>  #define N_MULTI_FAULT		4
>  
> @@ -885,7 +886,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation

s/perfoems/performs/

>   * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
> + * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
>   * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
>   * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> @@ -897,6 +900,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap:				mmap single buffer for all execs
>   * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
>   * @mmap-remap:				mmap and mremap a buffer for all execs
> + * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
>   * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
>   * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
>   * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
> @@ -916,16 +920,20 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
>   * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
>   * @free:				malloc and free buffer for each exec
> + * @free-madvise:			malloc and free buffer for each exec, performs madvise operation
>   * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
>   * @new:				malloc a new buffer for each exec
> + * @new-madvise:			malloc a new buffer for each exec, performs madvise operation
>   * @new-prefetch:			malloc a new buffer and prefetch for each exec
>   * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
>   * @new-bo-map:				malloc a new buffer or map BO for each exec
>   * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
>   * @mmap-free:				mmap and free buffer for each exec
> + * @mmap-free-madvise:			mmap and free buffer for each exec, performs madvise operation
>   * @mmap-free-huge:			mmap huge page and free buffer for each exec
>   * @mmap-free-race:			mmap and free buffer for each exec with race between cpu and gpu access
>   * @mmap-new:				mmap a new buffer for each exec
> + * @mmap-new-madvise:			mmap a new buffer for each exec and perform madvise operation
>   * @mmap-new-huge:			mmap huge page a new buffer for each exec
>   * @mmap-new-race:			mmap a new buffer for each exec with race between cpu and gpu access
>   * @malloc-nomemset:			malloc single buffer for all execs, skip memset of buffers
> @@ -999,6 +1007,23 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>  
> +static void
> +madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
> +		size_t bo_size, uint64_t addr, int index)

Align.

> +{
> +	int preferred_loc;
> +
> +	if (index % 2 == 0)

imho safer:

	if ((index % 2) == 0)

> +		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
> +	else
> +		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +
> +	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,

Align

> +			preferred_loc,

Align

> +			0);

Align

Regards,
Kamil

> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
> @@ -1210,6 +1235,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>  
> +		if (flags & MADVISE_SWIZZLE)
> +			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr, i);
> +
>  		if (flags & MULTI_FAULT) {
>  			b = 0;
>  			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
> @@ -1790,7 +1818,9 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	const struct section sections[] = {
>  		{ "malloc", 0 },
> +		{ "malloc-madvise", MADVISE_SWIZZLE },
>  		{ "malloc-prefetch", PREFETCH },
> +		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_SWIZZLE },
>  		{ "malloc-multi-fault", MULTI_FAULT },
>  		{ "malloc-fork-read", FORK_READ },
>  		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> @@ -1802,6 +1832,7 @@ igt_main
>  		{ "mmap", MMAP },
>  		{ "mmap-prefetch", MMAP | PREFETCH },
>  		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_SWIZZLE },
>  		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
>  		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
>  		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> @@ -1828,16 +1859,20 @@ igt_main
>  		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
>  		{ "mmap-race", MMAP | RACE },
>  		{ "free", NEW | FREE },
> +		{ "free-madvise", NEW | FREE | MADVISE_SWIZZLE },
>  		{ "free-race", NEW | FREE | RACE },
>  		{ "new", NEW },
> +		{ "new-madvise", NEW | MADVISE_SWIZZLE },
>  		{ "new-prefetch", NEW | PREFETCH },
>  		{ "new-race", NEW | RACE },
>  		{ "new-bo-map", NEW | BO_MAP },
>  		{ "new-busy", NEW | BUSY },
>  		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free-madvise", MMAP | NEW | FREE | MADVISE_SWIZZLE },
>  		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
>  		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
>  		{ "mmap-new", MMAP | NEW },
> +		{ "mmap-new-madvise", MMAP | NEW | MADVISE_SWIZZLE },
>  		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
>  		{ "mmap-new-race", MMAP | NEW | RACE },
>  		{ "malloc-nomemset", SKIP_MEMSET },
> -- 
> 2.43.0
> 
