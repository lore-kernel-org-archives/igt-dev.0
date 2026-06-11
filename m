Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C63CD98CE
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BFA10EF4D;
	Thu, 11 Jun 2026 14:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1datlE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4240810EF4D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781186460; x=1812722460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2ZeK+qShK4A26oX322wHiDcs6qLohqF8yN/RvQpEG7E=;
 b=Q1datlE3soYE/gUaYRAvzhx55sqkrZJO2iVhpnZOTl7PtcBf6NAoRH0D
 7J8pB1ETUSYk3Z2mo1gxT98h6EgIU+LdrF+bwOSwiq6suNDqGYHtmyR1H
 B+UYLxvspg2yD3OaHTZC2axO1s059b0Czo306RaaRD3PIR0AW4iiKcRyN
 TWx0YWjqeiv9OGFK/ZWStUFqenrjGFEsCq5bxXbRfV9dyPJe7ls95DgtA
 5RGPc9Q1h9mbIw5Em5rkxscywQ2lMbmKStX8Nx0e243haAboZSmHr1LLf
 B7dOuEgAN4KoY8dqPExTv3rSHhqV57ozmobP5vkkpl3rZl8FBhA30f42+ A==;
X-CSE-ConnectionGUID: wuIaM54gS1ulB/Y10IYkvQ==
X-CSE-MsgGUID: 3itf+S/nR3iU2JBA1+fjbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93484698"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93484698"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:00:50 -0700
X-CSE-ConnectionGUID: A0bqUVKXTC+uJXw7IpG0lw==
X-CSE-MsgGUID: NeeGvTWoQoyThpXsdnnO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270151859"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 07:00:47 -0700
Date: Thu, 11 Jun 2026 16:00:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: Re: [PATCH 4/4] tests/amdgpu: Integrate platform filtering into
 amd_basic
Message-ID: <20260611140045.wwsgw4ld4ohmwygr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20260610192208.88992-1-vitaly.prosyak@amd.com>
 <20260610192208.88992-4-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610192208.88992-4-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2026-06-10 at 15:21:27 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add platform filtering integration to amd_basic test to enable
> per-platform test skipping via the generic filtering framework.
> 
> Changes:
> - Initialize platform filter in igt_fixture via amd_platform_filter_init()
> - Add igt_platform_require() call at the start of each subtest
> 
> This allows tests to be skipped based on:
> 1. Built-in production rules (requires rebuild)
> 2. Config file /etc/igt/platform_skip.conf (no rebuild)
> 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (no rebuild)
> 
> Usage example (skip UMQ tests on Navi48):
>     export IGT_PLATFORM_SKIP_CONFIG=navi48:amd_basic:*-UMQ:Testing
>     ./build/tests/amdgpu/amd_basic

