Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D09AFF886C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 08:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07910E31F;
	Tue, 28 Apr 2026 08:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGYoAIxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E885E10E31F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777366545; x=1808902545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2lyyAQc5B7811j2CIazS7GbUMb+qLc9YEGQMPSoSZwE=;
 b=eGYoAIxbl6owJBCo14s03SOGk1vv11UrNrHvj9CPY/IP9WSgVJdDODVV
 JC3fwBLIwsm+rFZ/KB048iBbZ3IYNUwIpwaOwDqF3y0yV1WFJVCs94FQ8
 OzmYSke6cQ/gE0S3P1sfLJmaQH7ZT4sTvpBg4lZxejC+LL76IBqs3oo9J
 kqvnxUUsqYedmJcvIINtJc8VwuOOI2iLRJPVWqv1Af0r8htDx88iFVWSO
 QII0KoR8qttrE4xH4NwaR6j8/2ZvsyPHTICNSNwZRYqC7irZIvPDlRWd8
 eGyH7JWv8pZs9GjJLt/O0cDL+Sa/zB1WbLGgng0S+holYumWM93FBMPjz w==;
X-CSE-ConnectionGUID: TX82UyyeSxuwmC8UOW+izw==
X-CSE-MsgGUID: 8xnJ7E4BQSqBjkooscZmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="100926714"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="100926714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:55:45 -0700
X-CSE-ConnectionGUID: Hd6DfY4NRLyTW0Q8wQ5mew==
X-CSE-MsgGUID: zbVrM7lpTAa8ZdPOipCG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="230745556"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:55:43 -0700
Date: Tue, 28 Apr 2026 10:55:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t v5] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
Message-ID: <20260428085541.acux6rtdysr7nj3n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260427024004.662789-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427024004.662789-1-sobin.thomas@intel.com>
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
On 2026-04-27 at 02:40:04 +0000, Sobin Thomas wrote:

small nit about subject, instead of
[PATCH i-g-t v5] test/intel/xe_vm:Add oversubscribe concurrent bind stress subtest

imho better s/:Add/: Add/ and s/concurrent//, so it will read
[PATCH i-g-t v5] test/intel/xe_vm: Add oversubscribe bind stress subtest

Regards,
Kamil

> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
> 
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
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_vm.c | 402 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 402 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index d75b0730d..5246a854a 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,71 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
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
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
[cut]
