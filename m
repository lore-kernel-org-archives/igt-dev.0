Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ACB10E6AC
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 15:55:17 +0000 (UTC)
Date: Fri, 11 Aug 2023 17:55:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230811155513.snl5dgsdwlmlbnwg@kamilkon-desk1>
References: <20230810212521.1405970-1-janga.rahul.kumar@intel.com>
 <20230810212521.1405970-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230810212521.1405970-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/xe: Add support to reset all
 GT's
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, kunal1.joshi@intel.com, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga Rahul,

On 2023-08-11 at 02:55:19 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Introduce xe gt library.
> 
> Add support to check GT reset and force reset all GT's.
> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Anna Karas <anna.karas@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/meson.build |  1 +
>  lib/xe/xe_gt.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_gt.h  | 27 ++++++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 lib/xe/xe_gt.c
>  create mode 100644 lib/xe/xe_gt.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index ce11c0715..b7bfcf4f0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -103,6 +103,7 @@ lib_sources = [
>  	'igt_dsc.c',
>  	'xe/xe_compute.c',
>  	'xe/xe_compute_square_kernels.c',
> +	'xe/xe_gt.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_query.c',
>  	'xe/xe_spin.c',
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> new file mode 100644
> index 000000000..a72f9bcc9
> --- /dev/null
> +++ b/lib/xe/xe_gt.c
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Authors:
> + *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> + */
> +
> +#include <fcntl.h>
> +#include "xe_gt.h"
> +
> +/**
> + * has_xe_gt_reset:
> + * @fd: open xe drm file descriptor
> + *
> + * Check gt force reset sysfs entry is available or not
> + *
> + * Returns: reset sysfs entry available
> + */
> +bool has_xe_gt_reset(int fd)
> +{
> +	char reset_sysfs_path[100];
> +	struct stat st;
> +	int gt;
> +	int reset_sysfs_fd = -1;
> +	int sysfs_fd = -1;
> +
> +	igt_assert_eq(fstat(fd, &st), 0);
> +	sysfs_fd = igt_sysfs_open(fd);
> +
> +	igt_assert(sysfs_fd != -1);
> +	xe_for_each_gt(fd, gt) {
> +		sprintf(reset_sysfs_path, "/sys/kernel/debug/dri/%d/gt%d/force_reset",
> +				minor(st.st_rdev), gt);
> +		reset_sysfs_fd = openat(sysfs_fd, reset_sysfs_path, O_RDONLY);
> +
> +		if (reset_sysfs_fd == -1) {
> +			close(sysfs_fd);
> +			return 0;
> +		}
> +
> +		close(reset_sysfs_fd);
> +	}
> +
> +	close(sysfs_fd);
> +	return 1;
> +}
> +
> +/**
> + * xe_force_gt_reset_all:
> + *
> + * Forces reset of all the GT's.
> + */
> +void xe_force_gt_reset_all(int xe_fd)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(xe_fd, gt)
> +		xe_force_gt_reset(xe_fd, gt);
> +}
> +
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> new file mode 100644
> index 000000000..e075ebf62
> --- /dev/null
> +++ b/lib/xe/xe_gt.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Authors:
> + *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <stdint.h>
> +#include <sys/stat.h>
> +
> +#include "igt_core.h"
> +#include "igt_sysfs.h"
> +#include "xe_ioctl.h"
> +#include "xe_query.h"
> +
> +#ifdef __linux__
> +#include <sys/sysmacros.h>
> +#else
> +#define major(__v__) (((__v__) >> 8) & 0xff)
> +#define minor(__v__) ((__v__) & 0xff)
> +#endif

It looks like you included many headers which are not needed
here, also that macro is used only in xe_gt.c file, move them
into xe_gt.c. Generally in lib header include only what is
needed by test(s) which will use lib header.

Regards,
Kamil

> +
> +bool has_xe_gt_reset(int fd);
> +void xe_force_gt_reset_all(int fd);
> +
> -- 
> 2.25.1
> 
