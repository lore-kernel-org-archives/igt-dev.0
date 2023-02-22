Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7428010EA45
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Feb 2023 16:35:42 +0000 (UTC)
Date: Wed, 22 Feb 2023 17:35:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230222163537.ou3kp2bu7lg3evug@kamilkon-desk1>
References: <20230221114621.32785-1-zbigniew.kempczynski@intel.com>
 <20230221114621.32785-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221114621.32785-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib/xe: Introduce Xe library
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

I have few nits, see below. I did not review all code so
please expect more review in future.

On 2023-02-21 at 12:46:15 +0100, Zbigniew Kempczyński wrote:
> Xe, is a new driver for Intel GPUs that supports both integrated
> and discrete platforms starting with Tiger Lake (first Intel Xe
> Architecture).
> 
> Series was split to allow easier review. Library, drm uapi, tests,
> tools and other were squashed according to code subject.
> 
> This patch introduces library used for Xe tests. As there's not
> too trivial to calculate credits for squashed subjects full series
> credits are:
> 
> Co-developed-by: Matthew Brost
> [commits: 90 / lines changed: 12574]
> Co-developed-by: Mauro Carvalho Chehab
> [commits: 28 / lines changed: 1873]
> Co-developed-by: Rodrigo Vivi
> [commits: 15 / lines changed: 1317]
> Co-developed-by: Jason Ekstrand
> [commits: 14 / lines changed: 1418]
> Co-developed-by: Francois Dugast
> [commits: 8 / lines changed: 1082]
> Co-developed-by: Philippe Lecluse
> [commits: 6 / lines changed: 560]
> Co-developed-by: Zbigniew Kempczyński
> [commits: 4 / lines changed: 1091]
> Co-developed-by: Matthew Auld
> [commits: 3 / lines changed: 35]
> Co-developed-by: Niranjana Vishwanathapura
> [commits: 2 / lines changed: 66]
> Co-developed-by: Maarten Lankhorst
> [commits: 2 / lines changed: 774]
> Co-developed-by: Ryszard Knop
> [commits: 1 / lines changed: 12]
> Co-developed-by: Thomas Hellström
> [commits: 1 / lines changed: 12]
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/drmtest.c       |   3 +
>  lib/drmtest.h       |   1 +
>  lib/igt_map.c       |  32 ++++
>  lib/igt_map.h       |   3 +

May you split igt_map changes from this series and send
separatly ? imho it can be merged as is or at least merged as
separate enhancement.

>  lib/igt_pm.c        |  12 ++
>  lib/igt_pm.h        |   1 +

Same here, these also can be merged as is.

