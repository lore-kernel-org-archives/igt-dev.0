Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A2CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 14:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FA410E152;
	Wed, 14 Oct 2026 14:53:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B5B10E152
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791989527; x=1823525527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hiF71IaHxZPjPXih44K8+Dox7MSclqpm7WlVIZxkk4M=;
 b=XsgPOCUfT7U9jfAzfZaS4vYFInx5vgVqGZs/L3UAn3XCDGLHOvB74zaS
 rGXjH7tBrpoWIp3O9+89+Hi/DCHd2s+6+jfDuEdgEyl6NfVObTe65yHLl
 y30TCKnTCUMKbu8m9rIYHBRPpYzoXiYI5tq2YGNLm9wRE4dQgzScdk/Cp
 YxkMdhoA3Ic6OyEt3hh3pPcsi5v0+HdO79w+tul9eIXAzW5Xo0lXCCIwQ
 g7soC4bHHdHwQ+kz6PZW6lQMvShJ2J3GUUrNYKgylgTPtrniM1JyzcbSI
 tO5hMupy0RgNGBN/7+adpKPx9CmVdHOO/0+ahzPL/aLJYhvCrI3fwF8ka A==;
X-CSE-ConnectionGUID: CA+3YfG9TmaUpRhY79kTTw==
X-CSE-MsgGUID: 0qytqRjWSIu8qurl/Y1Jgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="642021"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="642021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:52:04 -0700
X-CSE-ConnectionGUID: pwMw6PrMQhSgjzSSMsKwGQ==
X-CSE-MsgGUID: HvC7tFxBR4GTuMZfaIPPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1403514"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:52:00 -0700
Date: Wed, 14 Oct 2026 16:51:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Junhua Shen <Junhua.Shen@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>,
 Xiaogang Chen <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma <yiru.ma@amd.com>
Subject: Re: [PATCH i-g-t v2 2/3] lib/amdgpu: add SVM helper library
 (amd_svm.{c,h})
Message-ID: <20261014145158.mdhncinddtsmsmmn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Junhua Shen <Junhua.Shen@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>,
 Xiaogang Chen <Xiaogang.Chen@amd.com>,
 Jenny Liu <Jenny-Jing.Liu@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma <yiru.ma@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
 <20260825072300.16348-3-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825072300.16348-3-Junhua.Shen@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Junhua,
On 2026-08-25 at 15:22:59 +0800, Junhua Shen wrote:

please drop last (amd_svm.{c,h}), imho this is ok:

[PATCH i-g-t v2 2/3] lib/amdgpu: add SVM helper library

> Add a reusable SVM helper library (lib/amdgpu/amd_svm.{c,h}) wrapping the

Decipher SVM here:

Add a reusable SVM shared virtual memory ...

> amdgpu-drm-svm uapi (DRM_IOCTL_AMDGPU_GEM_SVM) via the render-node CS
> path, along with the corresponding meson wiring.
> 
> Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> ---
>  lib/amdgpu/amd_svm.c | 151 +++++++++++++++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_svm.h |  41 ++++++++++++
>  lib/meson.build      |   1 +
>  3 files changed, 193 insertions(+)
>  create mode 100644 lib/amdgpu/amd_svm.c
>  create mode 100644 lib/amdgpu/amd_svm.h
> 
> diff --git a/lib/amdgpu/amd_svm.c b/lib/amdgpu/amd_svm.c
> new file mode 100644
> index 000000000..b31cfe33f
> --- /dev/null
> +++ b/lib/amdgpu/amd_svm.c
> @@ -0,0 +1,151 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Remove text 'Permission...' to end, SPDX replaces it.

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
> + *
> + */
> +
> +#include "amd_svm.h"
> +
> +#include "amd_memory.h"
> +#include "amd_PM4.h"
> +#include "amd_ip_blocks.h"
> +#include "amd_sdma.h"
> +#include "amd_command_submission.h"
> +#include "igt.h"

IGT headers should be after system ones.

> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/mman.h>
> +#include <sys/user.h>

Please try to use <mman.h> and <user.h> if possible.

> +#include <inttypes.h>
> +
> +

Add description to each new lib function, here and for all
other public functions below.

