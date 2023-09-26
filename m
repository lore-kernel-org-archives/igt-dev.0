Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF67010E33F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 01:36:18 +0000 (UTC)
Message-ID: <851165d3-2dc4-d8e4-762f-c90f4a9b371a@amd.com>
Date: Mon, 25 Sep 2023 21:36:10 -0400
Content-Language: en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20230925020522.3523365-1-jesse.zhang@amd.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20230925020522.3523365-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amd_deadlock: add reset subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Tim Huang <tim.huang@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jesse,

Sorry for the wrong suggestion to put the 'amdgpu gpu reset test' into amd deadlock.c .

In the following https://patchwork.freedesktop.org/series/124230/

i did :

" Split GPU reset (known as deadlock) tests into
    command-based (deadlock) and the other using binary shaders
    (dispatch).The one of primary reasons for splitting is to use
    new functions like 'amdgpu_cs_query_reset_state2' in next commits."

So your patch would be related to new dispatch_test. Please, make your patch after i merge the 

https://patchwork.freedesktop.org/series/124230/. There is dependency .

The patch below looks good to me, but, please, add a similar 'description' , for example,

 igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring");
    igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
        if (arr_cap[AMD_IP_COMPUTE]) {
            igt_dynamic_f("amdgpu-dispatch-test-compute")
            amdgpu_dispatch_hang_slow_compute(device);
        }
    }

After the above fix , please, use:

 Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


Thanks  Vitaly
> Add an amdgpu reset test to the suite
>
> V2:
>   - improve subject and description  (Kamil,Luben)
>   - sort the include alphabetically (Kamil)
>   - Optimize some code (Luben)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 39 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index d805b8d18..4063ac61b 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -23,6 +23,9 @@
>   * Based on libdrm/tests/amdgpu/deadlock_tests.c
>   */
>  
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
>  #include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_dispatch.h"
> @@ -70,6 +73,40 @@ amdgpu_gfx_illegal_mem_access(amdgpu_device_handle device_handle)
>  	bad_access_helper(device_handle, 0, AMDGPU_HW_IP_GFX);
>  }
>  
> +static void
> +amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
> +{
> +	amdgpu_context_handle context_handle;
> +	char debugfs_path[256], tmp[10];
> +	uint32_t hang_state, hangs;
> +	struct stat sbuf;
> +	int r, fd;
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = fstat(drm_amdgpu, &sbuf);
> +	igt_assert_eq(r, 0);
> +
> +	sprintf(debugfs_path, "/sys/kernel/debug/dri/%d/amdgpu_gpu_recover", minor(sbuf.st_rdev));
> +	fd = open(debugfs_path, O_RDONLY);
> +	igt_assert_fd(fd);
> +
> +	r = read(fd, tmp, ARRAY_SIZE(tmp));
> +	igt_assert_lt(0,r);
> +
> +	r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(hang_state, AMDGPU_CTX_UNKNOWN_RESET);
> +
> +	close(fd);
> +	r = amdgpu_cs_ctx_free(context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
> @@ -116,6 +153,8 @@ igt_main
>  	igt_subtest("dispatch_hang_slow_gfx")
>  	amdgpu_dispatch_hang_slow_gfx(device);
>  
> +	igt_subtest("amdgpu-reset-test")
> +	amdgpu_gpu_reset_test(device,fd);
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
