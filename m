Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303C710E57A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 11:14:57 +0000 (UTC)
Date: Fri, 11 Mar 2022 12:14:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YisvLNAmPsQnlF1j@kamilkon-DESK1>
References: <20220310071529.61930-1-zbigniew.kempczynski@intel.com>
 <20220310071529.61930-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220310071529.61930-4-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] lib/i915: Introduce library
 intel_mocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,

Dnia 2022-03-10 at 08:15:26 +0100, Zbigniew Kempczyński napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add new library intel_mocs for mocs settings.
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/i915/intel_mocs.c | 56 +++++++++++++++++++++++++++++++++++++++++++
>  lib/i915/intel_mocs.h | 25 +++++++++++++++++++
>  lib/meson.build       |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 lib/i915/intel_mocs.c
>  create mode 100644 lib/i915/intel_mocs.h
> 
> diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
> new file mode 100644
> index 0000000000..63ead1118f
> --- /dev/null
> +++ b/lib/i915/intel_mocs.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "i915/gem.h"
> +#include "intel_mocs.h"
> +
> +static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
> +{
> +	uint16_t devid = intel_get_drm_devid(fd);
> +
> +	/*
> +	 * Gen >= 12 onwards don't have a setting for PTE,
> +	 * so using I915_MOCS_PTE as mocs index may leads to
> +	 * some undefined MOCS behavior.
> +	 * This helper function is providing current UC as well
> +	 * as WB MOCS index based on platform.
> +	 */
> +	if (IS_DG1(devid)) {
> +		mocs->uc_index = DG1_MOCS_UC_IDX;
> +		mocs->wb_index = DG1_MOCS_WB_IDX;
> +	} else if (IS_DG2(devid)) {
> +		mocs->uc_index = DG2_MOCS_UC_IDX;
> +		mocs->wb_index = DG2_MOCS_WB_IDX;
> +
> +	} else if (IS_GEN12(devid)) {
> +		mocs->uc_index = GEN12_MOCS_UC_IDX;
> +		mocs->wb_index = GEN12_MOCS_WB_IDX;
> +	} else {
> +		mocs->uc_index = I915_MOCS_PTE;
> +		mocs->wb_index = I915_MOCS_CACHED;
> +		igt_info("C1\n");

Remove this or make it igt_debug.

> +	}
> +}
> +
> +/* BitField [6:1] represents index to MOCS Tables
> + * BitField [0] represents Encryption/Decryption
> + */
> +
> +uint8_t intel_get_wb_mocs(int fd)
> +{
> +	struct drm_i915_mocs_index mocs;
> +
> +	get_mocs_index(fd, &mocs);
> +	return mocs.wb_index << 1;
> +}
> +
> +uint8_t intel_get_uc_mocs(int fd)
> +{
> +	struct drm_i915_mocs_index mocs;
> +
> +	get_mocs_index(fd, &mocs);
> +	return mocs.uc_index << 1;
> +}
> diff --git a/lib/i915/intel_mocs.h b/lib/i915/intel_mocs.h
> new file mode 100644
> index 0000000000..c05569f426
> --- /dev/null
> +++ b/lib/i915/intel_mocs.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _INTEL_MOCS_H
> +#define _INTEL_MOCS_H
> +
> +#define DG1_MOCS_UC_IDX			1
> +#define DG1_MOCS_WB_IDX			5
> +#define DG2_MOCS_UC_IDX			1
> +#define DG2_MOCS_WB_IDX			3
> +#define GEN12_MOCS_UC_IDX			3
> +#define GEN12_MOCS_WB_IDX			2

Do we need this here ? Can it be placed in lib implementation
and hided there ?

> +#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> +#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25

Same here, there is no uses for this constants. They can stay
if you can tell they will be used in near future.

> +
> +struct drm_i915_mocs_index {
> +	uint8_t uc_index;
> +	uint8_t wb_index;
> +};
> +
> +uint8_t intel_get_wb_mocs(int fd);
> +uint8_t intel_get_uc_mocs(int fd);

These helpers returns uc and wb index, so maybe struct can be
moved to .c implementation ? So we can keep headers clean. It is
up to you, I do not insist on changes in header file.

> +#endif /* _INTEL_MOCS_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 3e43316d1e..a5fe91dc99 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -11,6 +11,7 @@ lib_sources = [
>  	'i915/gem_mman.c',
>  	'i915/gem_vm.c',
>  	'i915/intel_memory_region.c',
> +	'i915/intel_mocs.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
>  	'igt_debugfs.c',
> -- 
> 2.32.0
> 

With that fixed you can add my r-b tag,

Regards,
Kamil
