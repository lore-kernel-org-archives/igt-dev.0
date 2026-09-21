Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7337DC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 15:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077A610E8A0;
	Mon, 21 Sep 2026 15:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+3xXXhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7481410E8A0
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790005118; x=1821541118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qspLpyVY+2FbGx+mxPeQoSPt8IHojjJ0RfdYQ8KrOWk=;
 b=J+3xXXhQrAD1CQVlO7NWbpyq4ZuuFnLULvwhIE7/CNXVs8CnKNzLyng0
 maQ8WWDgJ1jFBW5hK12BWa0xDXTmiSis8d6yCF9aoSg3UYexANKZiemI9
 cHc9Qdvz4zmel/jYG4n0CNGGqRu5eqrdqrdBHtt+ZZjYuOAJKg153obt2
 0jIxNwhJoK8M90Eatf3qgrhyH3j7YUJvr/Tj4aZ4BAG+WHdTVrO13Hj1N
 KKSQomNNnt0ZayL6Ud9gBijp6NOpf47MVzF7fqKCDKT+0ZGqENuwM45mb
 wFdzVTJg9w2FVhc/+tufYPdYZRNALPVMbvhpjgcEtGNBywKNGUSYpEPag A==;
X-CSE-ConnectionGUID: KWik7n2CR2GGApcxdMv1wg==
X-CSE-MsgGUID: aOK2fhOBRLS6GsxJ/DGEBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101884853"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="101884853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 08:38:38 -0700
X-CSE-ConnectionGUID: 3c9BOnkHRhqDL5brOXEaew==
X-CSE-MsgGUID: UbeqsW8VRrup7kMeXwA5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="269222653"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:38:37 -0700
Date: Mon, 21 Sep 2026 17:38:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jia Yao <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com
Subject: Re: [PATCH] tests/xe_exec_system_allocator: skip huge-page
 multi-process tests when memory is low
Message-ID: <20260921153834.aqh546y7gr5xqyxt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jia Yao <jia.yao@intel.com>, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com
References: <20260917230748.1825181-1-jia.yao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917230748.1825181-1-jia.yao@intel.com>
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

Hi Jia,
On 2026-09-17 at 23:07:48 +0000, Jia Yao wrote:

I didn't looked into you patch, only few nits,
first about subject, please add 'intel/' prefix, so it will be

[PATCH] tests/intel/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low

> The process-many-stride-mmap-new-huge subtest forks one child per GPU
> engine and, with the MMAP|NEW|HUGE_PAGE flag combination (without FREE),
> each child accumulates up to n_execs×SZ_2M of anonymous hugepage mmap
--------------------------------------^
please use ascii, better

each child accumulates up to n_execs * SZ_2M of anonymous hugepage mmap

> buffers before freeing them at cleanup.  On constrained systems the
> total peak memory (n_engines × n_execs × 2 MiB) can exhaust system

Same here, use ascii '*' for multiplication.

> RAM, trigger the OOM killer, and cause the surviving processes to time
> out waiting on fences (ETIME / errno=62) rather than failing cleanly.
> 
> Add igt_require_mem_kb() that skips when MemAvailable is below the
> estimated worst-case peak and call it in processes() for the
> MMAP|NEW|!FREE path before any children are forked.

Did you looked into Xe full results? It seems there are still an
error:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

but I do not know if your change should repaire it.

Regards,
Kamil

> 
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 305512dfd..1f57ab0a3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1173,6 +1173,28 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>  
> +/**
> + * igt_require_mem_kb:
> + * @needed_kb: minimum required free memory in kB
> + *
> + * Report whether MemAvailable is sufficient.  Used to avoid OOM kills in
> + * memory-hungry multi-process subtests (MMAP|NEW without FREE).
> + */
> +static bool igt_require_mem_kb(uint64_t needed_kb)
> +{
> +	/* igt_get_meminfo() returns bytes; convert to kB for comparison */
> +	uint64_t avail_kb = igt_get_meminfo("MemAvailable") >> 10;
> +
> +	if (avail_kb < needed_kb) {
> +		igt_info("Not enough memory: need %" PRIu64
> +			 " kB, have %" PRIu64 " kB; test not run\n",
> +			 needed_kb, avail_kb);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void
>  madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
>  			size_t bo_size, uint64_t addr, int index)
> @@ -2228,6 +2250,23 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	if (flags & HUGE_PAGE) {
>  		enable_hugepage();
>  		igt_require_hugepages();
> +
> +		/*
> +		 * MMAP|NEW without FREE accumulates up to n_execs hugepage
> +		 * buffers per child process (one per engine).  Each buffer is
> +		 * at least SZ_2M after the HUGE_PAGE alignment, so the worst
> +		 * case peak RSS is n_engines * n_execs * SZ_2M.  Skip early
> +		 * if free memory is insufficient to avoid OOM kills that turn
> +		 * the test into a timeout rather than a clean failure.
> +		 */
> +		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE)) {
> +			uint64_t n_engines = xe_number_engines(fd);
> +			uint64_t need_kb = n_engines * (uint64_t)n_execs *
> +					   (SZ_2M / 1024);
> +
> +			if (!igt_require_mem_kb(need_kb))
> +				return;
> +		}
>  	}
>  
>  	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
> -- 
> 2.43.0
> 
