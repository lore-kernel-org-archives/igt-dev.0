Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA4310E281
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 16:15:56 +0000 (UTC)
Date: Mon, 9 Oct 2023 18:15:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231009161544.acirmnubt2ne2czh@kamilkon-desk.igk.intel.com>
References: <20231009084433.1659178-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009084433.1659178-1-jesse.zhang@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/amd_dispatch: add negative test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,
On 2023-10-09 at 16:44:33 +0800, Jesse Zhang wrote:
> add negative test for gfx and compute
--^ ---------------------------------- ^
s/add/Add/
Also add dot '.' at end of sentence(s) in description.

Could you describe a little more what negative scenario(s)
do you tests?

> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Signed-off-by: Jesse zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_dispatch.c   |  4 ++--
>  lib/amdgpu/amd_dispatch.h   |  2 +-
>  tests/amdgpu/amd_dispatch.c | 36 ++++++++++++++++++++++++++++++++----
>  3 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index 9de3986ba..040381a11 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -524,7 +524,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  	}
>  }
>  
> -void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type)
> +void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
>  {
>  	int r;
>  	struct drm_amdgpu_info_hw_ip info;
> @@ -547,7 +547,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
>  		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
>  					    version);
>  		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
> -					    version, 0);
> +					    version, hang);
>  	}
>  }
>  
> diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
> index c500b5b3f..4df8b1355 100644
> --- a/lib/amdgpu/amd_dispatch.h
> +++ b/lib/amdgpu/amd_dispatch.h
> @@ -27,7 +27,7 @@
>  #include <amdgpu.h>
>  
>  void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
> -			      uint32_t ip_type);
> +			      uint32_t ip_type, int hang);
>  
>  void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					uint32_t ip_type,
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index 769f26cd0..e0e55781c 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -24,6 +24,18 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
>  	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
>  }
>  
> +static void
> +amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
> +{
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 1);
> +}
> +
> +static void
> +amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
> +{
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
> +}
> +
>  static void
>  amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
>  {
> @@ -54,8 +66,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
>  	r = amdgpu_cs_ctx_free(context_handle);
>  	igt_assert_eq(r, 0);
>  
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
>  }
>  
>  igt_main
> @@ -85,7 +97,7 @@ igt_main
>  		asic_rings_readness(device, 1, arr_cap);
>  
>  	}
> -	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring");
> +	igt_describe("Test-GPU-reset-using-a-binary-shader-to-slow-hang-the-job-on-compute-ring");
--------------------- ^
Generally in descriptions use spaces to separate words,
while in test names we should use '-'. This goes for all descriptions.

>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
------------------------------------^
Here it is ok, it is test name.

You may also look at Mauro patches for descriptions and use of
testplan for generating test names at build time, not with
running binary.

Regards,
Kamil

>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-dispatch-test-compute")
> @@ -93,7 +105,7 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-gfx-ring");
> +	igt_describe("Test-GPU-reset-using-a-binary-shader-to-slow-hang-the-job-on-gfx-ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-dispatch-test-gfx")
> @@ -101,6 +113,22 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test-GPU-reset-using-a-binary-shader-to-the-job-on-gfx-ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
> +			amdgpu_dispatch_hang_gfx(device);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-using-a-binary-shader-to-the-job-on-compute-ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
> +			amdgpu_dispatch_hang_compute(device);
> +		}
> +	}
> +
>  	igt_describe("Test-GPU-reset-using-amdgpu-debugfs-to-hang-the-job-on-gfx-ring");
>  	igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE") {
>  		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
> -- 
> 2.25.1
> 
