Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D9E10E042
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 09:37:35 +0000 (UTC)
Date: Fri, 22 Sep 2023 11:37:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230922093713.5z7ejymajlld4uhx@kamilkon-desk.igk.intel.com>
References: <20230922074311.3426555-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230922074311.3426555-1-jesse.zhang@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add amdgpu reset test
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

please improve subject,
[PATCH] tests/amdgpu: add amdgpu reset test
-------------------^
There is missing test which you change, better write:

[PATCH] tests/amd_deadlock: add reset subtest

Please write description of your patch here, for example
what or how will you test.

> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 40 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index d805b8d18..1b9254d06 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -27,6 +27,9 @@
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_dispatch.h"
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <sys/sysmacros.h>

Add system include as first, before igt lib ones. Also sort them
alphabetically, here fcntl before sys/s... ones.

>  
>  static void
>  amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
> @@ -70,6 +73,41 @@ amdgpu_gfx_illegal_mem_access(amdgpu_device_handle device_handle)
>  	bad_access_helper(device_handle, 0, AMDGPU_HW_IP_GFX);
>  }
>  
> +static void
> +amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
> +{
> +	int r;
> +	char debugfs_path[256], tmp[10];
> +	int fd;
> +	struct stat sbuf;
> +	amdgpu_context_handle context_handle;
> +	uint32_t hang_state, hangs;
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
> +	r = read(fd, tmp, sizeof(tmp)/sizeof(char));
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
> @@ -116,6 +154,8 @@ igt_main
>  	igt_subtest("dispatch_hang_slow_gfx")
>  	amdgpu_dispatch_hang_slow_gfx(device);
>  
> +	igt_subtest("amdgpu-reset-test")
---------------- ^^^^^^
Your test have already "amd" in test name amd_deadlock, so no
need for repeating amdgpu but it is your decision, you may keep
it if you want.

Regards,
Kamil

> +	amdgpu_gpu_reset_test(device,fd);
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
> -- 
> 2.25.1
> 
