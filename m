Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27911C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2B810E168;
	Mon, 25 Mar 2024 15:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mm50rnaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AE610E168
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711381856; x=1742917856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aZcVPz4y4ZGKQIfDfXJc17GjrQAxVCCmDXbdR7bseys=;
 b=mm50rnaRLEw702Z2CMZB07FKjDEUiB7THyMzLvG+6tMdc9FkOE4KhjQW
 5T+B17l7p7hJgwS3WqyLCiXuZqAy5lf/4CfO6OKotW/wc128MTIOdxKlL
 7TcxSfL9uJMGtKrKOiDHb8bMTOZjkBqbpxw0iU1B1bWDt8lrBWphGzlxE
 ujRhsIe4D+VC25irfV9YiGcEwPdpw5jAioeCRrzwMeH7RF2Dfz9qGXAr2
 mrvB4AGEOJ8KeIaIEhFoKP/3i4KZI4QYVhlme5uBcfEgt6ZjeoQenBGWt
 5fMlJ2BodRY+qG6CX0nG9sdozSUdWtN2AcVpVF0vwnOxzlx+o3FjLK74W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6988513"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6988513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16333561"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:50:55 -0700
Date: Mon, 25 Mar 2024 16:50:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t] tests/amd_basic: fix eviction test failure
Message-ID: <20240325155051.ppez4gsx6sh6r7m6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240325065534.2421803-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240325065534.2421803-1-jesse.zhang@amd.com>
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

Hi Jesse,
On 2024-03-25 at 14:55:34 +0800, Jesse Zhang wrote:

Please start with some introduction, then present error log.

>  Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
 ^^
Remove spaces/tabs from beginning of log.

>  Fail error: "Starting subtest: eviction-test-with-IP-DMA
>  Starting dynamic subtest: eviction_test
>  (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:77:
>  (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
>  (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Cannot allocate memory
>  (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 != 0
>  Dynamic subtest eviction_test failed.
> 
> There is a case where the system size and gtt memory are smaller.
> When evicting vram to gtt or system memory, there is not enough gtt or memory system memory available for allocation.
> Therefore, try to reduce the use of gtt during initialization to meet the requirements for evicting vram.
> 
>  Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
 ^^
No spaces before Cc: (here and below).

>  Cc: Alex Deucher <alexander.deucher@amd.com>
>  Cc: Christian Koenig <christian.koenig@amd.com>
>  Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
Remove empty line.

>  Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
 ^^
No spaces here.

Regards,
Kamil

> ---
>  tests/amdgpu/amd_basic.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 70e45649d..8adb8d696 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -340,6 +340,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
>  
>  	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
> +	uint64_t gtt_allocation;
>  
>  	igt_assert(ip_block);
>  
> @@ -358,6 +359,17 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  				   0, &vram_info);
>  	igt_assert_eq(r, 0);
>  
> +	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
> +				   0, &gtt_info);
> +	igt_assert_eq(r, 0);
> +
> +	/* For smaller gtt memory sizes, reduce gtt usage on initialization
> +	 * to satisfy eviction vram requirements */
> +	if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_allocation)
> +		gtt_allocation = gtt_info.max_allocation/3;
> +	else
> +		gtt_allocation = gtt_info.max_allocation;
> +
>  	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
>  	igt_assert_eq(r, 0);
> @@ -365,10 +377,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[1]);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
> -				   0, &gtt_info);
> -	igt_assert_eq(r, 0);
> -
>  	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
>  				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[0]);
>  	igt_assert_eq(r, 0);
> -- 
> 2.25.1
> 
