Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E949D10E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 20:28:40 +0000 (UTC)
Message-ID: <3d123107-62fa-49be-a0f2-557a1eadb37f@amd.com>
Date: Fri, 22 Sep 2023 16:28:34 -0400
Content-Language: en-CA, en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20230922074311.3426555-1-jesse.zhang@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230922074311.3426555-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add amdgpu reset test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Tim Huang <tim.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-09-22 03:43, Jesse Zhang wrote:

A commit without a body is unusual. I'd add:

"Add an amdgpu reset test to the suite."

As a one liner body.

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

It'll look much better if you combined "int r, fd;" and ordered
them in reverse-christmas-tree order. Like this,

	amdgpu_context_handle context_handle;
	char debugfs_path[256], tmp[10];
	uint32_t hang_state, hangs;
	struct stat sbuf;
	int r, fd;


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

This would usually be done as sizeof(tmp)/sizeof(tmp[0]) which is often defined
as ARRAY_SIZE(_obj) macro as #define ARRAY_SIZE(_obj) (sizeof(_obj)/sizeof((_obj)[0])).
So perhaps do something similar to this here, the easiest is diving by the size of
the first element...

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
> +	amdgpu_gpu_reset_test(device,fd);
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);

-- 
Regards,
Luben
