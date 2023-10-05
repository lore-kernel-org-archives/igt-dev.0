Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8EF10E02B
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 15:34:51 +0000 (UTC)
Message-ID: <a7ceb9f5-a32e-4d3e-b6cd-f8685cac06d6@amd.com>
Date: Thu, 5 Oct 2023 11:34:43 -0400
Content-Language: en-CA, en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20231004231130.310640-1-vitaly.prosyak@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20231004231130.310640-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add IP availability condition
 to deadlock test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-10-04 19:11, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Some ASICs may not have a GFX ring and we use IGT built-in dynamic
> feature for conditional execution. If GFX IP is not present the test
> is skipped and the appropriate message is printed.
> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

No spaces between tags (Cc and S-O-B and R-V, etc.).

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
-- 
Regards,
Luben

> ---
>  tests/amdgpu/amd_deadlock.c | 73 +++++++++++++++++--------------------
>  1 file changed, 33 insertions(+), 40 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 0a81f3717..6147b7636 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -9,42 +9,13 @@
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>  
> -static void
> -amdgpu_deadlock_gfx(amdgpu_device_handle device_handle)
> -{
> -	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_GFX);
> -}
> -
> -static void
> -amdgpu_deadlock_compute(amdgpu_device_handle device_handle)
> -{
> -	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
> -}
> -
> -static void
> -amdgpu_deadlock_sdma(amdgpu_device_handle device_handle)
> -{
> -	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_DMA);
> -}
> -
> -static void
> -amdgpu_gfx_illegal_reg_access(amdgpu_device_handle device_handle)
> -{
> -	bad_access_helper(device_handle, 1, AMDGPU_HW_IP_GFX);
> -}
> -
> -static void
> -amdgpu_gfx_illegal_mem_access(amdgpu_device_handle device_handle)
> -{
> -	bad_access_helper(device_handle, 0, AMDGPU_HW_IP_GFX);
> -}
> -
>  igt_main
>  {
>  	amdgpu_device_handle device;
>  	struct amdgpu_gpu_info gpu_info = {0};
>  	int fd = -1;
>  	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -62,27 +33,49 @@ igt_main
>  		igt_assert_eq(r, 0);
>  		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>  		igt_assert_eq(r, 0);
> +		asic_rings_readness(device, 1, arr_cap);
>  
>  	}
>  	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
> -	igt_subtest("amdgpu-deadlock-sdma")
> -	amdgpu_deadlock_sdma(device);
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma")
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA);
> +		}
> +	}
>  
>  	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
> -	igt_subtest("amdgpu-gfx-illegal-reg-access")
> -	amdgpu_gfx_illegal_reg_access(device);
> +	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("amdgpu-illegal-reg-access")
> +			bad_access_helper(device, 1, AMDGPU_HW_IP_GFX);
> +		}
> +	}
>  
>  	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
> -	igt_subtest("amdgpu-gfx-illegal-mem-access")
> -	amdgpu_gfx_illegal_mem_access(device);
> +	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("amdgpu-illegal-mem-access")
> +			bad_access_helper(device, 0, AMDGPU_HW_IP_GFX);
> +		}
> +	}
> +
>  
>  	igt_describe("Test-GPU-reset-by-flooding-gfx-ring-with-jobs");
> -	igt_subtest("amdgpu-deadlock-gfx")
> -	amdgpu_deadlock_gfx(device);
> +	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("amdgpu-deadlock-gfx")
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX);
> +		}
> +	}
>  
>  	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
> -	igt_subtest("amdgpu-deadlock-compute")
> -	amdgpu_deadlock_compute(device);
> +	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-deadlock-compute")
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE);
> +		}
> +	}
>  
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
