Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D882ECD98CE
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 15:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1F710E7D9;
	Thu, 11 Jun 2026 15:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xe2Cglgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4800910E7D9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781193291; x=1812729291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ZL5O6ZCrrUiriMLdKAVNprBdajMfWu438Er/aC7HKA=;
 b=Xe2CglgqImx7CfHF5WeJvCi6Kshu42Zacj05IS20CfsuHAakL7ZioTEL
 5LzlTLQxAbnCOwmfJcspGAsIB0oDSYHQLYhf7/op/d0bGeqmvozHI7hWq
 5m5feKr+HB2Sk6x29DwvvgHLWbEH2pszHehnV8oLnNM+gNjhSFx1km6kI
 lgSmLeIMgNebQmBusCFv4fOu4SwvAkOhb1iXjntNijk5awiwuha1ki5jg
 FX/CM2JAkqkHjjGqWXJfikt03kxor9gi1CygjqKqgfGFg3QXm65FXJ16W
 VDd1rb3UUEakqYXND+jEsYWFYVZlITWnVsmWPAHTw5qmNbrpfelNdTCYF g==;
X-CSE-ConnectionGUID: m9vWOjalTJmHHsX0YEbLqg==
X-CSE-MsgGUID: vAQR/JmRT3mO2DYPTcFuMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93498038"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93498038"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 08:54:50 -0700
X-CSE-ConnectionGUID: An3mfNKqRO6BiCcIlpY0BA==
X-CSE-MsgGUID: uQrpmx4cQ8+mW0mgq8OsEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="276711133"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:54:49 -0700
Date: Thu, 11 Jun 2026 17:54:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: Re: [i-g-t] tests/intel/xe_madvise: Skip purge tests under low RAM
Message-ID: <20260611155446.kiso6cph53arklnl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
References: <20260610080206.1470008-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610080206.1470008-1-arvind.yadav@intel.com>
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

Hi Arvind,
On 2026-06-10 at 13:32:06 +0530, Arvind Yadav wrote:
> The purge tests create memory pressure to trigger BO eviction. If the
> system is already low on RAM, this extra pressure can push the machine
> into OOM and kill the test before it can clean up.
> 
> Check available RAM before starting the pressure allocation and skip when
> there is not enough memory.
> 
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  tests/intel/xe_madvise.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index cdb115d7e..f9e2c4735 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -83,7 +83,7 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>  static void trigger_memory_pressure(int fd)
>  {
>  	uint64_t mem_size, overpressure;
> -	const uint64_t chunk = 8ull << 20; /* 8 MiB */
> +	const uint64_t chunk = 8ULL << 20; /* 8 MiB */
>  	int max_objs, n = 0;
>  	uint32_t *handles;
>  	uint64_t total;
> @@ -98,14 +98,18 @@ static void trigger_memory_pressure(int fd)
>  
>  	/* dGPU: fill VRAM + 50 % to force TTM eviction */
>  	mem_size = xe_visible_vram_size(fd, 0);
> -	overpressure = mem_size / 2;
> -	if (overpressure < (64 << 20))
> -		overpressure = 64 << 20;
> +	overpressure = max_t(uint64_t, mem_size / 2, 64ULL << 20);

imho this is no-op, you will alwayes get 'mem_size / 2' for dGPU.
Maybe just add igt_require(mem_size)?

> +	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
> +
> +	/*
> +	 * Pressure BOs are faulted in and kept alive until cleanup. If the
> +	 * system is already low on RAM, this can cause OOM.
> +	 */

Can we just lower how much VRAM will be requested? For example
fill VRAM + 10%

> +	igt_require_memory(max_objs, chunk, CHECK_RAM);

So you need to get size of system memory and adjust overpressure,
but that can be postponed after this change will be merged.

Regards,
Kamil

>  
>  	/* Separate VM so pressure BOs don't interfere with the test */
>  	vm = xe_vm_create(fd, 0, 0);
>  
> -	max_objs = (mem_size + overpressure) / chunk + 1;
>  	handles = malloc(max_objs * sizeof(*handles));
>  	igt_assert(handles);
>  
> -- 
> 2.43.0
> 
