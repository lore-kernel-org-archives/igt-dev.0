Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A9B10E10B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 12:46:06 +0000 (UTC)
Date: Wed, 6 Dec 2023 13:45:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231206124544.ubphdvgulti3uov7@kamilkon-desk.igk.intel.com>
References: <20231205213814.179963-1-rodrigo.vivi@intel.com>
 <20231205213814.179963-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231205213814.179963-2-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/intel/xe: Align with new
 xe_gt_freq component
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rodrigo,
On 2023-12-05 at 16:38:12 -0500, Rodrigo Vivi wrote:
> Aligns with kernel commit ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
> 
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
>  tests/intel/xe_gt_freq.c                 | 16 ++++++++--------
>  tests/meson.build                        |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f48e8fb67..7648ec3f3 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -83,9 +83,9 @@ igt@xe_exec_threads@threads-mixed-fd-basic
>  igt@xe_exec_threads@threads-mixed-userptr-invalidate
>  igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
>  igt@xe_gpgpu_fill@basic
> -igt@xe_guc_pc@freq_basic_api
> -igt@xe_guc_pc@freq_fixed_idle
> -igt@xe_guc_pc@freq_range_idle
> +igt@xe_gt_freq@freq_basic_api
> +igt@xe_gt_freq@freq_fixed_idle
> +igt@xe_gt_freq@freq_range_idle
>  igt@xe_huc_copy@huc_copy
>  igt@xe_intel_bb@add-remove-objects
>  igt@xe_intel_bb@bb-with-allocator
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index a92833acb..719852530 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -1,12 +1,12 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2022 Intel Corporation
> + * Copyright © 2023 Intel Corporation
---------------------^
Please just add new year after 2022, for example:

 * Copyright © 2022,2023 Intel Corporation

>   */
>  
>  /**
> - * TEST: Test GuC frequency request functionality
> - * Category: Firmware building block
> - * Sub-category: GuC
> + * TEST: Test Xe GT frequency request functionality
> + * Category: Infrastructure
> + * Sub-category: frequency
>   * Functionality: frequency request
>   * Test category: functionality test
>   */
> @@ -34,10 +34,10 @@
>  static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>  {
>  	int ret = -EAGAIN;
> -	char freq_attr[16];
> +	char freq_attr[22];
------------------ ^^
Why not define it and use in all places?

>  	int gt_fd;
>  
> -	snprintf(freq_attr, sizeof(freq_attr), "%s_freq", freq_name);
> +	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
See below.

>  	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>  	igt_assert(gt_fd >= 0);
>  
> @@ -52,10 +52,10 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
>  {
>  	uint32_t freq;
>  	int err = -EAGAIN;
> -	char freq_attr[16];
> +	char freq_attr[22];
>  	int gt_fd;
>  
> -	snprintf(freq_attr, sizeof(freq_attr), "%s_freq", freq_name);
> +	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);

This is duplicated code, it can be written in one function,
may be left to follow up.

With above copyright fixed:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>  	igt_assert(gt_fd >= 0);
>  
> diff --git a/tests/meson.build b/tests/meson.build
> index facf60ccf..f6cfbcf5e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -293,7 +293,7 @@ intel_xe_progs = [
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
>  	'xe_gpgpu_fill',
> -	'xe_guc_pc',
> +	'xe_gt_freq',
>  	'xe_huc_copy',
>  	'xe_intel_bb',
>  	'xe_live_ktest',
> -- 
> 2.43.0
> 
