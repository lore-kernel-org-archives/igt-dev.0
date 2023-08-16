Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8226C10E371
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 14:27:44 +0000 (UTC)
Date: Wed, 16 Aug 2023 16:27:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230816142739.k2ycx6vn5rrx33rt@kamilkon-desk1>
References: <20230815173659.1208384-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230815173659.1208384-1-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Add a helper lib to read mmio
 registers via ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Alan,

On 2023-08-15 at 10:36:59 -0700, Alan Previn wrote:
> Add a helper lib function to call DRM_IOCTL_I915_REG_READ to
> read whitelisted registers.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  lib/i915/i915_reg_read_ioctl.c | 34 ++++++++++++++++++++++++++++++++++
---------------- ^^^^^^^^^^^^^^

imho better name would be i915_mmio_reg

>  lib/i915/i915_reg_read_ioctl.h |  9 +++++++++
>  lib/meson.build                |  1 +
>  tests/i915/gem_reg_read.c      | 26 ++++++--------------------
>  tests/i915/i915_pm_rpm.c       |  9 +++++----
>  5 files changed, 55 insertions(+), 24 deletions(-)
>  create mode 100644 lib/i915/i915_reg_read_ioctl.c
>  create mode 100644 lib/i915/i915_reg_read_ioctl.h
> 
> diff --git a/lib/i915/i915_reg_read_ioctl.c b/lib/i915/i915_reg_read_ioctl.c
> new file mode 100644
> index 000000000..a0fa654e5
> --- /dev/null
> +++ b/lib/i915/i915_reg_read_ioctl.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "i915/i915_reg_read_ioctl.h"
> +#include "igt_device.h"
> +
> +/**
> + * i915_reg_read_ioctl:
> + * @drmfd: device file descriptor
> + * @offset: mmio register to read from
> + * @value: ptr to fill with results from read
> + *
> + * This function uses DRM_IOCTL_I915_REG_READ to read the
> + * register and so it can return NOACCES if i915 doesn't allow.
> + *
> + * Returns:
> + * -errno
> + */
> +int i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value)

There is convention in igt to have "__function" without error asserts
and "function" failing when ioctl fails, so maybe better is:

int __i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value)

> +{
> +	struct drm_i915_reg_read reg_read = {0};
> +	int ret = 0;
> +
> +	reg_read.offset = offset;
> +	if (igt_ioctl(drmfd, DRM_IOCTL_I915_REG_READ, &reg_read))
> +		ret = -errno;
> +	else if (value)
> +		*value = reg_read.val;
> +
> +	return ret;
> +}
> +
> diff --git a/lib/i915/i915_reg_read_ioctl.h b/lib/i915/i915_reg_read_ioctl.h
> new file mode 100644
> index 000000000..cb1bb3950
> --- /dev/null
> +++ b/lib/i915/i915_reg_read_ioctl.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2023 Intel Corporation. All rights reserved.
> + */
> +
> +#include "igt.h"
> +
> +int i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value);
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index ce11c0715..6303930d9 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -14,6 +14,7 @@ lib_sources = [
>  	'i915/intel_decode.c',
>  	'i915/intel_memory_region.c',
>  	'i915/i915_crc.c',
> +	'i915/i915_reg_read_ioctl.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
>  	'igt_crc.c',
> diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
> index de6788abe..1af7c517f 100644
> --- a/tests/i915/gem_reg_read.c
> +++ b/tests/i915/gem_reg_read.c
> @@ -32,6 +32,8 @@
>  #include <sys/utsname.h>
>  #include <time.h>
>  
> +#include "i915/i915_reg_read_ioctl.h"
> +
>  /**
>   * TEST: gem reg read
>   * Feature: gem_core
> @@ -52,24 +54,8 @@ struct local_drm_i915_reg_read {
>  	__u64 val; /* Return value */
>  };
>  
> -#define REG_READ_IOCTL DRM_IOWR(DRM_COMMAND_BASE + 0x31, struct local_drm_i915_reg_read)
> -
>  #define RENDER_RING_TIMESTAMP 0x2358
>  
> -static int read_register(int fd, uint64_t offset, uint64_t * val)
> -{
> -	int ret = 0;
> -	struct local_drm_i915_reg_read reg_read;
> -	reg_read.offset = offset;
> -
> -	if (drmIoctl(fd, REG_READ_IOCTL, &reg_read))
> -		ret = -errno;
> -
> -	*val = reg_read.val;
> -
> -	return ret;
> -}
> -
>  static bool check_kernel_x86_64(void)
>  {
>  	int ret;
> @@ -87,9 +73,9 @@ static bool check_kernel_x86_64(void)
>  static bool check_timestamp(int fd)
>  {
>  	int ret;
> -	uint64_t val;
> +	__u64 val;
>  
> -	ret = read_register(fd, RENDER_RING_TIMESTAMP | 1, &val);
> +	ret = i915_reg_read_ioctl(fd, RENDER_RING_TIMESTAMP | 1, &val);
>  
>  	return ret == 0;
>  }
> @@ -103,7 +89,7 @@ static int timer_query(int fd, uint64_t * val)
>  	if (has_proper_timestamp)
>  		offset |= 1;
>  
> -	ret = read_register(fd, offset, val);
> +	ret = i915_reg_read_ioctl(fd, offset, (__u64 *)val);
>  
>  /*
>   * When reading the timestamp register with single 64b read, we are observing
> @@ -168,7 +154,7 @@ igt_main
>  	}
>  
>  	igt_subtest("bad-register")
> -		igt_assert_eq(read_register(fd, 0x12345678, &val), -EINVAL);
> +		igt_assert_eq(i915_reg_read_ioctl(fd, 0x12345678, (__u64 *)&val), -EINVAL);
>  
>  	igt_subtest("timestamp-moving") {
>  		igt_skip_on(timer_query(fd, &val) != 0);
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 17413ffe5..b19accdc9 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -40,6 +40,9 @@
>  #include <sys/mman.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> +
> +#include "i915/i915_reg_read_ioctl.h"
> +
>  /**
>   * TEST: i915 pm rpm
>   *
> @@ -1852,13 +1855,11 @@ static void gem_evict_pwrite_subtest(void)
>  /* This also triggered WARNs on dmesg at some point. */
>  static void reg_read_ioctl_subtest(void)
>  {
> -	struct drm_i915_reg_read rr = {
> -		.offset = 0x2358, /* render ring timestamp */
> -	};
> +	__u64 val;
>  
>  	disable_all_screens_and_wait(&ms_data);
>  
> -	do_ioctl(drm_fd, DRM_IOCTL_I915_REG_READ, &rr);
> +	i915_reg_read_ioctl(drm_fd, 0x2358, &val);
----------------------------------- ^^^^^^
Maybe define it at i915_mmio_reg.h ?

#define MMIO_REG_RENDER_RING_TIMESTAMP 0x2358

Regards,
Kamil

>  
>  	igt_assert(wait_for_suspended());
>  }
> 
> base-commit: 81e08c6d648e949df161a4f39118ed3eb1e354e9
> -- 
> 2.39.0
> 