> +int amdgpu_svm_register_range(amdgpu_device_handle dev,
> +			      void *addr, uint64_t size, uint32_t nattr,
> +			      struct drm_amdgpu_svm_attribute *attrs)
> +{
> +	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
> +				    size, nattr, attrs);
> +}
> +
> +int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
> +				void *addr, uint64_t size)
> +{
> +	return amdgpu_svm_reset_attr(dev, (uint64_t)(uintptr_t)addr, size);
> +}
> +
> +int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
> +				void *addr, uint64_t size, uint32_t location)
> +{
> +	struct drm_amdgpu_svm_attribute attr = {
> +		AMDGPU_SVM_ATTR_PREFETCH_LOC, location
> +	};
> +
> +	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
> +				   size, 1, &attr);
> +}
> +
> +int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
> +				void *addr, uint64_t size,
> +				uint32_t *out)
> +{
> +	struct drm_amdgpu_svm_attribute attr = {
> +		AMDGPU_SVM_ATTR_PREFETCH_LOC, 0
> +	};
> +	int r;
> +
> +	r = amdgpu_svm_get_attr(dev, (uint64_t)(uintptr_t)addr,
> +				size, 1, &attr);
> +	if (r == 0)
> +		*out = attr.value;
> +	return r;
> +}
> +
> +int amdgpu_svm_sdma_fill(amdgpu_device_handle device, uint64_t dst_va,
> +			 uint32_t fill_value, uint32_t fill_size)
> +{
> +	cmd_context_t *ctx;
> +	struct amdgpu_dma_limits limits;
> +	uint64_t max_bytes;
> +	uint64_t dst = dst_va;
> +	uint32_t remaining = fill_size;
> +	int r = 0;
> +
> +	amdgpu_dma_limits_query(device, &limits);
> +	max_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
> +
> +	ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	while (remaining > 0) {
> +		uint32_t chunk = remaining > max_bytes ?
> +				 (uint32_t)max_bytes : remaining;
> +
> +		r = cmd_submit_const_fill(ctx, dst, chunk, fill_value);
> +		if (r)
> +			break;
> +
> +		dst += chunk;
> +		remaining -= chunk;
> +	}
> +
> +	cmd_context_destroy(ctx);
> +	return r;
> +}
> +
> +int amdgpu_svm_sdma_copy(amdgpu_device_handle device, uint64_t dst_va,
> +			 uint64_t src_va, uint32_t copy_size)
> +{
> +	cmd_context_t *ctx;
> +	struct amdgpu_dma_limits limits;
> +	uint64_t max_bytes;
> +	uint64_t dst = dst_va;
> +	uint64_t src = src_va;
> +	uint32_t remaining = copy_size;
> +	int r = 0;
> +
> +	amdgpu_dma_limits_query(device, &limits);
> +	max_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
> +
> +	ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	while (remaining > 0) {
> +		uint32_t chunk = remaining > max_bytes ?
> +				 (uint32_t)max_bytes : remaining;
> +
> +		r = cmd_submit_copy_linear(ctx, src, dst, chunk);
> +		if (r)
> +			break;
> +
> +		src += chunk;
> +		dst += chunk;
> +		remaining -= chunk;
> +	}
> +
> +	cmd_context_destroy(ctx);
> +	return r;
> +}
> diff --git a/lib/amdgpu/amd_svm.h b/lib/amdgpu/amd_svm.h
> new file mode 100644
> index 000000000..588feb3da
> --- /dev/null
> +++ b/lib/amdgpu/amd_svm.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef AMD_SVM_H
> +#define AMD_SVM_H
> +
> +#include "drmtest.h"
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +
> +/*
> + * The IGT-specific convenience helpers below are thin wrappers around that
> + * core libdrm svm set/get/reset APIs.

Decipher 'svm' also here.

> + */
> +
> +int amdgpu_svm_register_range(amdgpu_device_handle dev,
> +			      void *addr, uint64_t size, uint32_t nattr,
> +			      struct drm_amdgpu_svm_attribute *attrs);
> +
> +int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
> +				void *addr, uint64_t size);
> +
> +int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
> +				void *addr, uint64_t size, uint32_t location);
> +int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
> +				void *addr, uint64_t size,
> +				uint32_t *out);
> +
> +/*
> + * Fill / copy an SVM range from the GPU's SDMA engine. @dst_va (and @src_va
> + * for copy) are raw SVM virtual addresses, so they may be SVM VAs with no
> + * backing amdgpu BO.
> + * Returns 0 on success, non-zero on failure.
> + */
> +int amdgpu_svm_sdma_fill(amdgpu_device_handle device, uint64_t dst_va,
> +			 uint32_t fill_value, uint32_t fill_size);
> +int amdgpu_svm_sdma_copy(amdgpu_device_handle device, uint64_t dst_va,
> +			 uint64_t src_va, uint32_t copy_size);
> +
> +#endif /* AMD_SVM_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 3001b473e..6e1d6634c 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -180,6 +180,7 @@ if libdrm_amdgpu.found()
>  	lib_deps += libdrm_amdgpu
>  	lib_sources += [
>  		'amdgpu/amd_memory.c',
> +		'amdgpu/amd_svm.c',

I suggest to keep alphabetical order here, but it is
already broken...


Regards,
Kamil

>  		'amdgpu/amd_command_submission.c',
>  		'amdgpu/amd_compute.c',
>  		'amdgpu/amd_cs_radv.c',
> -- 
> 2.34.1
> 
