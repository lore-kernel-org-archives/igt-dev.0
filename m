Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23910E1E0
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 13:52:22 +0000 (UTC)
Message-ID: <393c5f00-57c9-5121-908e-68a3097da160@linux.intel.com>
Date: Fri, 11 Aug 2023 15:52:16 +0200
MIME-Version: 1.0
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
References: <20230807035805.1054349-1-janga.rahul.kumar@intel.com>
 <20230807035805.1054349-2-janga.rahul.kumar@intel.com>
 <SN6PR11MB34245FD8EAB29FBFAF349388D013A@SN6PR11MB3424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <SN6PR11MB34245FD8EAB29FBFAF349388D013A@SN6PR11MB3424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/xe: Add support to reset all
 GT's
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hey,

Den 2023-08-10 kl. 12:17, skrev Ch, Sai Gowtham:
>
> -----Original Message-----
> From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Sent: Monday, August 7, 2023 9:28 AM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>; kamil.konieczny@linux.intel.com; Karas, Anna <anna.karas@intel.com>
> Subject: [PATCH i-g-t 1/3] lib/xe: Add support to reset all GT's
>
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
> ---
>   lib/meson.build |  1 +
>   lib/xe/xe_gt.c  | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_gt.h  | 27 +++++++++++++++++++++
>   3 files changed, 90 insertions(+)
>   create mode 100644 lib/xe/xe_gt.c
>   create mode 100644 lib/xe/xe_gt.h
>
> diff --git a/lib/meson.build b/lib/meson.build index ce11c0715..b7bfcf4f0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -103,6 +103,7 @@ lib_sources = [
>   	'igt_dsc.c',
>   	'xe/xe_compute.c',
>   	'xe/xe_compute_square_kernels.c',
> +	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c new file mode 100644 index 000000000..9cad739be
> --- /dev/null
> +++ b/lib/xe/xe_gt.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Authors:
> + *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> + */
> +
> +#include <fcntl.h>
> +
> I don’t think new line is needed here.
> +#include "xe_gt.h"
> +
> +/**
> + * has_xe_gt_reset:
> + * @fd: open xe drm file descriptor
> + *
> + * Check gt force reset sysfs entry is available or not
> + *
> + * Returns: reset sysfs entry available  */ bool has_xe_gt_reset(int
> +fd) {
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

We can reset a gt by only opening a file in debugfs? That seems like a 
terrible api, we should probably force it to only reset by writing 1 or 
something instead..

Cheers,

~Maarten
