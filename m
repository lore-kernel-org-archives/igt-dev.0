Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7BB6E5B0
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 14:23:10 +0000 (UTC)
Date: Wed, 16 Jun 2021 17:25:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMoJvxtHeGb2tdiX@platvala-desk.ger.corp.intel.com>
References: <20210616135547.154645-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616135547.154645-1-Anson.Jacob@amd.com>
Subject: Re: [igt-dev] [PATCH V2] tests/amdgpu: Add amdgpu module reload test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 09:55:47AM -0400, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
> 
> Test to ensure unloading and loading of amdgpu driver works
> 
> Tested on:
> ASIC: NAVI14
> 
> Changes since v1:
> * Added documentaion
> * Updated commit message
> 
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Co-developed-by: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/igt_kmod.c                 | 59 ++++++++++++++++++++++++
>  lib/igt_kmod.h                 |  3 ++
>  tests/amdgpu/amd_module_load.c | 83 ++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |  1 +
>  4 files changed, 146 insertions(+)
>  create mode 100644 tests/amdgpu/amd_module_load.c
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 55295fa5d09d..10e983844066 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -433,6 +433,65 @@ igt_i915_driver_unload(void)
>  	return IGT_EXIT_SUCCESS;
>  }
>  
> +/**
> + * igt_amdgpu_driver_load:
> + * @opts: options to pass to amdgpu driver
> + *
> + * Returns: IGT_EXIT_SUCCESS or IGT_EXIT_FAILURE.
> + *
> + * Loads the amdgpu driver and its dependencies.
> + *
> + */
> +int
> +igt_amdgpu_driver_load(const char *opts)
> +{
> +	if (opts)
> +		igt_info("Reloading amdgpu with %s\n\n", opts);
> +
> +	if (igt_kmod_load("amdgpu", opts)) {
> +		igt_warn("Could not load amdgpu\n");
> +		return IGT_EXIT_FAILURE;
> +	}
> +
> +	bind_fbcon(true);
> +
> +	return IGT_EXIT_SUCCESS;
> +}
> +
> +/**
> + * igt_amdgpu_driver_unload:
> + *
> + * Returns: IGT_EXIT_SUCCESS on success, IGT_EXIT_FAILURE on failure
> + * and IGT_EXIT_SKIP if amdgpu could not be unloaded.
> + *
> + * Unloads the amdgpu driver and its dependencies.
> + *
> + */
> +int
> +igt_amdgpu_driver_unload(void)
> +{
> +	bind_fbcon(false);
> +
> +	if (igt_kmod_is_loaded("amdgpu")) {
> +		if (igt_kmod_unload("amdgpu", 0)) {
> +			igt_warn("Could not unload amdgpu\n");
> +			igt_kmod_list_loaded();
> +			igt_lsof("/dev/dri");
> +			return IGT_EXIT_SKIP;
> +		}
> +	}
> +
> +	igt_kmod_unload("drm_kms_helper", 0);
> +	igt_kmod_unload("drm", 0);
> +
> +	if (igt_kmod_is_loaded("amdgpu")) {
> +		igt_warn("amdgpu.ko still loaded!\n");
> +		return IGT_EXIT_FAILURE;
> +	}
> +
> +	return IGT_EXIT_SUCCESS;
> +}
> +
>  static void kmsg_dump(int fd)
>  {
>  	char record[4096 + 1];
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index c71ec147621a..04c87516f1e6 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -39,6 +39,9 @@ int igt_kmod_unload(const char *mod_name, unsigned int flags);
>  int igt_i915_driver_load(const char *opts);
>  int igt_i915_driver_unload(void);
>  
> +int igt_amdgpu_driver_load(const char *opts);
> +int igt_amdgpu_driver_unload(void);
> +
>  void igt_kselftests(const char *module_name,
>  		    const char *module_options,
>  		    const char *result_option,
> diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
> new file mode 100644
> index 000000000000..77df96d50bb6
> --- /dev/null
> +++ b/tests/amdgpu/amd_module_load.c
> @@ -0,0 +1,83 @@
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +#include <sys/ioctl.h>
> +
> +/**
> + * sanity_check:
> + *
> + * Ensures the driver is able to respond to DRM_IOCTL_AMDGPU_INFO ioctl
> + * with a timeout.
> + *
> + */
> +static void sanity_check(void)
> +{
> +	int err = 0;
> +	int fd;
> +	int arg_ret;
> +	struct drm_amdgpu_info args = {0};
> +
> +	args.return_pointer = (uintptr_t) &arg_ret;
> +	args.return_size = sizeof(int);
> +	args.query = AMDGPU_INFO_HW_IP_INFO;
> +	args.query_hw_ip.type = AMDGPU_HW_IP_COMPUTE;
> +
> +	fd = drm_open_driver(DRIVER_AMDGPU);
> +	igt_set_timeout(1, "Module reload timeout!");
> +
> +	if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
> +		err = -errno;
> +
> +	igt_set_timeout(0, NULL);
> +	close(fd);
> +
> +	igt_assert_eq(err, 0);
> +}
> +
> +igt_main
> +{
> +	igt_describe("Make sure reloading amdgpu drivers works");
> +	igt_subtest("reload") {
> +		int err;
> +		igt_amdgpu_driver_unload();
> +
> +		err = igt_amdgpu_driver_load(NULL);
> +
> +		igt_assert_eq(err, 0);
> +
> +		sanity_check();
> +
> +		igt_amdgpu_driver_unload();
> +	}
> +
> +	igt_fixture
> +	{
> +		/* load the module back in */
> +		igt_amdgpu_driver_load(NULL);
> +	}

For i915 we have the convention that tests must either leave the
driver loaded with default params, or leave it unloaded. Most of
i915_driver_load tests leave the module unloaded to avoid the extra
roundtrip of load-unload if running multiple driver-loading tests
back-to-back. Lockdep especially doesn't quite like reloading too many
times.

Not an objection, just a comment to maybe consider in the future.

My earlier comments are addressed so

Acked-by: Petri Latvala <petri.latvala@intel.com>

on that front. I'll leave it to amdgpu guys to review the test itself.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
