Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB68C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 17:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263C410EA11;
	Mon, 25 Mar 2024 17:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+mpIQrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F96B10EA11
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711388170; x=1742924170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BmDDMg5rloMuQI8IR2VKfMgzT2pxgLAtUGY/WXZouH4=;
 b=i+mpIQrHb4d1GVRlfNWkPtrg2DkJHLxK3dgFmoKN6FnXBl/wu8SkMqWL
 nSsNPtoAfHF2P7Yh1Eehiefxd+7rRlma5k6wlUQwA9lpAb9MIjswaahXr
 x9NSJgfHbSRxMNtM01v/IHZSXca8Bc5GM2fmRqYONdRM3+LHHutbqy3bQ
 tRisUROZojfFrWqa1dZnYsj3GnDlIXCvBfx7ENXdNFJfqlJP8jGEN+oZa
 qVgyzoY2HZjI5rL9kXf1XL3oI+2Ofh2+EeAMcUVaPPSA4C0ESUVRMzO6x
 Rgm+gjNxYY7rnvaQDykO3bD1VtvgF90H93nfbm+zAF215534F9z1p8n1x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17841895"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17841895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16084293"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 10:36:09 -0700
Date: Mon, 25 Mar 2024 18:36:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr <piotr.piorkowski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/xe_mmio: Introduce Xe MMIO lib
Message-ID: <20240325173606.pu3r5k3prf6te3kq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr <piotr.piorkowski@intel.com>
References: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
 <20240325155709.3521039-3-piotr.piorkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240325155709.3521039-3-piotr.piorkowski@intel.com>
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

Hi Piórkowski,,
On 2024-03-25 at 16:57:09 +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Currently in IGT we have a library intel_mmio for simple MMIO operations
> on intel GPU devices, but it is limited only to accessing registers,
> has a lot of legacy code related to the i915 and offers no support for
> multi tile.
> Let's reuse the memory mapping from the previous library and add separate
> helpers, dedicated to Xe, for registers and GGTT access that support multi
> tile.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  lib/meson.build   |   3 +-
>  lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_mmio.h  |  37 +++++++++
>  lib/xe/xe_query.c |  19 +++++
>  lib/xe/xe_query.h |   1 +
>  5 files changed, 266 insertions(+), 1 deletion(-)
>  create mode 100644 lib/xe/xe_mmio.c
>  create mode 100644 lib/xe/xe_mmio.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 934bac5c6..2f9666846 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -110,6 +110,7 @@ lib_sources = [
>  	'igt_dsc.c',
>  	'xe/xe_gt.c',
>  	'xe/xe_ioctl.c',
> +	'xe/xe_mmio.c',
>  	'xe/xe_query.c',
>  	'xe/xe_spin.c',
>  	'xe/xe_util.c',
> @@ -162,7 +163,7 @@ if libdrm_amdgpu.found()
>  		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
>  	else
>  		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
> -	endif	
> +	endif
>  endif
>  
>  if libunwind.found()
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> new file mode 100644
> index 000000000..bd4227f25
> --- /dev/null
> +++ b/lib/xe/xe_mmio.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "igt_device.h"
> +
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * xe_mmio_vf_access_init:
> + * @pf_fd: xe device file descriptor
> + * @vf_id: PCI virtual function number (0 if native or PF itself)
> + * @mmio: xe mmio structure for IO operations
> + *
> + * This initializes the xe mmio structure, and maps the MMIO BAR owned by
> + * the specified virtual function associated with @pf_fd.
> + */
> +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
> +{
> +	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
> +
> +	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
> +
> +	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
> +
> +	igt_assert(!mmio->intel_mmio.igt_mmio);
> +
> +	mmio->fd = pf_fd;
> +	mmio->intel_mmio.safe = false;
> +	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
> +}
> +
> +/**
> + * xe_mmio_access_init:
> + * @pf_fd: xe device file descriptor
> + * @mmio: xe mmio structure for IO operations
> + *
> + * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
> + */
> +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
> +{
> +	xe_mmio_vf_access_init(pf_fd, 0, mmio);
> +}
> +
> +/**
> + * xe_mmio_access_fini:
> + * @mmio: xe mmio structure for IO operations
> + *
> + * Clean up the mmio access helper initialized with
> + * xe_mmio_access_init()/xe_mmio_vf_access_init().
> + */
> +void xe_mmio_access_fini(struct xe_mmio *mmio)
> +{
> +	mmio->intel_mmio.pci_device_id = 0;
> +	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
> +	igt_pci_system_cleanup();
> +}
> +
> +/**
> + * xe_mmio_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + *
> + * 32-bit read of the register at @offset.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg)
> +{
> +	return ioread32(mmio->intel_mmio.igt_mmio, reg);
> +}
> +
> +/**
> + * xe_mmio_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + *
> + * 64-bit read of the register at @offset.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg)
> +{
> +	return ioread64(mmio->intel_mmio.igt_mmio, reg);
> +}
> +
> +/**
> + * xe_mmio_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset.
> + */
> +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val)
> +{
> +	return iowrite32(mmio->intel_mmio.igt_mmio, reg, val);
> +}
> +
> +/**
> + * xe_mmio_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset.
> + */
> +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val)
> +{
> +	return iowrite64(mmio->intel_mmio.igt_mmio, reg, val);
> +}
> +
> +/**
> + * xe_mmio_gt_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset in tile to which @gt belongs
> + *
> + * 32-bit read of the register at @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg)
> +{
> +	return xe_mmio_read32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +}
> +
> +/**
> + * xe_mmio_gt_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset in tile to which @gt belongs
> + *
> + * 64-bit read of the register at @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg)
> +{
> +	return xe_mmio_read64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +}
> +
> +/**
> + * xe_mmio_gt_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val)
> +{
> +	return xe_mmio_write32(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> +			       val);
> +}
> +
> +/**
> + * xe_mmio_gt_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @reg: mmio register offset
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val)
> +{
> +	return xe_mmio_write64(mmio, reg + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> +			       val);
> +}
> +
> +/**
> + * xe_mmio_ggtt_read:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + *
> + * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
> +{
> +	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
> +}
> +
> +/**
> + * xe_mmio_ggtt_write:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @pte: PTE value to write
> + *
> + * Write PTE value at GGTT @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
> +{
> +	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
> +}
> diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
> new file mode 100644
> index 000000000..ed45040bd
> --- /dev/null
> +++ b/lib/xe/xe_mmio.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */

