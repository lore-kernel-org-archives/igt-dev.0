Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8EACD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 11:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099C010E4FE;
	Tue, 26 Mar 2024 11:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbQ9ShO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002CE10E4FE
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451950; x=1742987950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7JQVMrBnqCRSG+ydRreOCz5qumUCVDw1c4b5irpyBRY=;
 b=HbQ9ShO/QixHV9yASpD2ZjKMlqeLZsLBqJq+HaU67IsxFf4FCOAIgTf7
 MkSpRW4FIKQ+M1qCUs7ahBLwLoAugPMtKJjsjC5WxNpvDg6bH+tx3Bj4O
 awyrpz6jsfEv46xLprHNCjZd5vYfAq+at3lHp24jwOuR4O++9S68ZORza
 UGq03wvtIZsHF9GZz+GVL+SBp13c5r7B1wSnYZ8sjdZstj/86iALFTQUN
 J0tvVpw1qAnfThtNu5mFh/tUJQ4tK7zuxLUL3BB2nAUIibw4Lb+IGzWpt
 pUXY6rQnGlYrbgIl1Etd6NnmXqhCjp3GN/21oXoy7zsCkk8U2AmX23pZo Q==;
X-CSE-ConnectionGUID: 7j3Sh+jmRPaNcyTd4YI/9A==
X-CSE-MsgGUID: Vdm/PPSzQzadsTfD1upKWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6362337"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6362337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20483048"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 04:19:04 -0700
Date: Tue, 26 Mar 2024 12:19:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t V3] tests/amd_basic:fix eviction test failure
Message-ID: <20240326111902.rj37niyehgeolj5a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240326023440.2460660-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240326023440.2460660-1-jesse.zhang@amd.com>
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
On 2024-03-26 at 10:34:40 +0800, Jesse Zhang wrote:

small nit to subject, please add space after ':', see

[PATCH i-g-t V3] tests/amd_basic:fix eviction test failure
--------------------------------^

This should be

tests/amd_basic: fix eviction test failure

Btw this can be done during merge.

Regards,
Kamil

> Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
> Fail error: "Starting subtest: eviction-test-with-IP-DMA
> Starting dynamic subtest: eviction_test
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:77:
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Cannot allocate memory
> (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 != 0
> Dynamic subtest eviction_test failed.
> 
> There is a case where the system size and gtt memory are smaller.
> When evicting vram to gtt or system memory, there is not enough gtt or memory system memory available for allocation.
> Therefore, try to reduce the use of gtt during initialization to meet the requirements for evicting vram.
> 
> V3: Provided an example in the code of exactly the numeric number (Vitaly)
>     Remove the space and empty line (Kamil)
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 70e45649d..8819b9cd4 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -358,6 +358,20 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  				   0, &vram_info);
>  	igt_assert_eq(r, 0);
>  
> +	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
> +				   0, &gtt_info);
> +	igt_assert_eq(r, 0);
> +
> +	/* For smaller gtt memory sizes, reduce gtt usage on initialization
> +	 * to satisfy eviction vram requirements. Example:
> +	 * gtt_info.heap_size 3036569600, gtt_info.max_allocation 2114244608  gtt_info.heap_usage 12845056
> +	 * gtt_info.heap_size 2895 mb, gtt_info.max_allocation 2016 mb gtt_info.heap_usage 12 mb
> +	 * vram_info.heap_size 2114244608, vram_info.max_allocation 2114244608 vram_info.heap_usage 26951680
> +	 * vram_info.heap_size 2016 mb, vram_info.max_allocation 2016 mb vram_info.heap_usage 25 mb
> +	 */
> +	if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_allocation)
> +		gtt_info.max_allocation /=3;
> +
>  	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
>  				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
>  	igt_assert_eq(r, 0);
> @@ -365,10 +379,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
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