Add also example with config file as env vars are not convinient
for large tests lists.

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 3ad023472..4149a0192 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -19,6 +19,7 @@
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "lib/amdgpu/amd_utils.h"
> +#include "lib/amdgpu/amd_platform.h"
>  
>  #define BUFFER_SIZE (8 * 1024)
>  
> @@ -883,6 +884,9 @@ int igt_main()
>  		igt_assert_eq(r, 0);
>  		asic_rings_readness(device, 1, arr_cap);
>  		asic_userq_readiness(device, userq_arr_cap);
> +
> +		/* Initialize platform filtering */
> +		amd_platform_filter_init(&gpu_info);
>  	}
>  	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
>  	igt_subtest("memory-alloc")
> @@ -892,6 +896,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("userptr-with-IP-DMA") {
>  		if (arr_cap[AMD_IP_DMA]) {

This if() looks redundant now that you have dynamic capability
checks.

>  			igt_dynamic_f("userptr")
> +			igt_platform_require(igt_test_name(), "userptr-with-IP-DMA");

ok, so you make it really dynamic based on reading GPU
properites during test execution. imho you need '{' and '}'
here and in all cases below:

  			igt_dynamic_f("userptr") {
				igt_platform_require("userptr-with-IP-DMA");
  				amdgpu_userptr_test(device);
			}

imho you can get test name in require, no need to repeat it in
every call to igt_platform_require()
One more question, will this require() skip only this dynamic
subtests and will follow into testing next one? Or will it
skip all subtests in igt_subtest_with_dynamic("userptr-with-IP-DMA")?
So maybe it should be:

  	igt_subtest_with_dynamic("userptr-with-IP-DMA") {
		igt_platform_require("userptr-with-IP-DMA");
		...rest follows...

Regards,
Kamil

>  			amdgpu_userptr_test(device);
>  		}
>  	}
> @@ -900,6 +905,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("cs-gfx")
> +			igt_platform_require(igt_test_name(), "cs-gfx-with-IP-GFX");
>  			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, false);
>  		}
>  	}
> @@ -908,6 +914,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("cs-compute")
> +			igt_platform_require(igt_test_name(), "cs-compute-with-IP-COMPUTE");
>  			amdgpu_command_submission_compute(device, false);
>  		}
>  	}
> @@ -916,6 +923,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-multi-fence-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
>  			igt_dynamic_f("cs-multi-fence")
> +			igt_platform_require(igt_test_name(), "cs-multi-fence-with-IP-GFX");
>  			amdgpu_command_submission_multi_fence(device);
>  		} else {
>  			igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
> @@ -926,6 +934,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("cs-sdma")
> +			igt_platform_require(igt_test_name(), "cs-sdma-with-IP-DMA");
>  			amdgpu_command_submission_sdma(device, false);
>  		}
>  	}
> @@ -934,6 +943,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("semaphore-with-IP-GFX-and-IP-DMA") {
>  		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("semaphore")
> +			igt_platform_require(igt_test_name(), "semaphore-with-IP-GFX-and-IP-DMA");
>  			amdgpu_semaphore_test(device);
>  		}
>  	}
> @@ -942,6 +952,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("eviction-test-with-IP-DMA") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("eviction_test")
> +			igt_platform_require(igt_test_name(), "eviction-test-with-IP-DMA");
>  			amdgpu_bo_eviction_test(device);
>  		}
>  	}
> @@ -950,6 +961,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("sync-dependency-test")
> +			igt_platform_require(igt_test_name(), "sync-dependency-test-with-IP-GFX");
>  			amdgpu_sync_dependency_test(device, false);
>  		}
>  	}
> @@ -958,6 +970,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
>  		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("cs-gfx-with-umq")
> +			igt_platform_require(igt_test_name(), "cs-gfx-with-IP-GFX-UMQ");
>  			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
>  		}
>  	}
> @@ -966,6 +979,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
>  		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("cs-compute-with-umq")
> +			igt_platform_require(igt_test_name(), "cs-compute-with-IP-COMPUTE-UMQ");
>  			amdgpu_command_submission_compute(device, true);
>  		}
>  	}
> @@ -974,6 +988,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
>  		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("sync-dependency-test-with-umq")
> +			igt_platform_require(igt_test_name(), "sync-dependency-test-with-IP-GFX-UMQ");
>  			amdgpu_sync_dependency_test(device, true);
>  		}
>  	}
> @@ -982,6 +997,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
>  		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("cs-sdma-with-umq")
> +			igt_platform_require(igt_test_name(), "cs-sdma-with-IP-DMA-UMQ");
>  			amdgpu_command_submission_sdma(device, true);
>  		}
>  	}
> @@ -992,6 +1008,7 @@ int igt_main()
>  				userq_arr_cap[AMD_IP_COMPUTE] &&
>  				userq_arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("all-queues-with-umq")
> +			igt_platform_require(igt_test_name(), "all-queues-test-with-UMQ");
>  			amdgpu_test_all_queues(device, true);
>  		}
>  	}
> @@ -1000,6 +1017,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
>  		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("cs-gfx-fwm-umq")
> +			igt_platform_require(igt_test_name(), "cs-gfx-fwm-UMQ");
>  				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
>  		}
>  	}
> @@ -1008,6 +1026,7 @@ int igt_main()
>  	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
>  		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("cs-compute-fwm-umq")
> +			igt_platform_require(igt_test_name(), "cs-compute-fwm-UMQ");
>  				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
>  		}
>  	}
> -- 
> 2.54.0
> 