>  lib/meson.build     |   4 +
>  lib/xe/xe_compute.c | 327 ++++++++++++++++++++++++++++++++
>  lib/xe/xe_compute.h |  93 ++++++++++
>  lib/xe/xe_ioctl.c   | 441 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h   | 107 +++++++++++
>  lib/xe/xe_query.c   | 377 +++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_query.h   |  82 ++++++++
>  lib/xe/xe_spin.c    | 157 ++++++++++++++++
>  lib/xe/xe_spin.h    |  66 +++++++
>  meson.build         |   8 +
>  16 files changed, 1714 insertions(+)
>  create mode 100644 lib/xe/xe_compute.c
>  create mode 100644 lib/xe/xe_compute.h
>  create mode 100644 lib/xe/xe_ioctl.c
>  create mode 100644 lib/xe/xe_ioctl.h
>  create mode 100644 lib/xe/xe_query.c
>  create mode 100644 lib/xe/xe_query.h
>  create mode 100644 lib/xe/xe_spin.c
>  create mode 100644 lib/xe/xe_spin.h
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 16e80bdf..859f66ff 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -189,6 +189,7 @@ static const struct module {
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> +	{ DRIVER_XE, "xe" },
>  	{}
>  };
>  
> @@ -547,6 +548,8 @@ static const char *chipset_to_str(int chipset)
>  		return "panfrost";
>  	case DRIVER_MSM:
>  		return "msm";
> +	case DRIVER_XE:
> +		return "xe";
>  	case DRIVER_ANY:
>  		return "any";
>  	default:
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index b5debd44..448ac03b 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -51,6 +51,7 @@
>  #define DRIVER_V3D	(1 << 4)
>  #define DRIVER_PANFROST	(1 << 5)
>  #define DRIVER_MSM	(1 << 6)
> +#define DRIVER_XE	(1 << 7)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> diff --git a/lib/igt_map.c b/lib/igt_map.c
> index da8713a1..8f5ed896 100644
> --- a/lib/igt_map.c
> +++ b/lib/igt_map.c
> @@ -500,3 +500,35 @@ igt_map_random_entry(struct igt_map *map,
>  
>  	return NULL;
>  }
> +
> +#define GOLDEN_RATIO_PRIME_32 0x9e370001UL
> +/**
> + * igt_map_hash_32:
> + * @key: 32-bit key casted to pointer
> + *
> + * Function is hashing function for 32-bit keys.
> + */
> +uint32_t igt_map_hash_32(const void *key)
> +{
> +	uint32_t hash = (unsigned long)key;
> +
> +	hash = hash * GOLDEN_RATIO_PRIME_32;
> +	return hash;
> +}
> +
> +/**
> + * igt_map_equal_32:
> + * @key1: first 32-bit key casted to pointer
> + * @key2: second 32-bit key casted to pointer
> + *
> + * Function compares 32-bit keys.
> + */
> +int igt_map_equal_32(const void *key1, const void *key2)
> +{
> +	int v1, v2;
> +
> +	v1 = (unsigned long)key1;
> +	v2 = (unsigned long)key2;
> +
> +	return v1 == v2;
> +}
> diff --git a/lib/igt_map.h b/lib/igt_map.h
> index cadcd6e3..1b651d3a 100644
> --- a/lib/igt_map.h
> +++ b/lib/igt_map.h
> @@ -171,4 +171,7 @@ igt_map_insert_pre_hashed(struct igt_map *map,
>  			     uint32_t hash,
>  			     const void *key, void *data);
>  
> +uint32_t igt_map_hash_32(const void *key);
> +int igt_map_equal_32(const void *key1, const void *key2);
> +
>  #endif
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 26e8c9f0..0ffd64d7 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1355,3 +1355,15 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>  
>  	return -1;
>  }
> +
> +int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
> +{
> +	char usage_str[64];
> +	int usage, fd;
> +
> +	fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_usage");
> +	if (igt_pm_read_power_attr(fd, usage_str, 64, true))
> +		igt_assert(sscanf(usage_str, "%d", &usage) > 0);
> +
> +	return usage;
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index f65b960c..d0d6d673 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -86,5 +86,6 @@ void igt_pm_restore_pci_card_runtime_pm(void);
>  void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled(int fd);
>  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  
>  #endif /* IGT_PM_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index c5131d9a..768ce90b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -98,6 +98,10 @@ lib_sources = [
>  	'veboxcopy_gen12.c',
>  	'igt_msm.c',
>  	'igt_dsc.c',
> +	'xe/xe_compute.c',
> +	'xe/xe_ioctl.c',
> +	'xe/xe_query.c',
> +	'xe/xe_spin.c'
>  ]
>  
>  lib_deps = [
> diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
> new file mode 100644
> index 00000000..d9d9e4a4
> --- /dev/null
> +++ b/lib/xe/xe_compute.c
> @@ -0,0 +1,327 @@
> +/*

Put SPDX with MIT licence here.

> + * Copyright © 2022 Intel Corporation
----------------- ^
Maybe 2023 ?

> + *

Delete long licence text below, SPDX replaces it.

> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.	IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *		Francois Dugast <francois.dugast@intel.com>
> + */
> +
> +#include <stdint.h>
> +
> +#include "xe_compute.h"
> +
> +#define PIPE_CONTROL			0x7a000004
> +#define MI_LOAD_REGISTER_IMM		0x11000001
> +#define PIPELINE_SELECT			0x69040302
> +#define MEDIA_VFE_STATE			0x70000007
> +#define STATE_BASE_ADDRESS		0x61010014
> +#define MEDIA_STATE_FLUSH		0x0
> +#define MEDIA_INTERFACE_DESCRIPTOR_LOAD	0x70020002
> +#define GPGPU_WALKER			0x7105000d
> +#define MI_BATCH_BUFFER_END		(0xA << 23)
> +
> +void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output) {
> +        int b = 0;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00010000;
> +	addr_bo_buffer_batch[b++] = 0x00030002;
> +	addr_bo_buffer_batch[b++] = 0x00050004;
> +	addr_bo_buffer_batch[b++] = 0x00070006;
> +	addr_bo_buffer_batch[b++] = 0x00090008;
> +	addr_bo_buffer_batch[b++] = 0x000B000A;
> +	addr_bo_buffer_batch[b++] = 0x000D000C;
> +	addr_bo_buffer_batch[b++] = 0x000F000E;
> +	addr_bo_buffer_batch[b++] = 0x00110010;
> +	addr_bo_buffer_batch[b++] = 0x00130012;
> +	addr_bo_buffer_batch[b++] = 0x00150014;
> +	addr_bo_buffer_batch[b++] = 0x00170016;
> +	addr_bo_buffer_batch[b++] = 0x00190018;
> +	addr_bo_buffer_batch[b++] = 0x001B001A;
> +	addr_bo_buffer_batch[b++] = 0x001D001C;
> +	addr_bo_buffer_batch[b++] = 0x001F001E;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00210020;
> +	addr_bo_buffer_batch[b++] = 0x00230022;
> +	addr_bo_buffer_batch[b++] = 0x00250024;
> +	addr_bo_buffer_batch[b++] = 0x00270026;
> +	addr_bo_buffer_batch[b++] = 0x00290028;
> +	addr_bo_buffer_batch[b++] = 0x002B002A;
> +	addr_bo_buffer_batch[b++] = 0x002D002C;
> +	addr_bo_buffer_batch[b++] = 0x002F002E;
> +	addr_bo_buffer_batch[b++] = 0x00310030;
> +	addr_bo_buffer_batch[b++] = 0x00330032;
> +	addr_bo_buffer_batch[b++] = 0x00350034;
> +	addr_bo_buffer_batch[b++] = 0x00370036;
> +	addr_bo_buffer_batch[b++] = 0x00390038;
> +	addr_bo_buffer_batch[b++] = 0x003B003A;
> +	addr_bo_buffer_batch[b++] = 0x003D003C;
> +	addr_bo_buffer_batch[b++] = 0x003F003E;
> +}
> +
> +void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output) {
> +        int b = 0;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x87FD4000;
> +	addr_bo_buffer_batch[b++] = 0x04000000;
> +	addr_bo_buffer_batch[b++] = 0x001F007F;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00004000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x87FD4000;
> +	addr_bo_buffer_batch[b++] = 0x04000000;
> +	addr_bo_buffer_batch[b++] = 0x001F007F;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00004000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000040;
> +	addr_bo_buffer_batch[b++] = 0x00000080;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
> +void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch, uint64_t offset_kernel) {
> +        int b = 0;
> +	addr_bo_buffer_batch[b++] = offset_kernel;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00180000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x000000C0;
> +	addr_bo_buffer_batch[b++] = 0x00060000;
> +	addr_bo_buffer_batch[b++] = 0x00000010;
> +	addr_bo_buffer_batch[b++] = 0x00000003;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
> +void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
> +	uint64_t addr_surface_state_base, uint64_t addr_dynamic_state_base,
> +	uint64_t addr_indirect_object_base, uint64_t offset_indirect_data_start) {
> +        int b = 0;
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] = 0x00002580;
> +	addr_bo_buffer_batch[b++] = 0x00060002;
> +	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] = 0x00007034;
> +	addr_bo_buffer_batch[b++] = 0x60000321;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] = 0x0000E404;
> +	addr_bo_buffer_batch[b++] = 0x00000100;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00101021;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00A70100;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x07820000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100420;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00040000;
> +	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x1;
> +	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x1;
> +	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x1;
> +	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32) | 0xffff0000;
> +	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x41;
> +	addr_bo_buffer_batch[b++] = addr_indirect_object_base >> 32;
> +	addr_bo_buffer_batch[b++] = 0xFFFFF001;
> +	addr_bo_buffer_batch[b++] = 0x00010001;
> +	addr_bo_buffer_batch[b++] = 0xFFFFF001;
> +	addr_bo_buffer_batch[b++] = 0xFFFFF001;
> +	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x1;
> +	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> +	addr_bo_buffer_batch[b++] = 0x003BF000;
> +	addr_bo_buffer_batch[b++] = 0x00000041;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = MEDIA_STATE_FLUSH;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = MEDIA_INTERFACE_DESCRIPTOR_LOAD;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000020;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = GPGPU_WALKER;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000c80;
> +	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
> +	addr_bo_buffer_batch[b++] = 0x8000000f;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000002;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0xffffffff;
> +	addr_bo_buffer_batch[b++] = 0xffffffff;
> +	addr_bo_buffer_batch[b++] = MEDIA_STATE_FLUSH;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] = 0x00100120;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> +}
> diff --git a/lib/xe/xe_compute.h b/lib/xe/xe_compute.h
> new file mode 100644
> index 00000000..52b0aa51
> --- /dev/null
> +++ b/lib/xe/xe_compute.h
> @@ -0,0 +1,93 @@
> +/*

Same here, use SPDX with MIT.

> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.	IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *		Francois Dugast <francois.dugast@intel.com>
> + */
> +
> +#ifndef XE_COMPUTE_H
> +#define XE_COMPUTE_H
> +
> +void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output);
> +void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch, uint64_t addr_input, uint64_t addr_output);
> +void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch, uint64_t offset_kernel);
> +void tgllp_create_batch_compute(
> +	uint32_t *addr_bo_buffer_batch,

May you put it in the same line as function definition
and split other ?

> +	uint64_t addr_surface_state_base,
> +	uint64_t addr_dynamic_state_base,
> +	uint64_t addr_indirect_object_base,
> +	uint64_t offset_indirect_data_start);
> +
> +// generated with: ocloc -file kernel.cl -device tgllp && xxd -i kernel_Gen12LPlp.gen
> +unsigned char tgllp_kernel_square_bin[] = {

These should be placed in .c file.

> +	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> +	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> +	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> +	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
> +	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
> +	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
> +	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
> +	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> +	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> +	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> +	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> +	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
> +	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
> +	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> +	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> +	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
> +	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
> +	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> +	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> +	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
> +	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x14, 0x12, 0x02, 0xcc, 0x14, 0x1a, 0x96, 0x00,
> +	0x25, 0x00, 0x05, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00,
> +	0x31, 0x44, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x1c, 0x0c, 0x03, 0x00, 0xa0,
> +	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
> +	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> +	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +};
> +unsigned int tgllp_kernel_square_length = 576;
-------------------------------------------- ^
Better to use sizeof.

