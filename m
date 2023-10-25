Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C9B10E5D1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 16:57:02 +0000 (UTC)
Date: Wed, 25 Oct 2023 18:56:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231025165656.kgxd5zem5ql7vyrw@kamilkon-desk.igk.intel.com>
References: <20231025092432.726460-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231025092432.726460-1-jesse.zhang@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/amd_dispatch: add dispatch test for gfx
 and compute
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,
On 2023-10-25 at 17:24:32 +0800, Jesse Zhang wrote:
> Add dispatch test on gfx and compute ring.
> Through  memset shader and memcpy shader,
> and validate the result.
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Tim Huang <tim.huang@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>

Look at gitlab report with warning, it turns out you have now
duplicate subtests:

tests/amdgpu/amd_dispatch:
Checking invalid option handling...
Checking valid option handling...
Checking subtest enumeration...
Checking subtest uniqueness...
test has duplicate subtest names!
amdgpu-dispatch-test-compute-with-IP-COMPUTE amdgpu-dispatch-test-gfx-with-IP-GFX
FAIL: tests/amdgpu/amd_dispatch

to replicate, compile and then run:

meson test -C build

See also some notes about checkpatch.pl and few other.

> ---
>  tests/amdgpu/amd_dispatch.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index 323284306..d62dc7a3d 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -36,6 +36,16 @@ amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
>  	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
>  }
>  
> +static void
> +amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle) {
------------------------------------------------------------------- ^
This should be at start of line:
{

> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
> +}
> +
> +static void
> +amdgpu_gfx_dispatch_test_compute(amdgpu_device_handle device_handle) {
------------------------------------------------------------------- ^
Same here.

> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
> +}
> +
>  static void
>  amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
>  {
> @@ -97,6 +107,23 @@ igt_main
>  		asic_rings_readness(device, 1, arr_cap);
>  
>  	}
> +
> +	igt_describe("Check-dispatch-test-gfx-for-each-ring-using-memset-memcpy-shaders-and-validate-after");
-----------------------^
No need for dashes '-' in subtest description.

> +	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("amdgpu-dispatch-test-gfx")
-------------------------- ^
Keep it uniqe.

> +			amdgpu_gfx_dispatch_test_gfx(device);
> +		}
> +	}
> +
> +	igt_describe("Check-dispatch-test-compute-for-each-ring-using-memset-memcpy-shaders-and-validate-after");
-----------------------^
Same here.

> +	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-test-compute")
-------------------------- ^
Keep it uniqe.

Regards,
Kamil

> +			amdgpu_gfx_dispatch_test_compute(device);
> +		}
> +	}
> +
>  	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
> -- 
> 2.25.1
> 
