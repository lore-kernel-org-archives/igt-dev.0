Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9479F9D0E8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 17:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DDA10E004;
	Tue, 14 Apr 2026 17:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QG3BCglM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE3F10E004
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776187677; x=1807723677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D41EHEf5wFMxUJQ9j3JlvPCvYr5fTCkdJqMzHB4VJJo=;
 b=QG3BCglMutYRSpcWmdh3wpDv9H+97Cw/qy91q7qqvEl6CnyM04bEn8k0
 KkafXqDTY+WjkZu4uMuatSauOLnBii9iZ/mpKcEPhhyVva/y1NPscSc2x
 N02xHcOx4Zlu6SMhzkc9tv5axfWztY0UYq6BHaCsmTZ7UFyjQ7lSsc8tS
 FuWayZCZczdPpftxLEbTAgFYK8wNmDXHEYA9u/iy+3Xu/LjOzOUcbWYJG
 wFNa+ZrFCq2sbSjQMZxsHmR9rDP9I6E/esfiP92zKW8U2Bh3qPY2HGmdR
 T8j6/UItJDPEvxBcrzy7FvStjUEe5Tu8NCVr2k+ZJC3T08ELUn6WeLL5a g==;
X-CSE-ConnectionGUID: Dcc/1ro9RDGfMSOiBQjgkQ==
X-CSE-MsgGUID: xmPfZReUS7yShxf2PUtnAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87459186"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87459186"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 10:27:56 -0700
X-CSE-ConnectionGUID: 3kX540yeSmy7Ce9cEr7fEA==
X-CSE-MsgGUID: /eOF2IwoQLy9kIYZVENybw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235095143"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 10:27:55 -0700
Date: Tue, 14 Apr 2026 19:27:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t v3 1/1] test/intel/xe_vm:Add oversubscribe
 concurrent bind stress subtest
Message-ID: <20260414172752.vjwgjx6ufx7rhpdy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260413043318.17931-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413043318.17931-1-sobin.thomas@intel.com>
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
On 2026-04-13 at 04:33:18 +0000, Sobin Thomas wrote:

small nit about subject, add space after ':' so it will be:

[PATCH i-g-t v3 1/1] test/intel/xe_vm: Add oversubscribe concurrent bind stress subtest

Few more nits below.

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
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_vm.c | 433 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 433 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index d75b0730d..42effbd48 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -19,8 +19,100 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include <inttypes.h>
>  #include <string.h>

Could you move both to proper place?

>  
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
> +#define MAX_THREADS 20
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	int fd;
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +	uint16_t sram_instance;
> +	uint16_t vram_instance;
> +	bool has_vram;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +static uint64_t align_to_page_size(uint64_t size)

Here imho add this as param or rename to explicit 4K:

static uint64_t align_to_4K_page_size(uint64_t size)

or

static uint64_t align_to_page_size(uint64_t size, uint64_t page_size)

> +{
> +	return (size + 4095UL) & ~4095UL;
> +}
> +

Regards,
Kamil 

[cut]
