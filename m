Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35911CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B816310E09D;
	Thu, 11 Jun 2026 14:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZxSA3B/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F8910E09D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781189572; x=1812725572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PEEXGFS7vTHDLrpOGTmlVSt1FZzHeZu6TUES6MDIMOg=;
 b=ZZxSA3B/owkm5mYwFa9wxNUcV/I5URgGhfuEBQajHmGRnwWJr5E9FIpH
 LMKlkLCD7TM48qypOS13CjRUevvyiXPhlHpIwqxv1TaJpvCjkqQ0pPN2f
 5z6gvytfiS927QCT3QzPGyqk/Tl/y+4KyTCEsE9FSOR0pGBerRR5lcyRp
 O/m7BjB5df1PpKGv6XKnSjOATpVipETVdLA2N7m8Wa1ngXrXxdVofsbM+
 HkbLBzhykCkbw+nXZ1Ik8zOLiFyTA3ysJigbvgpdpw7XcfiOYE43SfCz1
 bOxIQChRVvWCK7nsPVUAiuLKOIPgzozoSTHSlwiPL9KB+mWC1erFvKFLB g==;
X-CSE-ConnectionGUID: k/2YHFZIQiK0FzPP9g1k/A==
X-CSE-MsgGUID: z9aUPcA9TKGtqJrJu+pn+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85843092"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="85843092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:52:52 -0700
X-CSE-ConnectionGUID: XkxfJSD+Qzq/GEJhvBwszw==
X-CSE-MsgGUID: g3ZfKf44QVa864olu8DzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="248378637"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 07:52:50 -0700
Date: Thu, 11 Jun 2026 16:52:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: Re: [PATCH i-g-t v8] Add test for oversubscribing VRAM in multi
 process environment that creates VM, bind large BOs and submit workloads
 nearly simultaneously.
Message-ID: <20260611145248.sugdtfpejbbowcmt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
References: <20260609052220.358316-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609052220.358316-1-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-06-09 at 05:22:20 +0000, Sobin Thomas wrote:

please keep subject as in prevoius patches, now it is too long
and has no prefix, it shoule have

tests/intel/xe_vm: short description

Regards,
Kamil

> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
> 
> v2: Removed helper APIs usage clock_nanosleep and commented
> code.(Nishit)
> 
> v3: Refactored code to smaller functions.
>     Added check for available SRAM usage and keep the max process to 20.
> 
> v4: Remove explicit macros definition
>     Replace Bind ioctl with library calls.(Thomas)
> v5: Remove unused query_mem_info
>     Fix xe_exec_with_retry (Thomas)
>     Rename align_to_page_size with ALIGN macro (kamil/Thomas)
> v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
>     Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
>     detection, since igt_ioctl returns -1 on failure. (Thomas)
> v7:  Save errno immediately in create_test_bos before it can be clobbered.
>      Handle non-ENOMEM/ENOSPC failures in create_test_bos.
>      Remove dead code (retries == 0 check) in xe_exec_with_retry.
>      Add igt_skip when both vram and sram n_bufs are 0.
>      Add MAP_FAILED check on result_bo.ptr after xe_bo_map. (Nishit)
> v8: Add error check while performing vmbind.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_vm.c | 464 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 464 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 408bfdb71..ac2e335c0 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,7 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>  
>  enum overcommit_stage {
>  	EXPECT_NONE,
> @@ -29,6 +30,93 @@ enum overcommit_stage {
>  	EXPECT_EXEC,
>  };
>  
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {

Better struct mem_bind_array_sync {

Regards,
Kamil

[cut]
