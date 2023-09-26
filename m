Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DBB10E33F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 01:14:46 +0000 (UTC)
Message-ID: <cc076352-0d2e-ac95-c0a3-59acebff8f09@amd.com>
Date: Mon, 25 Sep 2023 21:14:40 -0400
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20230925060518.3530632-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20230925060518.3530632-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add stable pstate test
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

The patch looks good to me.

However there is kind of issue there:

https://patchwork.freedesktop.org/series/124092/

I am not sure , did you use 'git fetch' and then 'git pull --rebase' just before  the patch was locally created and then sent to igt-dev?

After the fix , please, use:

 Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


Thanks, Vitaly


On 2023-09-25 02:05, Jesse Zhang wrote:
> In order to verify gfx power and clock, add pstate test.
>
> v2:
>    - restricted build for pstate tests due to build failure
>        for drmlib <= 2.4.109 (Vitaly)
>    - Optimize some code (Luben)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h |  9 +++++
>  tests/amdgpu/amd_pstate.c     | 69 +++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build      |  6 +++
>  3 files changed, 84 insertions(+)
>  create mode 100644 tests/amdgpu/amd_pstate.c
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index 0cbd1540a..6240ae5ea 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -206,6 +206,8 @@ union drm_amdgpu_bo_list {
>  #define AMDGPU_CTX_OP_FREE_CTX	2
>  #define AMDGPU_CTX_OP_QUERY_STATE	3
>  #define AMDGPU_CTX_OP_QUERY_STATE2	4
> +#define AMDGPU_CTX_OP_GET_STABLE_PSTATE	5
> +#define AMDGPU_CTX_OP_SET_STABLE_PSTATE	6
>  
>  /* GPU reset status */
>  #define AMDGPU_CTX_NO_RESET		0
> @@ -237,6 +239,13 @@ union drm_amdgpu_bo_list {
>  */
>  #define AMDGPU_CTX_PRIORITY_HIGH        512
>  #define AMDGPU_CTX_PRIORITY_VERY_HIGH   1023
> +/* select a stable profiling pstate for perfmon tools */
> +#define AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK  0xf
> +#define AMDGPU_CTX_STABLE_PSTATE_NONE  0
> +#define AMDGPU_CTX_STABLE_PSTATE_STANDARD  1
> +#define AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK  2
> +#define AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK  3
> +#define AMDGPU_CTX_STABLE_PSTATE_PEAK  4
>  
>  struct drm_amdgpu_ctx_in {
>  	/** AMDGPU_CTX_OP_* */
> diff --git a/tests/amdgpu/amd_pstate.c b/tests/amdgpu/amd_pstate.c
> new file mode 100644
> index 000000000..40fdc32cc
> --- /dev/null
> +++ b/tests/amdgpu/amd_pstate.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2014 Advanced Micro Devices, Inc.
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +#include "drmtest.h"
> +#include "igt.h"
> +
> +static void
> +amdgpu_stable_pstate_test(amdgpu_device_handle device_handle)
> +{
> +	int r;
> +	amdgpu_context_handle context_handle;
> +	uint32_t current_pstate, new_pstate;
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_ctx_stable_pstate(context_handle,
> +					AMDGPU_CTX_OP_GET_STABLE_PSTATE,
> +					0, &current_pstate);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
> +	r = amdgpu_cs_ctx_stable_pstate(context_handle,
> +					AMDGPU_CTX_OP_SET_STABLE_PSTATE,
> +					AMDGPU_CTX_STABLE_PSTATE_PEAK, NULL);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_ctx_stable_pstate(context_handle,
> +					AMDGPU_CTX_OP_GET_STABLE_PSTATE,
> +					0, &new_pstate);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_PEAK);
> +
> +	r = amdgpu_cs_ctx_free(context_handle);
> +	igt_assert_eq(r, 0);
> +
> +}
> +
> +igt_main
> +{
> +	amdgpu_device_handle device;
> +	int fd = -1;
> +
> +	igt_fixture {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +	}
>
> +	igt_subtest("amdgpu_pstate")
> +	amdgpu_stable_pstate_test(device);
> +
> +	igt_fixture {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +	}
> +}
> +
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index ebf52bf38..4a522386d 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -42,6 +42,12 @@ if libdrm_amdgpu.found()
>  	else
>  		warning('libdrm <= 2.4.97 found, amd_syncobj test not applicable')
>  	endif
> +
> +	if libdrm_amdgpu.version().version_compare('> 2.4.109')
> +		amdgpu_progs +=[ 'amd_pstate', ]
> +	else
> +		warning('libdrm <= 2.4.109 found, amd_pstate test not applicable')
> +	endif
>  	amdgpu_deps += libdrm_amdgpu
>  endif
>  
