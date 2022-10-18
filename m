Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056D10E1FD
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 09:26:44 +0000 (UTC)
Message-ID: <06b92e9e-818b-44da-e788-beff6785e112@intel.com>
Date: Tue, 18 Oct 2022 10:26:39 +0100
MIME-Version: 1.0
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221018071705.3906-1-niranjana.vishwanathapura@intel.com>
 <20221018071705.3906-5-niranjana.vishwanathapura@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071705.3906-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 04/11] lib/vm_bind: Add vm_bind
 specific library functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> Add vm_bind specific library interfaces.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   lib/i915/i915_vm_bind.c | 61 +++++++++++++++++++++++++++++++++++++++++
>   lib/i915/i915_vm_bind.h | 16 +++++++++++
>   lib/meson.build         |  1 +
>   3 files changed, 78 insertions(+)
>   create mode 100644 lib/i915/i915_vm_bind.c
>   create mode 100644 lib/i915/i915_vm_bind.h
> 
> diff --git a/lib/i915/i915_vm_bind.c b/lib/i915/i915_vm_bind.c
> new file mode 100644
> index 0000000000..5624f589b5
> --- /dev/null
> +++ b/lib/i915/i915_vm_bind.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +
> +#include "ioctl_wrappers.h"
> +#include "i915_drm.h"
> +#include "i915_drm_local.h"
> +#include "i915_vm_bind.h"
> +
> +void i915_vm_bind(int i915, uint32_t vm_id, uint64_t va, uint32_t handle,
> +		  uint64_t offset, uint64_t length, uint32_t syncobj,

It's not possible to have a valid syncobj = 0 right?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +		  uint64_t fence_value)
> +{
> +	struct drm_i915_gem_vm_bind bind;
> +
> +	memset(&bind, 0, sizeof(bind));
> +	bind.vm_id = vm_id;
> +	bind.handle = handle;
> +	bind.start = va;
> +	bind.offset = offset;
> +	bind.length = length;
> +	if (syncobj) {
> +		bind.fence.handle = syncobj;
> +		bind.fence.value = fence_value;
> +		bind.fence.flags = I915_TIMELINE_FENCE_SIGNAL;
> +	}
> +
> +	gem_vm_bind(i915, &bind);
> +}
> +
> +void i915_vm_unbind(int i915, uint32_t vm_id, uint64_t va, uint64_t length)
> +{
> +	struct drm_i915_gem_vm_unbind unbind;
> +
> +	memset(&unbind, 0, sizeof(unbind));
> +	unbind.vm_id = vm_id;
> +	unbind.start = va;
> +	unbind.length = length;
> +
> +	gem_vm_unbind(i915, &unbind);
> +}
> +
> +int i915_vm_bind_version(int i915)
> +{
> +	struct drm_i915_getparam gp;
> +	int value = 0;
> +
> +	memset(&gp, 0, sizeof(gp));
> +	gp.param = I915_PARAM_VM_BIND_VERSION;
> +	gp.value = &value;
> +
> +	ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
> +	errno = 0;
> +
> +	return value;
> +}
> diff --git a/lib/i915/i915_vm_bind.h b/lib/i915/i915_vm_bind.h
> new file mode 100644
> index 0000000000..46a382c032
> --- /dev/null
> +++ b/lib/i915/i915_vm_bind.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +#ifndef _I915_VM_BIND_H_
> +#define _I915_VM_BIND_H_
> +
> +#include <stdint.h>
> +
> +void i915_vm_bind(int i915, uint32_t vm_id, uint64_t va, uint32_t handle,
> +		  uint64_t offset, uint64_t length, uint32_t syncobj,
> +		  uint64_t fence_value);
> +void i915_vm_unbind(int i915, uint32_t vm_id, uint64_t va, uint64_t length);
> +int i915_vm_bind_version(int i915);
> +
> +#endif /* _I915_VM_BIND_ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 8d6c8a244a..e50a2b0e79 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -14,6 +14,7 @@ lib_sources = [
>   	'i915/intel_mocs.c',
>   	'i915/i915_blt.c',
>   	'i915/i915_crc.c',
> +	'i915/i915_vm_bind.c',
>   	'igt_collection.c',
>   	'igt_color_encoding.c',
>   	'igt_crc.c',
