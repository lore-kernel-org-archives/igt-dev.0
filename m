Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8110811AE48
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Dec 2021 12:36:19 +0000 (UTC)
Date: Mon, 20 Dec 2021 13:36:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YcB4vuvjbLlIlV2+@zkempczy-mobl2>
References: <20211219131443.472654-1-apoorva1.singh@intel.com>
 <20211219131443.472654-2-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211219131443.472654-2-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v5 1/5] lib/i915: Introduce library intel_mocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Dec 19, 2021 at 06:44:39PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add new library intel_mocs for mocs settings.
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/i915/intel_mocs.c | 51 +++++++++++++++++++++++++++++++++++++++++++
>  lib/i915/intel_mocs.h | 23 +++++++++++++++++++
>  lib/meson.build       |  1 +
>  3 files changed, 75 insertions(+)
>  create mode 100644 lib/i915/intel_mocs.c
>  create mode 100644 lib/i915/intel_mocs.h
> 
> diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
> new file mode 100644
> index 00000000..021aef03
> --- /dev/null
> +++ b/lib/i915/intel_mocs.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
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
> +	} else if (IS_GEN12(devid)) {
> +		mocs->uc_index = GEN12_MOCS_UC_IDX;
> +		mocs->wb_index = GEN12_MOCS_WB_IDX;
> +	} else {
> +		mocs->uc_index = I915_MOCS_PTE;
> +		mocs->wb_index = I915_MOCS_CACHED;
> +	}
> +}

Ok, this looks better for me right now.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


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
> index 00000000..92d0d920
> --- /dev/null
> +++ b/lib/i915/intel_mocs.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#ifndef _INTEL_MOCS_H
> +#define _INTEL_MOCS_H
> +
> +#define DG1_MOCS_UC_IDX			1
> +#define DG1_MOCS_WB_IDX			5
> +#define GEN12_MOCS_UC_IDX			3
> +#define GEN12_MOCS_WB_IDX			2
> +#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> +#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
> +
> +struct drm_i915_mocs_index {
> +	uint8_t uc_index;
> +	uint8_t wb_index;
> +};
> +
> +uint8_t intel_get_wb_mocs(int fd);
> +uint8_t intel_get_uc_mocs(int fd);
> +#endif /* _INTEL_MOCS_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index b9568a71..f500f0f1 100644
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
> 2.25.1
> 
