Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8010E142
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 01:56:53 +0000 (UTC)
Message-ID: <947c343e-b9e6-4d8d-aa96-e07fe73e6e12@amd.com>
Date: Wed, 13 Sep 2023 21:56:49 -0400
Content-Language: en-CA, en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20230914011732.343775-1-vitaly.prosyak@amd.com>
 <20230914011732.343775-2-vitaly.prosyak@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230914011732.343775-2-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/3] tests/amdgpu: skip CE subtest for gfx11
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

On 2023-09-13 21:17, vitaly.prosyak@amd.com wrote:
> From: Jesse Zhang <jesse.zhang@amd.com>
> 
> Due to CE is not available on gfx11,
> so skip CE subtest for gfx11.
> 
> v2 : - code logic improvements(Vitaly)
> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> 
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index e7a42a335..11e2af98e 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -67,7 +67,7 @@ static void amdgpu_memory_alloc(amdgpu_device_handle device)
>   * AMDGPU_HW_IP_GFX
>   * @param device
>   */
> -static void amdgpu_command_submission_gfx(amdgpu_device_handle device)
> +static void amdgpu_command_submission_gfx(amdgpu_device_handle device, bool ce_avails)
>  {
>  	/* write data using the CP */
>  	amdgpu_command_submission_write_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX), false);
> @@ -75,10 +75,15 @@ static void amdgpu_command_submission_gfx(amdgpu_device_handle device)
>  	amdgpu_command_submission_const_fill_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX));
>  	/* copy data using the CP */
>  	amdgpu_command_submission_copy_linear_helper(device, get_ip_block(device, AMDGPU_HW_IP_GFX));
> -	/* separate IB buffers for multi-IB submission */
> -	amdgpu_command_submission_gfx_separate_ibs(device);
> -	/* shared IB buffer for multi-IB submission */
> -	amdgpu_command_submission_gfx_shared_ib(device);
> +
> +	if (ce_avails) {
> +		/* separate IB buffers for multi-IB submission */
> +		amdgpu_command_submission_gfx_separate_ibs(device);
> +		/* shared IB buffer for multi-IB submission */
> +		amdgpu_command_submission_gfx_shared_ib(device);
> +	} else {
> +		igt_info("separate and shared IB buffers for multi IB submisison testes are skipped due to GFX11\n");
> +	}
>  }
>  
>  /**
> @@ -624,6 +629,7 @@ igt_main
>  {
>  	amdgpu_device_handle device;
>  	struct amdgpu_gpu_info gpu_info = {0};
> +	struct drm_amdgpu_info_hw_ip info;
>  	int fd = -1;
>  	int r;
>  	bool arr_cap[AMD_IP_MAX] = {0};
> @@ -642,6 +648,8 @@ igt_main
>  
>  		r = amdgpu_query_gpu_info(device, &gpu_info);
>  		igt_assert_eq(r, 0);
> +		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +		igt_assert_eq(r, 0);
>  		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
>  		igt_assert_eq(r, 0);
>  		asic_rings_readness(device, 1, arr_cap);
> @@ -662,7 +670,7 @@ igt_main
>  	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("cs-gfx")
> -			amdgpu_command_submission_gfx(device);
> +			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11);
>  		}
>  	}
>  
> @@ -675,13 +683,16 @@ igt_main
>  	}
>  
>  	igt_describe("Check-GFX-CS-for-multi-fence");
> -	igt_subtest_with_dynamic("cs-multi-fence-with-IP-GFX") {
> -		if (arr_cap[AMD_IP_GFX]) {
> +	igt_subtest_with_dynamic("") {
> +		if (arr_cap[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
>  			igt_dynamic_f("cs-multi-fence")
> -		amdgpu_command_submission_multi_fence(device);
> +			amdgpu_command_submission_multi_fence(device);
> +		} else {
> +			igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
>  		}
>  	}
>  
> +
>  	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");

Unnecessary empty line added above. Perhaps remove. With that, this patch is,

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

>  	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
>  		if (arr_cap[AMD_IP_DMA]) {