> +
> +#endif	/* XE_COMPUTE_H */
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> new file mode 100644
> index 00000000..e653aa1e
> --- /dev/null
> +++ b/lib/xe/xe_ioctl.c
> @@ -0,0 +1,441 @@
> +/*

Same here, use SPDX with MIT.

> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Jason Ekstrand <jason@jlekstrand.net>
> + *    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifdef HAVE_LIBGEN_H
> +#include <libgen.h>
> +#endif
> +#include <stdio.h>
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +#include <sys/ioctl.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +#include <pciaccess.h>
> +#include <getopt.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/wait.h>
> +#include <sys/types.h>
> +#include <sys/syscall.h>
> +#include <sys/utsname.h>
> +#include <termios.h>
> +#include <errno.h>

Sort system includes alphabetically.

> +
> +#include "drmtest.h"
> +#include "config.h"
> +
> +#ifdef HAVE_VALGRIND
> +#include <valgrind/valgrind.h>
> +#include <valgrind/memcheck.h>
> +
> +#define VG(x) x
> +#else
> +#define VG(x) do {} while (0)
> +#endif

Is this needed here ? If possible move it after igt includes.

> +
> +#include "xe_ioctl.h"
> +#include "xe_query.h"
> +#include "igt_syncobj.h"
> +#include "ioctl_wrappers.h"
> +
> +uint32_t
> +xe_cs_prefetch_size(int fd)

This is mixing style, please write it in one line:

uint32_t xe_cs_prefetch_size(int fd)

> +{
> +	return 512;
> +}
> +
> +uint32_t
> +xe_vm_create(int fd, uint32_t flags, uint64_t ext)

Same here.

> +{
> +	struct drm_xe_vm_create create = {
> +		.extensions = ext,
> +		.flags = flags,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create), 0);
> +
> +	return create.vm_id;
> +}
> +
> +void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
> +			    uint32_t bo, struct drm_xe_sync *sync,
> +			    uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, bo, 0, 0, 0,
-------- ^
This is defined below but imho it is better to call
igt_ioctl and assert here, it will help in debug.

> +			    XE_VM_BIND_OP_UNMAP_ALL | XE_VM_BIND_FLAG_ASYNC,
> +			    sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
> +		      struct drm_xe_vm_bind_op *bind_ops,
> +		      uint32_t num_bind, struct drm_xe_sync *sync,
> +		      uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind = {
> +		.vm_id = vm,
> +		.num_binds = num_bind,
> +		.vector_of_binds = (uintptr_t)bind_ops,
> +		.num_syncs = num_syncs,
> +		.syncs = (uintptr_t)sync,
> +		.engine_id = engine,
> +	};
> +
> +	igt_assert(num_bind > 1);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
> +}
> +
> +int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
> +		  uint64_t ext)
> +{
> +	struct drm_xe_vm_bind bind = {
> +		.extensions = ext,
> +		.vm_id = vm,
> +		.num_binds = 1,
> +		.bind.obj = bo,
> +		.bind.obj_offset = offset,
> +		.bind.range = size,
> +		.bind.addr = addr,
> +		.bind.op = op,
> +		.bind.region = region,
> +		.num_syncs = num_syncs,
> +		.syncs = (uintptr_t)sync,
> +		.engine_id = engine,
> +	};
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
-------- ^
imho this function acts only as wrapper and should be avoided,
it is better to code this directly in each function or use
macro instead (if you want to avoid typing).

Regards,
Kamil

> +			  uint64_t offset, uint64_t addr, uint64_t size,
> +			  uint32_t op, struct drm_xe_sync *sync,
> +			  uint32_t num_syncs, uint32_t region, uint64_t ext)
> +{
> +	igt_assert_eq(__xe_vm_bind(fd, vm, engine, bo, offset, addr, size,
> +				   op, sync, num_syncs, region, ext), 0);
> +}
> +
> +void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		uint64_t addr, uint64_t size,
> +		struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
> +			    XE_VM_BIND_OP_MAP, sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> +		  uint64_t addr, uint64_t size,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
> +			    XE_VM_BIND_OP_UNMAP, sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine, uint64_t offset,
> +			  uint64_t addr, uint64_t size,
> +			  struct drm_xe_sync *sync, uint32_t num_syncs,
> +			  uint32_t region)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, offset, addr, size,
> +			    XE_VM_BIND_OP_PREFETCH | XE_VM_BIND_FLAG_ASYNC,
> +			    sync, num_syncs, region, 0);
> +}
> +
> +void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		      uint64_t offset, uint64_t addr, uint64_t size,
> +		      struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, bo, offset, addr, size,
> +			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, sync,
> +			    num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +			    uint64_t offset, uint64_t addr, uint64_t size,
> +			    struct drm_xe_sync *sync, uint32_t num_syncs,
> +			    uint32_t flags)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, bo, offset, addr, size,
> +			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC | flags,
> +			    sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
> +			      uint64_t userptr, uint64_t addr, uint64_t size,
> +			      struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, userptr, addr, size,
> +			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC,
> +			    sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t engine,
> +				    uint64_t userptr, uint64_t addr,
> +				    uint64_t size, struct drm_xe_sync *sync,
> +				    uint32_t num_syncs, uint32_t flags)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, userptr, addr, size,
> +			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC |
> +			    flags, sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
> +			uint64_t offset, uint64_t addr, uint64_t size,
> +			struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, offset, addr, size,
> +			    XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC, sync,
> +			    num_syncs, 0, 0);
> +}
> +
> +static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +			      uint64_t addr, uint64_t size, uint32_t op)
> +{
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +
> +	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
> +			    0);
> +
> +	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		     uint64_t addr, uint64_t size)
> +{
> +	__xe_vm_bind_sync(fd, vm, bo, offset, addr, size, XE_VM_BIND_OP_MAP);
> +}
> +
> +void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
> +		       uint64_t addr, uint64_t size)
> +{
> +	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, XE_VM_BIND_OP_UNMAP);
> +}
> +
> +void xe_vm_destroy(int fd, uint32_t vm)
> +{
> +	struct drm_xe_vm_destroy destroy = {
> +		.vm_id = vm,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
> +}
> +
> +uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
> +{
> +	struct drm_xe_gem_create create = {
> +		.vm_id = vm,
> +		.size = size,
> +		.flags = flags,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create), 0);
> +
> +	return create.handle;
> +}
> +
> +uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
> +{
> +	struct drm_xe_gem_create create = {
> +		.vm_id = vm,
> +		.size = size,
> +		.flags = vram_if_possible(fd, gt),
> +	};
> +	int err;
> +
> +	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
> +	igt_assert_eq(err, 0);
> +
> +	return create.handle;
> +}
> +
> +uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext)
> +{
> +	struct drm_xe_engine_class_instance instance = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> +	};
> +	struct drm_xe_engine_create create = {
> +		.extensions = ext,
> +		.vm_id = vm,
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(&instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
> +
> +	return create.engine_id;
> +}
> +
> +uint32_t xe_engine_create(int fd, uint32_t vm,
> +			  struct drm_xe_engine_class_instance *instance,
> +			  uint64_t ext)
> +{
> +	struct drm_xe_engine_create create = {
> +		.extensions = ext,
> +		.vm_id = vm,
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
> +
> +	return create.engine_id;
> +}
> +
> +uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class)
> +{
> +	struct drm_xe_engine_class_instance instance = {
> +		.engine_class = class,
> +		.engine_instance = 0,
> +		.gt_id = 0,
> +	};
> +	struct drm_xe_engine_create create = {
> +		.vm_id = vm,
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(&instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
> +
> +	return create.engine_id;
> +}
> +
> +void xe_engine_destroy(int fd, uint32_t engine)
> +{
> +	struct drm_xe_engine_destroy destroy = {
> +		.engine_id = engine,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_DESTROY, &destroy), 0);
> +}
> +
> +uint64_t xe_bo_mmap_offset(int fd, uint32_t bo)
> +{
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = bo,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +
> +	return mmo.offset;
> +}
> +
> +void *xe_bo_map(int fd, uint32_t bo, size_t size)
> +{
> +	uint64_t mmo;
> +	void *map;
> +
> +	mmo = xe_bo_mmap_offset(fd, bo);
> +	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> +	igt_assert(map != MAP_FAILED);
> +
> +	return map;
> +}
> +
> +void __xe_exec_assert(int fd, struct drm_xe_exec *exec)
> +{
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec), 0);
> +}
> +
> +void xe_exec(int fd, uint32_t engine, uint64_t addr, struct drm_xe_sync *sync,
> +	     uint32_t num_syncs)
> +{
> +	struct drm_xe_exec exec = {
> +		.engine_id = engine,
> +		.syncs = (uintptr_t)sync,
> +		.num_syncs = num_syncs,
> +		.address = addr,
> +		.num_batch_buffer = 1,
> +	};
> +
> +	__xe_exec_assert(fd, &exec);
> +}
> +
> +void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
> +{
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +
> +	xe_exec(fd, engine, addr, &sync, 1);
> +
> +	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    int64_t timeout)
> +{
> +	struct drm_xe_wait_user_fence wait = {
> +		.addr = to_user_pointer(addr),
> +		.op = DRM_XE_UFENCE_WAIT_EQ,
> +		.flags = !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP : 0,
> +		.value = value,
> +		.mask = DRM_XE_UFENCE_WAIT_U64,
> +		.timeout = timeout,
> +		.num_engines = eci ? 1 :0,
> +		.instances = eci ? to_user_pointer(eci) : 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +}
> +
> +void xe_force_gt_reset(int fd, int gt)
> +{
> +	char reset_string[128];
> +
> +	sprintf(reset_string, "cat /sys/kernel/debug/dri/0/gt%d/force_reset", gt);
> +	system(reset_string);
> +}
> +
> +void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
> +		   uint32_t property, uint32_t value)
> +{
> +	struct drm_xe_vm_madvise madvise = {
> +		.vm_id = vm,
> +		.range = size,
> +		.addr = addr,
> +		.property = property,
> +		.value = value,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_MADVISE, &madvise), 0);
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> new file mode 100644
> index 00000000..240f3bb3
> --- /dev/null
> +++ b/lib/xe/xe_ioctl.h
> @@ -0,0 +1,107 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Jason Ekstrand <jason@jlekstrand.net>
> + *    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifndef XE_IOCTL_H
> +#define XE_IOCTL_H
> +
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <sys/mman.h>
> +#include <xe_drm.h>
> +
> +uint32_t xe_cs_prefetch_size(int fd);
> +uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
> +int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
> +		  uint64_t ext);
> +void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +			  uint64_t offset, uint64_t addr, uint64_t size,
> +			  uint32_t op, struct drm_xe_sync *sync,
> +			  uint32_t num_syncs, uint32_t region, uint64_t ext);
> +void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		uint64_t addr, uint64_t size,
> +		struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> +		  uint64_t addr, uint64_t size,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine,
> +			  uint64_t offset, uint64_t addr, uint64_t size,
> +			  struct drm_xe_sync *sync, uint32_t num_syncs,
> +			  uint32_t region);
> +void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		      uint64_t offset, uint64_t addr, uint64_t size,
> +		      struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
> +			      uint64_t userptr, uint64_t addr, uint64_t size,
> +			      struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +			    uint64_t offset, uint64_t addr, uint64_t size,
> +			    struct drm_xe_sync *sync, uint32_t num_syncs,
> +			    uint32_t flags);
> +void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t engine,
> +				    uint64_t userptr, uint64_t addr,
> +				    uint64_t size, struct drm_xe_sync *sync,
> +				    uint32_t num_syncs, uint32_t flags);
> +void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
> +			uint64_t offset, uint64_t addr, uint64_t size,
> +			struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		     uint64_t addr, uint64_t size);
> +void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
> +		       uint64_t addr, uint64_t size);
> +void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
> +		      struct drm_xe_vm_bind_op *bind_ops,
> +		      uint32_t num_bind, struct drm_xe_sync *sync,
> +		      uint32_t num_syncs);
> +void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
> +			    uint32_t bo, struct drm_xe_sync *sync,
> +			    uint32_t num_syncs);
> +void xe_vm_destroy(int fd, uint32_t vm);
> +uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
> +uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
> +uint32_t xe_engine_create(int fd, uint32_t vm,
> +			  struct drm_xe_engine_class_instance *instance,
> +			  uint64_t ext);
> +uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext);
> +uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class);
> +void xe_engine_destroy(int fd, uint32_t engine);
> +uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
> +void *xe_bo_map(int fd, uint32_t bo, size_t size);
> +void __xe_exec_assert(int fd, struct drm_xe_exec *exec);
> +void xe_exec(int fd, uint32_t engine, uint64_t addr, struct drm_xe_sync *sync,
> +	     uint32_t num_syncs);
> +void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
> +void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    int64_t timeout);
> +void xe_force_gt_reset(int fd, int gt);
> +void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
> +		   uint32_t property, uint32_t value);
> +
> +#endif /* XE_IOCTL_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> new file mode 100644
> index 00000000..7a399788
> --- /dev/null
> +++ b/lib/xe/xe_query.c
> @@ -0,0 +1,377 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <stdlib.h>
> +#include <pthread.h>
> +
> +#include "drmtest.h"
> +#include "ioctl_wrappers.h"
> +#include "igt_map.h"
> +
> +#include "xe_query.h"
> +#include "xe_ioctl.h"
> +
> +static struct drm_xe_query_config *xe_query_config_new(int fd)
> +{
> +	struct drm_xe_query_config *config;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_CONFIG,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	config = malloc(query.size);
> +	igt_assert(config);
> +
> +	query.data = to_user_pointer(config);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	igt_assert(config->num_params > 0);
> +
> +	return config;
> +}
> +
> +static struct drm_xe_query_gts *xe_query_gts_new(int fd)
> +{
> +	struct drm_xe_query_gts *gts;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_GTS,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	gts = malloc(query.size);
> +	igt_assert(gts);
> +
> +	query.data = to_user_pointer(gts);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return gts;
> +}
> +
> +static uint64_t __memory_regions(const struct drm_xe_query_gts *gts)
> +{
> +	uint64_t regions = 0;
> +	int i;
> +
> +	for (i = 0; i < gts->num_gt; i++)
> +		regions |= gts->gts[i].native_mem_regions |
> +			   gts->gts[i].slow_mem_regions;
> +
> +	return regions;
> +}
> +
> +static struct drm_xe_engine_class_instance *
> +xe_query_engines_new(int fd, int *num_engines)
> +{
> +	struct drm_xe_engine_class_instance *hw_engines;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_ENGINES,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert(num_engines);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	hw_engines = malloc(query.size);
> +	igt_assert(hw_engines);
> +
> +	query.data = to_user_pointer(hw_engines);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	*num_engines = query.size / sizeof(*hw_engines);
> +
> +	return hw_engines;
> +}
> +
> +static struct drm_xe_query_mem_usage *xe_query_mem_usage_new(int fd)
> +{
> +	struct drm_xe_query_mem_usage *mem_usage;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	mem_usage = malloc(query.size);
> +	igt_assert(mem_usage);
> +
> +	query.data = to_user_pointer(mem_usage);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return mem_usage;
> +}
> +
> +/* FIXME: Make generic / multi-GT aware */
> +static uint64_t __mem_vram_size(struct drm_xe_query_mem_usage *mem_usage)
> +{
> +	for (int i = 0; i < mem_usage->num_regions; i++)
> +		if (mem_usage->regions[i].mem_class == XE_MEM_REGION_CLASS_VRAM)
> +			return mem_usage->regions[i].total_size;
> +
> +	return 0;
> +}
> +
> +static bool __mem_has_vram(struct drm_xe_query_mem_usage *mem_usage)
> +{
> +	for (int i = 0; i < mem_usage->num_regions; i++)
> +		if (mem_usage->regions[i].mem_class == XE_MEM_REGION_CLASS_VRAM)
> +			return true;
> +
> +	return false;
> +}
> +
> +static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *mem_usage)
> +{
> +	uint32_t alignment = XE_DEFAULT_ALIGNMENT;
> +
> +	for (int i = 0; i < mem_usage->num_regions; i++)
> +		if (alignment < mem_usage->regions[i].min_page_size)
> +			alignment = mem_usage->regions[i].min_page_size;
> +
> +	return alignment;
> +}
> +
> +static bool xe_check_supports_faults(int fd)
> +{
> +	bool supports_faults;
> +
> +	struct drm_xe_vm_create create = {
> +		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> +			 DRM_XE_VM_CREATE_FAULT_MODE,
> +	};
> +
> +	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +
> +	if (supports_faults)
> +		xe_vm_destroy(fd, create.vm_id);
> +
> +	return supports_faults;
> +}
> +
> +const char* xe_engine_class_string(uint32_t engine_class)
> +{
> +	switch (engine_class) {
> +		case DRM_XE_ENGINE_CLASS_RENDER:
> +			return "DRM_XE_ENGINE_CLASS_RENDER";
> +		case DRM_XE_ENGINE_CLASS_COPY:
> +			return "DRM_XE_ENGINE_CLASS_COPY";
> +		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +			return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
> +		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
> +		case DRM_XE_ENGINE_CLASS_COMPUTE:
> +			return "DRM_XE_ENGINE_CLASS_COMPUTE";
> +		default: return "?";
> +	}
> +}
> +
> +static struct xe_device_cache {
> +	pthread_mutex_t cache_mutex;
> +	struct igt_map *map;
> +} cache;
> +
> +static struct xe_device *find_in_cache_unlocked(int fd)
> +{
> +	return igt_map_search(cache.map, from_user_pointer(fd));
> +}
> +
> +static struct xe_device *find_in_cache(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	xe_dev = find_in_cache_unlocked(fd);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +
> +	return xe_dev;
> +}
> +
> +struct xe_device *xe_device_get(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	if (xe_dev) {
> +		igt_debug("Find in cache, fd: %d\n", fd);
> +		return xe_dev;
> +	}
> +	igt_debug("Not found in the cache, allocating\n");
> +
> +	xe_dev = calloc(1, sizeof(*xe_dev));
> +	igt_assert(xe_dev);
> +
> +	xe_dev->fd = fd;
> +	xe_dev->config = xe_query_config_new(fd);
> +	xe_dev->number_gt = xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
> +	xe_dev->va_bits = xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
> +	xe_dev->gts = xe_query_gts_new(fd);
> +	xe_dev->memory_regions = __memory_regions(xe_dev->gts);
> +	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
> +	xe_dev->mem_usage = xe_query_mem_usage_new(fd);
> +	xe_dev->vram_size = __mem_vram_size(xe_dev->mem_usage);
> +	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
> +	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
> +	xe_dev->supports_faults = xe_check_supports_faults(fd);
> +
> +	igt_map_insert(cache.map, from_user_pointer(fd), xe_dev);
> +
> +	return xe_dev;
> +}
> +
> +static void xe_device_free(struct xe_device *xe_dev)
> +{
> +	igt_debug("free device: %d\n", xe_dev->fd);
> +	free(xe_dev->config);
> +	free(xe_dev->gts);
> +	free(xe_dev->hw_engines);
> +	free(xe_dev->mem_usage);
> +	free(xe_dev);
> +}
> +
> +static void delete_in_cache(struct igt_map_entry *entry)
> +{
> +	xe_device_free((struct xe_device *)entry->data);
> +}
> +
> +void xe_device_put(int fd)
> +{
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	if (find_in_cache_unlocked(fd))
> +		igt_map_remove(cache.map, from_user_pointer(fd), delete_in_cache);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +}
> +
> +static void xe_device_destroy_cache(void)
> +{
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	igt_map_destroy(cache.map, delete_in_cache);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +}
> +
> +static void xe_device_cache_init(void)
> +{
> +	pthread_mutex_init(&cache.cache_mutex, NULL);
> +	xe_device_destroy_cache();
> +	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> +}
> +
> +#define RETV(__v) \
> +	struct xe_device *xe_dev;\
> +	xe_dev = find_in_cache(fd);\
> +	igt_assert(xe_dev);\
> +	return xe_dev->__v
> +
> +int xe_number_gt(int fd)
> +{
> +	RETV(number_gt);
> +}
> +
> +uint64_t all_memory_regions(int fd)
> +{
> +	RETV(memory_regions);
> +}
> +
> +uint64_t system_memory(int fd)
> +{
> +	uint64_t regions = all_memory_regions(fd);
> +
> +	return regions & 0x1;
> +}
> +
> +uint64_t vram_memory(int fd, int gt)
> +{
> +	uint64_t regions = all_memory_regions(fd);
> +
> +	return regions & (0x2 << gt);
> +}
> +
> +uint64_t vram_if_possible(int fd, int gt)
> +{
> +	uint64_t regions = all_memory_regions(fd);
> +	uint64_t system_memory = regions & 0x1;
> +	uint64_t vram = regions & (0x2 << gt);
> +
> +	return vram ? vram : system_memory;
> +}
> +
> +struct drm_xe_engine_class_instance *xe_hw_engines(int fd)
> +{
> +	RETV(hw_engines);
> +}
> +
> +struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx)
> +{
> +	struct drm_xe_engine_class_instance *engines = xe_hw_engines(fd);
> +
> +	return &engines[idx];
> +}
> +
> +int xe_number_hw_engines(int fd)
> +{
> +	RETV(number_hw_engines);
> +}
> +
> +bool xe_has_vram(int fd)
> +{
> +	RETV(has_vram);
> +}
> +
> +uint64_t xe_vram_size(int fd)
> +{
> +	RETV(vram_size);
> +}
> +
> +uint32_t xe_get_default_alignment(int fd)
> +{
> +	RETV(default_alignment);
> +}
> +
> +bool xe_supports_faults(int fd)
> +{
> +	RETV(supports_faults);
> +}
> +
> +uint32_t xe_va_bits(int fd)
> +{
> +	RETV(va_bits);
> +}
> +
> +igt_constructor
> +{
> +	xe_device_cache_init();
> +}
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> new file mode 100644
> index 00000000..2db274af
> --- /dev/null
> +++ b/lib/xe/xe_query.h
> @@ -0,0 +1,82 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifndef XE_QUERY_H
> +#define XE_QUERY_H
> +
> +#include <stdint.h>
> +#include <xe_drm.h>
> +#include "igt_list.h"
> +
> +#define XE_DEFAULT_ALIGNMENT           0x1000
> +#define XE_DEFAULT_ALIGNMENT_64K       0x10000
> +
> +struct xe_device {
> +	int fd;
> +
> +	struct drm_xe_query_config *config;
> +	struct drm_xe_query_gts *gts;
> +	uint64_t memory_regions;
> +	struct drm_xe_engine_class_instance *hw_engines;
> +	int number_hw_engines;
> +	struct drm_xe_query_mem_usage *mem_usage;
> +	uint64_t vram_size;
> +	uint32_t default_alignment;
> +	bool has_vram;
> +	bool supports_faults;
> +
> +	int number_gt;
> +	uint32_t va_bits;
> +};
> +
> +#define for_each_hw_engine(__fd, __hwe) \
> +	for (int __i = 0; __i < xe_number_hw_engines(__fd) && \
> +	     (__hwe = xe_hw_engine(__fd, __i)); ++__i)
> +#define for_each_hw_engine_class(__class) \
> +	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
> +	     ++__class)
> +#define for_each_gt(__fd, __gt) \
> +	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
> +
> +int xe_number_gt(int fd);
> +uint64_t all_memory_regions(int fd);
> +uint64_t system_memory(int fd);
> +uint64_t vram_memory(int fd, int gt);
> +uint64_t vram_if_possible(int fd, int gt);
> +struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
> +struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
> +int xe_number_hw_engines(int fd);
> +bool xe_has_vram(int fd);
> +uint64_t xe_vram_size(int fd);
> +uint32_t xe_get_default_alignment(int fd);
> +uint32_t xe_va_bits(int fd);
> +bool xe_supports_faults(int fd);
> +const char* xe_engine_class_string(uint32_t engine_class);
> +
> +struct xe_device *xe_device_get(int fd);
> +void xe_device_put(int fd);
> +
> +#endif	/* XE_QUERY_H */
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> new file mode 100644
> index 00000000..fdbec40e
> --- /dev/null
> +++ b/lib/xe/xe_spin.c
> @@ -0,0 +1,157 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <string.h>
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_syncobj.h"
> +#include "intel_reg.h"
> +#include "xe_ioctl.h"
> +#include "xe_spin.h"
> +
> +void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
> +{
> +	uint64_t batch_offset = (char *)&spin->batch - (char *)spin;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t start_offset = (char *)&spin->start - (char *)spin;
> +	uint64_t start_addr = addr + start_offset;
> +	uint64_t end_offset = (char *)&spin->end - (char *)spin;
> +	uint64_t end_addr = addr + end_offset;
> +	int b = 0;
> +
> +	spin->start = 0;
> +	spin->end = 0xffffffff;
> +
> +	spin->batch[b++] = MI_STORE_DWORD_IMM;
> +	spin->batch[b++] = start_addr;
> +	spin->batch[b++] = start_addr >> 32;
> +	spin->batch[b++] = 0xc0ffee;
> +
> +	if (preempt)
> +		spin->batch[b++] = (0x5 << 23);
> +
> +	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> +	spin->batch[b++] = 0;
> +	spin->batch[b++] = end_addr;
> +	spin->batch[b++] = end_addr >> 32;
> +
> +	spin->batch[b++] = MI_BATCH_BUFFER_START | 1 << 8 | 1;
> +	spin->batch[b++] = batch_addr;
> +	spin->batch[b++] = batch_addr >> 32;
> +
> +	igt_assert(b <= ARRAY_SIZE(spin->batch));
> +}
> +
> +bool xe_spin_started(struct xe_spin *spin)
> +{
> +	return spin->start != 0;
> +}
> +
> +void xe_spin_wait_started(struct xe_spin *spin)
> +{
> +	while(!xe_spin_started(spin));
> +}
> +
> +void xe_spin_end(struct xe_spin *spin)
> +{
> +	spin->end = 0;
> +}
> +
> +void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> +		  struct xe_cork *cork)
> +{
> +	uint64_t addr = 0; /* ZK xe_get_default_alignment(fd); */
> +	size_t bo_size = 0; /* ZK xe_get_default_alignment(fd); */
> +	uint32_t vm, bo, engine, syncobj;
> +	struct xe_spin *spin;
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	bo = xe_bo_create(fd, hwe->gt_id, vm, bo_size);
> +	spin = xe_bo_map(fd, bo, 0x1000);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
> +	engine = xe_engine_create(fd, vm, hwe, 0);
> +	syncobj = syncobj_create(fd, 0);
> +
> +	xe_spin_init(spin, addr, true);
> +	exec.engine_id = engine;
> +	exec.address = addr;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	cork->spin = spin;
> +	cork->fd = fd;
> +	cork->vm = vm;
> +	cork->bo = bo;
> +	cork->engine = engine;
> +	cork->syncobj = syncobj;
> +}
> +
> +bool xe_cork_started(struct xe_cork *cork)
> +{
> +	return xe_spin_started(cork->spin);
> +}
> +
> +void xe_cork_wait_started(struct xe_cork *cork)
> +{
> +	xe_spin_wait_started(cork->spin);
> +}
> +
> +void xe_cork_end(struct xe_cork *cork)
> +{
> +	xe_spin_end(cork->spin);
> +}
> +
> +void xe_cork_wait_done(struct xe_cork *cork)
> +{
> +	igt_assert(syncobj_wait(cork->fd, &cork->syncobj, 1, INT64_MAX, 0,
> +				NULL));
> +}
> +
> +void xe_cork_fini(struct xe_cork *cork)
> +{
> +	syncobj_destroy(cork->fd, cork->syncobj);
> +	xe_engine_destroy(cork->fd, cork->engine);
> +	xe_vm_destroy(cork->fd, cork->vm);
> +	gem_close(cork->fd, cork->bo);
> +}
> +
> +uint32_t xe_cork_sync_handle(struct xe_cork *cork)
> +{
> +	return cork->syncobj;
> +}
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> new file mode 100644
> index 00000000..cf5747f5
> --- /dev/null
> +++ b/lib/xe/xe_spin.h
> @@ -0,0 +1,66 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifndef XE_SPIN_H
> +#define XE_SPIN_H
> +
> +#include <stdint.h>
> +#include <stdbool.h>
> +
> +#include "xe_query.h"
> +
> +/* Mapped GPU object */
> +struct xe_spin {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t start;
> +	uint32_t end;
> +};
> +
> +void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
> +bool xe_spin_started(struct xe_spin *spin);
> +void xe_spin_wait_started(struct xe_spin *spin);
> +void xe_spin_end(struct xe_spin *spin);
> +
> +struct xe_cork {
> +	struct xe_spin *spin;
> +	int fd;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint32_t engine;
> +	uint32_t syncobj;
> +};
> +
> +void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> +		  struct xe_cork *cork);
> +bool xe_cork_started(struct xe_cork *cork);
> +void xe_cork_wait_started(struct xe_cork *cork);
> +void xe_cork_end(struct xe_cork *cork);
> +void xe_cork_wait_done(struct xe_cork *cork);
> +void xe_cork_fini(struct xe_cork *cork);
> +uint32_t xe_cork_sync_handle(struct xe_cork *cork);
> +
> +#endif	/* XE_SPIN_H */
> diff --git a/meson.build b/meson.build
> index e7a68503..2a7f6078 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -261,6 +261,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
>  v3ddir = join_paths(libexecdir, 'v3d')
>  vc4dir = join_paths(libexecdir, 'vc4')
> +xedir = join_paths(libexecdir, 'xe')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
>  python3 = find_program('python3', required : true)
> @@ -308,12 +309,19 @@ if get_option('use_rpath')
>  		vc4_rpathdir = join_paths(vc4_rpathdir, '..')
>  	endforeach
>  	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
> +
> +	xedir_rpathdir = '$ORIGIN'
> +	foreach p : xedir.split('/')
> +		xedir_rpathdir = join_paths(xedir_rpathdir, '..')
> +	endforeach
> +	xedir_rpathdir = join_paths(xedir_rpathdir, libdir)
>  else
>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
>  	amdgpudir_rpathdir = ''
>  	v3d_rpathdir = ''
>  	vc4_rpathdir = ''
> +	xedir_rpathdir = ''
>  endif
>  
>  subdir('lib')
> -- 
> 2.34.1
> 