Add here standard ifdef/define and at end of file endif:

#ifndef IGT_XE_MMIO_H
#define IGT_XE_MMIO_H

Regards,
Kamil

> +
> +#include "lib/intel_io.h"
> +#include "lib/igt_sizes.h"
> +
> +#define TILE_MMIO_SIZE		SZ_16M
> +#define GGTT_OFFSET_IN_TILE	SZ_8M
> +
> +typedef uint64_t xe_ggtt_pte_t;
> +
> +struct xe_mmio {
> +	int fd;
> +	unsigned int vf_id;
> +	struct intel_mmio_data intel_mmio;
> +};
> +
> +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
> +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
> +void xe_mmio_access_fini(struct xe_mmio *mmio);
> +
> +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t reg);
> +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t reg);
> +
> +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t reg, uint32_t val);
> +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t reg, uint64_t val);
> +
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t reg);
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t reg);
> +
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t reg, uint32_t val);
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t reg, uint64_t val);
> +
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 53a2b4386..c885e3a79 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_to_tile_id:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns tile id for given @gt.
> + */
> +int xe_gt_get_tile_id(int fd, int gt)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +
> +	igt_assert(xe_dev);
> +	igt_assert(gt < xe_number_gt(fd));
> +
> +	return xe_dev->gt_list->gt_list[gt].tile_id;
> +}
> +
>  igt_constructor
>  {
>  	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 82af2706d..b1b3a989e 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
>  bool xe_is_media_gt(int fd, int gt);
> +int xe_gt_get_tile_id(int fd, int gt);
>  
>  struct xe_device *xe_device_get(int fd);
>  void xe_device_put(int fd);
> -- 
> 2.34.1
> 
