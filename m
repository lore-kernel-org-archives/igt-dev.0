Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C507DC98302
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 16:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0C510E6E9;
	Tue, 22 Sep 2026 16:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjNodVEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D38C10E6E9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790096267; x=1821632267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=whTJGdcwW9B9u1FULSXErrVfMix9lvsu+ch6NgS/cdM=;
 b=QjNodVEEN+j0uoYirPh0B0sN3D60LZau5u4ws42YyT8d1IO2nUt69oTa
 fr0Q2IaSJdtE8WPQqql9ET9S5HXz3sqfRuSDWSws7zfKNsbOXFklzuCsM
 ChvDXYe+vIjTj9C/TGCRtSoXAdVb239ye89yZTbGzCPsTNa4bvQ4Dced6
 B+DmvKeCyKglaz7UdHpGBjR36Vs7TCRDMseSjYdvaYqOV83E1hKEGt0Ea
 SV8g+n9brRuy78TFvCIM1yxSpzxYiz58rOo0OOX24EQ5x0HaTzBHL/Biy
 lbUQZd7kpIfuV/kB77kmYeGvof3GCKDQvi1TuaM45W161xcut7kJF3B/p w==;
X-CSE-ConnectionGUID: QCLtdq97R6SgfX48shZTLA==
X-CSE-MsgGUID: fKZooYbBQGake5XhT8Tysw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1218478"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1218478"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:57:46 -0700
X-CSE-ConnectionGUID: zS93w8JUQ5yzCZyLifgXrg==
X-CSE-MsgGUID: ObGcZpSoRiiW0RKvlsu61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4290684"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:57:45 -0700
Date: Tue, 22 Sep 2026 18:57:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib/imagination: add device configuration
 support
Message-ID: <20260922165742.sj4lv6lsk6ctfmx3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20260922-b4-imagination-submit-test-v2-0-974e93be5de7@imgtec.com>
 <20260922-b4-imagination-submit-test-v2-1-974e93be5de7@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-b4-imagination-submit-test-v2-1-974e93be5de7@imgtec.com>
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

Hi Robert,
On 2026-09-22 at 11:43:25 +0200, Robert Mazur wrote:
> Add a device information library containing configuration data for
> supported PowerVR cores.
> 
> The device configuration definitions are largely imported from Mesa,
> with only minor adjustments to fit IGT coding style and infrastructure.
> 
> This infrastructure will be used to parameterize tests according to
> the target GPU configuration and capabilities.
> 
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Will someone from imgtec do a review? Or at least give tested-by
to last patch.

Regards,
Kamil

> ---
>  lib/igt_pvr.c                           |  20 ++
>  lib/igt_pvr.h                           |   3 +
>  lib/imagination/device_info/axe-1-16m.h | 106 +++++++++
>  lib/imagination/device_info/bxe-2-32.h  | 122 +++++++++++
>  lib/imagination/device_info/bxe-4-32.h  | 122 +++++++++++
>  lib/imagination/device_info/bxm-4-64.h  | 237 ++++++++++++++++++++
>  lib/imagination/device_info/bxs-4-64.h  | 124 +++++++++++
>  lib/imagination/device_info/g6110.h     | 103 +++++++++
>  lib/imagination/device_info/ge7800.h    | 102 +++++++++
>  lib/imagination/device_info/ge8300.h    | 230 +++++++++++++++++++
>  lib/imagination/device_info/gx6250.h    | 231 +++++++++++++++++++
>  lib/imagination/device_info/gx6650.h    | 120 ++++++++++
>  lib/imagination/pvr_device_info.c       | 104 +++++++++
>  lib/imagination/pvr_device_info.h       | 378 ++++++++++++++++++++++++++++++++
>  lib/meson.build                         |   1 +
>  15 files changed, 2003 insertions(+)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index f739d61b7..f05f23057 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -333,3 +333,23 @@ void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle)
>  
>  	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST, &destroy_free_list_args);
>  }
> +
> +/**
> + * igt_pvr_get_device_info:
> + * @fd: The file descriptor of the DRM device.
> + *
> + * Function to get the device information from kernel.
> + */
> +struct pvr_device_info *igt_pvr_get_device_info(int fd)
> +{
> +	struct drm_pvr_dev_query_gpu_info dev_info_get = {0};
> +	static struct pvr_device_info info;
> +
> +	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_GPU_INFO_GET,
> +				sizeof(dev_info_get), &dev_info_get, 0);
> +
> +	igt_assert(pvr_device_info_init(&info, dev_info_get.gpu_id) == 0);
> +
> +	return &info;
> +}
> +
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index 744d7c12f..214a429ab 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -8,6 +8,7 @@
>  #include <stdint.h>
>  #include <sys/types.h>
>  
> +#include "imagination/pvr_device_info.h"
>  #include "pvr_drm.h"
>  
>  uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
> @@ -37,4 +38,6 @@ uint32_t igt_pvr_ioctl_create_free_list(int fd, uint32_t vm_ctx_handle,
>  					uint64_t gpu_addr);
>  void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle);
>  
> +struct pvr_device_info *igt_pvr_get_device_info(int fd);
> +
>  #endif /* IGT_PVR_H */
> diff --git a/lib/imagination/device_info/axe-1-16m.h b/lib/imagination/device_info/axe-1-16m.h
> new file mode 100644
> index 000000000..ef2294d40
> --- /dev/null
> +++ b/lib/imagination/device_info/axe-1-16m.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_AXE_1_16M_H
> +#define IGT_IMAGINATION_AXE_1_16M_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_33_V_11_3                     \
> +	.device_id = 0x33011003, .series_name = "A-Series", \
> +	.public_name = "AXE-1-16M", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_33_V_11_3 = {
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_roguexe = true,
> +	.has_screen_size8K = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v2 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_border_colour_enhanced = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_pixel_partition_mask = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_vdm_degenerate_culling = true,
> +
> +	.common_store_size_in_dwords = 512U * 4U * 4U,
> +	.isp_max_tiles_in_flight = 1U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 4U,
> +	.max_usc_tasks = 24U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 1U,
> +	.unified_store_depth = 64U,
> +	.usc_itr_parallel_instances = 4U,
> +	.usc_min_output_registers_per_pix = 1U,
> +	.usc_slots = 14U,
> +	.uvs_banks = 2U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 32U,
> +
> +	.has_s8xe = true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_33_15_11_3 = {
> +	.has_ern35421 = true,
> +	.has_ern38748 = true,
> +	.has_ern42307 = true,
> +	.has_ern45493 = true,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_33_15_11_3 = {
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_33_15_11_3 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_33_V_11_3,
> +	   .b = 33,
> +	   .v = 15,
> +	   .n = 11,
> +	   .c = 3,
> +	},
> +	.features = pvr_device_features_33_V_11_3,
> +	.enhancements = pvr_device_enhancements_33_15_11_3,
> +	.quirks = pvr_device_quirks_33_15_11_3,
> +};
> +
> +#endif /* AXE_1_16M_H */
> diff --git a/lib/imagination/device_info/bxe-2-32.h b/lib/imagination/device_info/bxe-2-32.h
> new file mode 100644
> index 000000000..3e88dc6dc
> --- /dev/null
> +++ b/lib/imagination/device_info/bxe-2-32.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_BXE_2_32_H
> +#define IGT_IMAGINATION_BXE_2_32_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_36_V_52_182 \
> +	.device_id = 0x36052182, .series_name = "B-Series", \
> +	.public_name = "BXE-2-32", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_36_V_52_182 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	.has_fbcdc_algorithm = true,
> +	.has_gpu_multicore_support = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_paired_tiles = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_pds_ddmadt = true,
> +	.has_roguexe = true,
> +	.has_screen_size8K = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v2 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_border_colour_enhanced = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_alu_roundingmode_rne = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_itr_parallel_instances = true,
> +
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_pixel_partition_mask = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xpu_max_slaves = true,
> +
> +	.common_store_size_in_dwords = 832U * 4U * 4U,
> +	.fbcdc_algorithm = 50U,
> +	.isp_max_tiles_in_flight = 2U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 8U,
> +	.max_usc_tasks = 72U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 2U,
> +	.unified_store_depth = 128U,
> +	.usc_itr_parallel_instances = 8U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 32U,
> +	.uvs_banks = 4U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 64U,
> +	.xpu_max_slaves = 3U,
> +
> +	.has_s8xe = true,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_36_29_52_182 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	   .has_ern45493 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_36_29_52_182 = {
> +	.has_brn70165 = true,
> +	.has_brn72168 = true,
> +	.has_brn72463 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_36_29_52_182 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_36_V_52_182,
> +	   .b = 36,
> +	   .v = 29,
> +	   .n = 52,
> +	   .c = 182,
> +	},
> +	.features = pvr_device_features_36_V_52_182,
> +	.enhancements = pvr_device_enhancements_36_29_52_182,
> +	.quirks = pvr_device_quirks_36_29_52_182,
> +};
> +
> +#endif /* BXE_2_32_H */
> diff --git a/lib/imagination/device_info/bxe-4-32.h b/lib/imagination/device_info/bxe-4-32.h
> new file mode 100644
> index 000000000..2ebfbab20
> --- /dev/null
> +++ b/lib/imagination/device_info/bxe-4-32.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_BXE_4_32_H
> +#define IGT_IMAGINATION_BXE_4_32_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_36_V_54_182 \
> +	.device_id = 0x36054182, .series_name = "B-Series", \
> +	.public_name = "BXE-4-32", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_36_V_54_182 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	.has_fbcdc_algorithm = true,
> +	.has_gpu_multicore_support = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_paired_tiles = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_pds_ddmadt = true,
> +	.has_roguexe = true,
> +	.has_screen_size8K = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v2 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_border_colour_enhanced = true,
> +	.has_tpu_dm_global_registers = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_alu_roundingmode_rne = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_pixel_partition_mask = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xpu_max_slaves = true,
> +
> +	.common_store_size_in_dwords = 1024U * 4U * 4U,
> +	.fbcdc_algorithm = 50U,
> +	.isp_max_tiles_in_flight = 4U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 10U,
> +	.max_usc_tasks = 104U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 208U,
> +	.usc_itr_parallel_instances = 16U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 64U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 160U,
> +	.uvs_vtx_entries = 144U,
> +	.vdm_cam_size = 64U,
> +	.xpu_max_slaves = 3U,
> +
> +	.has_s8xe = true,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_36_50_54_182 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	   .has_ern45493 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_36_50_54_182 = {
> +	.has_brn70165 = true,
> +	.has_brn72168 = true,
> +	.has_brn72463 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_36_50_54_182 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_36_V_54_182,
> +	   .b = 36,
> +	   .v = 50,
> +	   .n = 54,
> +	   .c = 182,
> +	},
> +	.features = pvr_device_features_36_V_54_182,
> +	.enhancements = pvr_device_enhancements_36_50_54_182,
> +	.quirks = pvr_device_quirks_36_50_54_182,
> +};
> +
> +#endif /* BXE_4_32_H */
> diff --git a/lib/imagination/device_info/bxm-4-64.h b/lib/imagination/device_info/bxm-4-64.h
> new file mode 100644
> index 000000000..9546d65bc
> --- /dev/null
> +++ b/lib/imagination/device_info/bxm-4-64.h
> @@ -0,0 +1,237 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_BXM_4_64_H
> +#define IGT_IMAGINATION_BXM_4_64_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_36_V_104_182 \
> +	.device_id = 0x36104182, .series_name = "B-Series", \
> +	.public_name = "BXM-4-64", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_36_V_104_182 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	.has_fbcdc_algorithm = true,
> +	.has_gpu_multicore_support = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_paired_tiles = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_pds_ddmadt = true,
> +	.has_roguexe = true,
> +	.has_screen_size8K = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v2 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_border_colour_enhanced = true,
> +	.has_tpu_dm_global_registers = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_alu_roundingmode_rne = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_pixel_partition_mask = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xpu_max_slaves = true,
> +
> +	.common_store_size_in_dwords = 1216U * 4U * 4U,
> +	.fbcdc_algorithm = 50U,
> +	.isp_max_tiles_in_flight = 6U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 12U,
> +	.max_usc_tasks = 156U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 256U,
> +	.usc_itr_parallel_instances = 16U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 64U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 160U,
> +	.uvs_vtx_entries = 144U,
> +	.vdm_cam_size = 64U,
> +	.xpu_max_slaves = 3U,
> +
> +	/* Derived features. */
> +	.has_s8xe = true,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_36_52_104_182 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	   .has_ern45493 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_36_52_104_182 = {
> +	.has_brn44079 = true,
> +	.has_brn70165 = true,
> +	.has_brn72168 = true,
> +	.has_brn72463 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_36_52_104_182 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_36_V_104_182,
> +	   .b = 36,
> +	   .v = 52,
> +	   .n = 104,
> +	   .c = 182,
> +	},
> +	.features = pvr_device_features_36_V_104_182,
> +	.enhancements = pvr_device_enhancements_36_52_104_182,
> +	.quirks = pvr_device_quirks_36_52_104_182,
> +};
> +
> +#define PVR_DEVICE_IDENT_36_V_104_183 \
> +	.device_id = 0x36104183, .series_name = "B-Series", .public_name = "BXM-4-64"
> +
> +static const struct pvr_device_features pvr_device_features_36_V_104_183 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	.has_fbcdc_algorithm = true,
> +	.has_gpu_multicore_support = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_paired_tiles = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_pds_ddmadt = true,
> +	.has_roguexe = true,
> +	.has_screen_size8K = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v2 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_border_colour_enhanced = true,
> +	.has_tpu_dm_global_registers = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_alu_roundingmode_rne = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_pixel_partition_mask = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xpu_max_slaves = true,
> +
> +	.common_store_size_in_dwords = 1216U * 4U * 4U,
> +	.fbcdc_algorithm = 50U,
> +	.isp_max_tiles_in_flight = 6U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 12U,
> +	.max_usc_tasks = 156U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 256U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 64U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 160U,
> +	.uvs_vtx_entries = 144U,
> +	.vdm_cam_size = 64U,
> +	.xpu_max_slaves = 3U,
> +
> +	/* Derived features. */
> +	.has_s8xe = true,
> +	.has_usc_itr_parallel_instances = true,
> +
> +	.usc_itr_parallel_instances = 16U,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_36_56_104_183 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	   .has_ern45493 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_36_56_104_183 = {
> +	.has_brn44079 = true,
> +	.has_brn70165 = true,
> +	.has_brn72168 = true,
> +	.has_brn72463 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_36_56_104_183 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_36_V_104_183,
> +	   .b = 36,
> +	   .v = 56,
> +	   .n = 104,
> +	   .c = 183,
> +	},
> +	.features = pvr_device_features_36_V_104_183,
> +	.enhancements = pvr_device_enhancements_36_56_104_183,
> +	.quirks = pvr_device_quirks_36_56_104_183,
> +};
> +
> +#endif /* BXM_4_64_H */
> diff --git a/lib/imagination/device_info/bxs-4-64.h b/lib/imagination/device_info/bxs-4-64.h
> new file mode 100644
> index 000000000..1c579985b
> --- /dev/null
> +++ b/lib/imagination/device_info/bxs-4-64.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_BXS_4_64_H
> +#define IGT_IMAGINATION_BXS_4_64_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_36_V_104_796 \
> +	.device_id = 0x36104796, .series_name = "B-Series", \
> +	.public_name = "BXS-4-64", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_36_V_104_796 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	.has_fbcdc_algorithm = true,
> +	.has_gpu_multicore_support = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_paired_tiles = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_pds_ddmadt = true,
> +	.has_roguexe = true,
> +	.has_screen_size8K = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v2 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_border_colour_enhanced = true,
> +	.has_tpu_dm_global_registers = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_alu_roundingmode_rne = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_pixel_partition_mask = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_vdm_degenerate_culling = true,
> +	.has_xpu_max_slaves = true,
> +
> +	.common_store_size_in_dwords = 1344U * 4U * 4U,
> +	.fbcdc_algorithm = 50U,
> +	.isp_max_tiles_in_flight = 6U,
> +	.isp_samples_per_pixel = 4U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 16U,
> +	.max_usc_tasks = 156U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 256U,
> +	.usc_itr_parallel_instances = 16U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 64U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 160U,
> +	.uvs_vtx_entries = 144U,
> +	.vdm_cam_size = 64U,
> +	.xpu_max_slaves = 3U,
> +
> +	.has_s8xe = true,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_36_53_104_796 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	   .has_ern45493 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_36_53_104_796 = {
> +	.has_brn44079 = true,
> +	.has_brn70165 = true,
> +	.has_brn72168 = true,
> +	.has_brn72463 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_36_53_104_796 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_36_V_104_796,
> +	   .b = 36,
> +	   .v = 53,
> +	   .n = 104,
> +	   .c = 796,
> +	},
> +	.features = pvr_device_features_36_V_104_796,
> +	.enhancements = pvr_device_enhancements_36_53_104_796,
> +	.quirks = pvr_device_quirks_36_53_104_796,
> +};
> +
> +#endif /* BXS_4_64_H */
> diff --git a/lib/imagination/device_info/g6110.h b/lib/imagination/device_info/g6110.h
> new file mode 100644
> index 000000000..ad4c5f0d3
> --- /dev/null
> +++ b/lib/imagination/device_info/g6110.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_G6110_H
> +#define IGT_IMAGINATION_G6110_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_5_V_1_46 \
> +	.device_id = 0x6110, .series_name = "Rogue", \
> +	.public_name = "GX6110", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_5_V_1_46 = {
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_fbcdc_algorithm = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_roguexe = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +
> +	.common_store_size_in_dwords = 1344U * 4U * 4U,
> +	.fbcdc_algorithm = 2U,
> +	.isp_max_tiles_in_flight = 1U,
> +	.isp_samples_per_pixel = 2U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 12U,
> +	.max_usc_tasks = 96U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 32U,
> +	.tile_size_y = 32U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 208U,
> +	.usc_itr_parallel_instances = 16U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 56U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 160U,
> +	.uvs_vtx_entries = 144U,
> +	.vdm_cam_size = 64U,
> +
> +	.has_requires_fb_cdc_zls_setup = true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_5_9_1_46 = {
> +	.has_ern35421 = true,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_5_9_1_46 = {
> +	.has_brn44079 = true,
> +	.has_brn47727 = true,
> +	.has_brn48492 = true,
> +	.has_brn48545 = true,
> +	.has_brn49032 = true,
> +	.has_brn49927 = true,
> +	.has_brn51025 = true,
> +	.has_brn51210 = true,
> +	.has_brn52942 = true,
> +	.has_brn58839 = true,
> +	.has_brn62269 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_5_9_1_46 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_5_V_1_46,
> +	   .b = 5,
> +	   .v = 9,
> +	   .n = 1,
> +	   .c = 46,
> +	},
> +	.features = pvr_device_features_5_V_1_46,
> +	.enhancements = pvr_device_enhancements_5_9_1_46,
> +	.quirks = pvr_device_quirks_5_9_1_46,
> +};
> +
> +#endif /* G6110_H */
> diff --git a/lib/imagination/device_info/ge7800.h b/lib/imagination/device_info/ge7800.h
> new file mode 100644
> index 000000000..ee1326ce0
> --- /dev/null
> +++ b/lib/imagination/device_info/ge7800.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_GE7800_H
> +#define IGT_IMAGINATION_GE7800_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_15_V_1_64 \
> +	.device_id = 0x15001064, .series_name = "Rogue", \
> +	.public_name = "GE7800", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_15_V_1_64 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_fbcdc_algorithm = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_roguexe = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +
> +	.common_store_size_in_dwords = 1344U * 4U * 4U,
> +	.fbcdc_algorithm = 2U,
> +	.isp_max_tiles_in_flight = 2U,
> +	.isp_samples_per_pixel = 2U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 12U,
> +	.max_usc_tasks = 96U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 32U,
> +	.tile_size_y = 32U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 208U,
> +	.usc_itr_parallel_instances = 16U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 56U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 128U,
> +
> +	.has_requires_fb_cdc_zls_setup = true,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_15_5_1_64 = {
> +	.has_ern35421 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_15_5_1_64 = {
> +	.has_brn44079 = true,
> +	.has_brn48492 = true,
> +	.has_brn49032 = true,
> +	.has_brn49927 = true,
> +	.has_brn52942 = true,
> +	.has_brn58839 = true,
> +	.has_brn62269 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_15_5_1_64 = {
> +	.ident = {
> +	PVR_DEVICE_IDENT_15_V_1_64,
> +	.b = 15,
> +	.v = 5,
> +	.n = 1,
> +	.c = 64,
> +	},
> +	.features = pvr_device_features_15_V_1_64,
> +	.enhancements = pvr_device_enhancements_15_5_1_64,
> +	.quirks = pvr_device_quirks_15_5_1_64,
> +};
> +
> +#endif /* GE7800_H */
> diff --git a/lib/imagination/device_info/ge8300.h b/lib/imagination/device_info/ge8300.h
> new file mode 100644
> index 000000000..844810668
> --- /dev/null
> +++ b/lib/imagination/device_info/ge8300.h
> @@ -0,0 +1,230 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_GE8300_H
> +#define IGT_IMAGINATION_GE8300_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_22_V_54_30 \
> +	.device_id = 0x22054030, .series_name = "Rogue", \
> +	.public_name = "GE8300", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_22_V_54_30 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_roguexe = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v1 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +
> +	.common_store_size_in_dwords = 1024U * 4U * 4U,
> +	.isp_max_tiles_in_flight = 4U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 10U,
> +	.max_usc_tasks = 104U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 1U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 208U,
> +	.usc_itr_parallel_instances = 16U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 64U,
> +	.uvs_banks = 4U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 64U,
> +
> +	.has_s8xe = true,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_22_67_54_30 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_22_67_54_30 = {
> +	.has_brn49927 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_22_67_54_30 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_22_V_54_30,
> +	   .b = 22,
> +	   .v = 67,
> +	   .n = 54,
> +	   .c = 30,
> +	},
> +	.features = pvr_device_features_22_V_54_30,
> +	.enhancements = pvr_device_enhancements_22_67_54_30,
> +	.quirks = pvr_device_quirks_22_67_54_30,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_22_68_54_30 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_22_68_54_30 = {
> +	.has_brn49927 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_22_68_54_30 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_22_V_54_30,
> +	   .b = 22,
> +	   .v = 68,
> +	   .n = 54,
> +	   .c = 30,
> +	},
> +	.features = pvr_device_features_22_V_54_30,
> +	.enhancements = pvr_device_enhancements_22_68_54_30,
> +	.quirks = pvr_device_quirks_22_68_54_30,
> +};
> +
> +#define PVR_DEVICE_IDENT_22_V_54_38 \
> +	.device_id = 0x22054038, .series_name = "Rogue", .public_name = "GE8300"
> +
> +static const struct pvr_device_features pvr_device_features_22_V_54_38 = {
> +	.has_astc = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_overlap = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_ipf_creq_pf = true,
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe2_in_xe = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_roguexe = true,
> +	.has_simple_internal_parameter_format = true,
> +	.has_simple_internal_parameter_format_v1 = true,
> +	.has_simple_parameter_format_version = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_tile_size_16x16 = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itrsmp_enhanced = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +
> +	.common_store_size_in_dwords = 1024U * 4U * 4U,
> +	.isp_max_tiles_in_flight = 4U,
> +	.isp_samples_per_pixel = 1U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 4U,
> +	.max_partitions = 10U,
> +	.max_usc_tasks = 104U,
> +	.num_clusters = 1U,
> +	.num_raster_pipes = 1U,
> +	.simple_parameter_format_version = 1U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 16U,
> +	.tile_size_y = 16U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 208U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 64U,
> +	.uvs_banks = 4U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 64U,
> +
> +	.has_s8xe = true,
> +	.has_usc_itr_parallel_instances = true,
> +
> +	.usc_itr_parallel_instances = 16U,
> +};
> +
> +static const struct pvr_device_enhancements
> +	pvr_device_enhancements_22_102_54_38 = {
> +	   .has_ern35421 = true,
> +	   .has_ern38748 = true,
> +	   .has_ern42307 = true,
> +	};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_22_102_54_38 = {
> +	.has_brn49927 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_22_102_54_38 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_22_V_54_38,
> +	   .b = 22,
> +	   .v = 102,
> +	   .n = 54,
> +	   .c = 38,
> +	},
> +	.features = pvr_device_features_22_V_54_38,
> +	.enhancements = pvr_device_enhancements_22_102_54_38,
> +	.quirks = pvr_device_quirks_22_102_54_38,
> +};
> +
> +#endif /* GE8300_H */
> diff --git a/lib/imagination/device_info/gx6250.h b/lib/imagination/device_info/gx6250.h
> new file mode 100644
> index 000000000..955fd4d7f
> --- /dev/null
> +++ b/lib/imagination/device_info/gx6250.h
> @@ -0,0 +1,231 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_GX6250_H
> +#define IGT_IMAGINATION_GX6250_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_4_V_2_51 \
> +	.device_id = 0x6250, .series_name = "Rogue", \
> +	.public_name = "GX6250", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_4_V_2_51 = {
> +	.has_astc = true,
> +	.has_cluster_grouping = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_morton_capable = true,
> +	.has_compute_overlap = true,
> +	.has_eight_output_registers = true,
> +	.has_fbcdc_algorithm = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_slc_mcu_cache_controls = true,
> +	.has_tf_bicubic_filter = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_array_textures = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xt_top_infrastructure = true,
> +	.has_zls_subtile = true,
> +
> +	.common_store_size_in_dwords = 1280U * 4U * 4U,
> +	.fbcdc_algorithm = 2,
> +	.isp_max_tiles_in_flight = 4U,
> +	.isp_samples_per_pixel = 2U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 8U,
> +	.max_partitions = 8U,
> +	.max_usc_tasks = 56U,
> +	.num_clusters = 2U,
> +	.num_raster_pipes = 1U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 32U,
> +	.tile_size_y = 32U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 256U,
> +	.usc_itr_parallel_instances = 8U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 32U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 256U,
> +
> +	.has_requires_fb_cdc_zls_setup = true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_4_40_2_51 = {
> +	.has_ern35421 = true,
> +	.has_ern38020 = true,
> +	.has_ern38748 = true,
> +	.has_ern42064 = true,
> +	.has_ern42307 = true,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_4_40_2_51 = {
> +	.has_brn44079 = true,
> +	.has_brn47727 = true,
> +	.has_brn48492 = true,
> +	.has_brn48545 = true,
> +	.has_brn49032 = true,
> +	.has_brn49927 = true,
> +	.has_brn51025 = true,
> +	.has_brn51210 = true,
> +	.has_brn51764 = true,
> +	.has_brn52354 = true,
> +	.has_brn52942 = true,
> +	.has_brn58839 = true,
> +	.has_brn62269 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_4_40_2_51 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_4_V_2_51,
> +	   .b = 4,
> +	   .v = 40,
> +	   .n = 2,
> +	   .c = 51,
> +	},
> +	.features = pvr_device_features_4_V_2_51,
> +	.enhancements = pvr_device_enhancements_4_40_2_51,
> +	.quirks = pvr_device_quirks_4_40_2_51,
> +};
> +
> +#define PVR_DEVICE_IDENT_4_V_2_58 \
> +	.device_id = 0x6250, .series_name = "Rogue", .public_name = "GX6250"
> +
> +static const struct pvr_device_features pvr_device_features_4_V_2_58 = {
> +	.has_astc = true,
> +	.has_cluster_grouping = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_morton_capable = true,
> +	.has_compute_overlap = true,
> +	.has_eight_output_registers = true,
> +	.has_fbcdc_algorithm = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_slc_mcu_cache_controls = true,
> +	.has_tf_bicubic_filter = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_array_textures = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xt_top_infrastructure = true,
> +	.has_zls_subtile = true,
> +
> +	.common_store_size_in_dwords = 1536U * 4U * 4U,
> +	.fbcdc_algorithm = 2,
> +	.isp_max_tiles_in_flight = 4U,
> +	.isp_samples_per_pixel = 2U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 8U,
> +	.max_partitions = 8U,
> +	.max_usc_tasks = 56U,
> +	.num_clusters = 2U,
> +	.num_raster_pipes = 1U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 32U,
> +	.tile_size_y = 32U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 256U,
> +	.usc_itr_parallel_instances = 8U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 32U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 256U,
> +
> +	.has_requires_fb_cdc_zls_setup = true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_4_45_2_58 = {
> +	.has_ern35421 = true,
> +	.has_ern38020 = true,
> +	.has_ern38748 = true,
> +	.has_ern42064 = true,
> +	.has_ern42307 = true,
> +	.has_ern45493 = true,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_4_45_2_58 = {
> +	.has_brn44079 = true,
> +	.has_brn49927 = true,
> +	.has_brn51025 = true,
> +	.has_brn51210 = true,
> +	.has_brn51764 = true,
> +	.has_brn52354 = true,
> +	.has_brn52942 = true,
> +	.has_brn58839 = true,
> +	.has_brn62269 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_4_45_2_58 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_4_V_2_58,
> +	   .b = 4,
> +	   .v = 45,
> +	   .n = 2,
> +	   .c = 58,
> +	},
> +	.features = pvr_device_features_4_V_2_58,
> +	.enhancements = pvr_device_enhancements_4_45_2_58,
> +	.quirks = pvr_device_quirks_4_45_2_58,
> +};
> +
> +#endif /* GX6250_H */
> diff --git a/lib/imagination/device_info/gx6650.h b/lib/imagination/device_info/gx6650.h
> new file mode 100644
> index 000000000..f1c897ac5
> --- /dev/null
> +++ b/lib/imagination/device_info/gx6650.h
> @@ -0,0 +1,120 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef IGT_IMAGINATION_GX6650_H
> +#define IGT_IMAGINATION_GX6650_H
> +
> +#include <stdbool.h>
> +
> +#include "../pvr_device_info.h"
> +
> +#define PVR_DEVICE_IDENT_4_V_6_62 \
> +	.device_id = 0x6650, .series_name = "Rogue", \
> +	.public_name = "GX6650", .arch = PVR_DEVICE_ARCH_ROGUE
> +
> +static const struct pvr_device_features pvr_device_features_4_V_6_62 = {
> +	.has_astc = true,
> +	.has_cluster_grouping = true,
> +	.has_common_store_size_in_dwords = true,
> +	.has_compute = true,
> +	.has_compute_morton_capable = true,
> +	.has_compute_overlap = true,
> +	.has_eight_output_registers = true,
> +	.has_fbcdc_algorithm = true,
> +	/* .has_gs_rta_support = true, */
> +	.has_isp_max_tiles_in_flight = true,
> +	.has_isp_samples_per_pixel = true,
> +	.has_max_instances_per_pds_task = true,
> +	.has_max_multisample = true,
> +	.has_max_partitions = true,
> +	.has_max_usc_tasks = true,
> +	.has_num_clusters = true,
> +	.has_num_raster_pipes = true,
> +	.has_pbe_filterable_f16 = true,
> +	.has_pbe_yuv = true,
> +	.has_slc_cache_line_size_bits = true,
> +	.has_slc_mcu_cache_controls = true,
> +	.has_tf_bicubic_filter = true,
> +	.has_tile_size_x = true,
> +	.has_tile_size_y = true,
> +	.has_tpu_array_textures = true,
> +	.has_tpu_extended_integer_lookup = true,
> +	.has_tpu_image_state_v2 = true,
> +	.has_tpu_parallel_instances = true,
> +	.has_unified_store_depth = true,
> +	.has_usc_f16sop_u8 = true,
> +	.has_usc_itrsmp = true,
> +	.has_usc_itr_parallel_instances = true,
> +	.has_usc_min_output_registers_per_pix = true,
> +	.has_usc_slots = true,
> +	.has_uvs_banks = true,
> +	.has_uvs_pba_entries = true,
> +	.has_uvs_vtx_entries = true,
> +	.has_vdm_cam_size = true,
> +	.has_xt_top_infrastructure = true,
> +	.has_zls_subtile = true,
> +
> +	.common_store_size_in_dwords = 1280U * 4U * 4U,
> +	.fbcdc_algorithm = 2U,
> +	.isp_max_tiles_in_flight = 8U,
> +	.isp_samples_per_pixel = 2U,
> +	.max_instances_per_pds_task = 32U,
> +	.max_multisample = 8U,
> +	.max_partitions = 8U,
> +	.max_usc_tasks = 56U,
> +	.num_clusters = 6U,
> +	.num_raster_pipes = 2U,
> +	.slc_cache_line_size_bits = 512U,
> +	.tile_size_x = 32U,
> +	.tile_size_y = 32U,
> +	.tpu_parallel_instances = 4U,
> +	.unified_store_depth = 256U,
> +	.usc_itr_parallel_instances = 8U,
> +	.usc_min_output_registers_per_pix = 2U,
> +	.usc_slots = 32U,
> +	.uvs_banks = 8U,
> +	.uvs_pba_entries = 320U,
> +	.uvs_vtx_entries = 288U,
> +	.vdm_cam_size = 256U,
> +
> +	.has_requires_fb_cdc_zls_setup = true,
> +};
> +
> +static const struct pvr_device_enhancements pvr_device_enhancements_4_46_6_62 = {
> +	.has_ern35421 = true,
> +	.has_ern38020 = true,
> +	.has_ern38748 = true,
> +	.has_ern42064 = true,
> +	.has_ern42307 = true,
> +	.has_ern45493 = true,
> +};
> +
> +static const struct pvr_device_quirks pvr_device_quirks_4_46_6_62 = {
> +	.has_brn44079 = true,
> +	.has_brn49927 = true,
> +	.has_brn51025 = true,
> +	.has_brn51210 = true,
> +	.has_brn51764 = true,
> +	.has_brn52354 = true,
> +	.has_brn52942 = true,
> +	.has_brn58839 = true,
> +	.has_brn62269 = true,
> +	.has_brn66011 = true,
> +	.has_brn70165 = true,
> +	.has_brn74056 = true,
> +};
> +
> +static const struct pvr_device_info pvr_device_info_4_46_6_62 = {
> +	.ident = {
> +	   PVR_DEVICE_IDENT_4_V_6_62,
> +	   .b = 4,
> +	   .v = 46,
> +	   .n = 6,
> +	   .c = 62,
> +	},
> +	.features = pvr_device_features_4_V_6_62,
> +	.enhancements = pvr_device_enhancements_4_46_6_62,
> +	.quirks = pvr_device_quirks_4_46_6_62,
> +};
> +
> +#endif /* GX6650_H */
> diff --git a/lib/imagination/pvr_device_info.c b/lib/imagination/pvr_device_info.c
> new file mode 100644
> index 000000000..3575d2527
> --- /dev/null
> +++ b/lib/imagination/pvr_device_info.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +/* TODO: This file is currently hand-maintained. However, the intention is to
> + * auto-generate it in the future based on the hwdefs.
> + */
> +
> +#include <assert.h>
> +#include <errno.h>
> +#include <string.h>
> +
> +#include "drmtest.h"
> +#include "pvr_device_info.h"
> +
> +#include "device_info/g6110.h"
> +#include "device_info/gx6250.h"
> +#include "device_info/gx6650.h"
> +#include "device_info/ge7800.h"
> +#include "device_info/ge8300.h"
> +#include "device_info/axe-1-16m.h"
> +#include "device_info/bxe-2-32.h"
> +#include "device_info/bxe-4-32.h"
> +#include "device_info/bxm-4-64.h"
> +#include "device_info/bxs-4-64.h"
> +
> +static const struct pvr_device_info *device_infos[] = {
> +	/* clang-format off */
> +	&pvr_device_info_4_40_2_51,
> +	&pvr_device_info_4_45_2_58,
> +	&pvr_device_info_4_46_6_62,
> +	&pvr_device_info_5_9_1_46,
> +	&pvr_device_info_15_5_1_64,
> +	&pvr_device_info_22_67_54_30,
> +	&pvr_device_info_22_68_54_30,
> +	&pvr_device_info_22_102_54_38,
> +	&pvr_device_info_33_15_11_3,
> +	&pvr_device_info_36_29_52_182,
> +	&pvr_device_info_36_50_54_182,
> +	&pvr_device_info_36_52_104_182,
> +	&pvr_device_info_36_53_104_796,
> +	&pvr_device_info_36_56_104_183,
> +	/* clang-format on */
> +};
> +
> +/**
> + * Initialize PowerVR device information.
> + *
> + * \param info Device info structure to initialize.
> + * \param bvnc Packed BVNC.
> + * \return
> + *  * 0 on success, or
> + *  * -%ENODEV if the device is not supported.
> + */
> +int pvr_device_info_init(struct pvr_device_info *info, uint64_t bvnc)
> +{
> +#define CASE_PACKED_BVNC_DEVICE_INFO(_b, _v, _n, _c)			\
> +	case PVR_BVNC_PACK(_b, _v, _n, _c):				\
> +		*info = pvr_device_info_##_b##_##_v##_##_n##_##_c;	\
> +		return 0
> +
> +	switch (bvnc) {
> +		CASE_PACKED_BVNC_DEVICE_INFO(4, 40, 2, 51);
> +		CASE_PACKED_BVNC_DEVICE_INFO(4, 45, 2, 58);
> +		CASE_PACKED_BVNC_DEVICE_INFO(4, 46, 6, 62);
> +		CASE_PACKED_BVNC_DEVICE_INFO(5, 9, 1, 46);
> +		CASE_PACKED_BVNC_DEVICE_INFO(15, 5, 1, 64);
> +		CASE_PACKED_BVNC_DEVICE_INFO(22, 67, 54, 30);
> +		CASE_PACKED_BVNC_DEVICE_INFO(22, 68, 54, 30);
> +		CASE_PACKED_BVNC_DEVICE_INFO(22, 102, 54, 38);
> +		CASE_PACKED_BVNC_DEVICE_INFO(33, 15, 11, 3);
> +		CASE_PACKED_BVNC_DEVICE_INFO(36, 29, 52, 182);
> +		CASE_PACKED_BVNC_DEVICE_INFO(36, 50, 54, 182);
> +		CASE_PACKED_BVNC_DEVICE_INFO(36, 52, 104, 182);
> +		CASE_PACKED_BVNC_DEVICE_INFO(36, 53, 104, 796);
> +		CASE_PACKED_BVNC_DEVICE_INFO(36, 56, 104, 183);
> +	}
> +
> +#undef CASE_PACKED_BVNC_DEVICE_INFO
> +
> +	assert(!"Unsupported Device");
> +
> +	return -ENODEV;
> +}
> +
> +/**
> + * Initialize PowerVR device information from a public name.
> + *
> + * \param info Device info structure to initialize.
> + * \param public_name Device public name.
> + * \return True if successful.
> + */
> +bool pvr_device_info_init_public_name(struct pvr_device_info *info,
> +				      const char *public_name)
> +{
> +	for (unsigned int d = 0; d < ARRAY_SIZE(device_infos); ++d) {
> +		if (strcasecmp(public_name, device_infos[d]->ident.public_name))
> +			continue;
> +
> +		memcpy(info, device_infos[d], sizeof(*info));
> +		return true;
> +	}
> +
> +	return false;
> +}
> diff --git a/lib/imagination/pvr_device_info.h b/lib/imagination/pvr_device_info.h
> new file mode 100644
> index 000000000..e3c2e0170
> --- /dev/null
> +++ b/lib/imagination/pvr_device_info.h
> @@ -0,0 +1,378 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#ifndef PVR_DEVICE_INFO_H
> +#define PVR_DEVICE_INFO_H
> +
> +/* TODO: This file is currently hand-maintained. However, the intention is to
> + * auto-generate it in the future based on the hwdefs.
> + */
> +
> +#include <assert.h>
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#define PVR_BVNC_PACK_SHIFT_B 48
> +#define PVR_BVNC_PACK_SHIFT_V 32
> +#define PVR_BVNC_PACK_SHIFT_N 16
> +#define PVR_BVNC_PACK_SHIFT_C 0
> +
> +#define PVR_BVNC_PACK_MASK_B UINT64_C(0xFFFF000000000000)
> +#define PVR_BVNC_PACK_MASK_V UINT64_C(0x0000FFFF00000000)
> +#define PVR_BVNC_PACK_MASK_N UINT64_C(0x00000000FFFF0000)
> +#define PVR_BVNC_PACK_MASK_C UINT64_C(0x000000000000FFFF)
> +
> +enum pvr_device_arch {
> +	PVR_DEVICE_ARCH_ROGUE,
> +};
> +
> +/**
> + * Packs B, V, N and C values into a 64-bit unsigned integer.
> + *
> + * The packed layout is as follows:
> + *
> + * \verbatim
> + *	 +--------+--------+--------+-------+
> + *	 | 63..48 | 47..32 | 31..16 | 15..0 |
> + *	 +========+========+========+=======+
> + *	 |   B    |   V    |   N    |   C   |
> + *	 +--------+--------+--------+-------+
> + * \endverbatim
> + *
> + * #pvr_get_packed_bvnc() should be used instead of this macro when a
> + * #pvr_device_information is available in order to ensure proper type checking.
> + *
> + * \param b Branch ID.
> + * \param v Version ID.
> + * \param n Number of scalable units.
> + * \param c Config ID.
> + * \return Packed BVNC.
> + *
> + * \sa #pvr_get_packed_bvnc(), #PVR_BVNC_UNPACK_B(), #PVR_BVNC_UNPACK_V(),
> + * #PVR_BVNC_UNPACK_N() and #PVR_BVNC_UNPACK_C()
> + */
> +#define PVR_BVNC_PACK(b, v, n, c)						\
> +	((((uint64_t)(b) << PVR_BVNC_PACK_SHIFT_B) & PVR_BVNC_PACK_MASK_B) |	\
> +	 (((uint64_t)(v) << PVR_BVNC_PACK_SHIFT_V) & PVR_BVNC_PACK_MASK_V) |	\
> +	 (((uint64_t)(n) << PVR_BVNC_PACK_SHIFT_N) & PVR_BVNC_PACK_MASK_N) |	\
> +	 (((uint64_t)(c) << PVR_BVNC_PACK_SHIFT_C) & PVR_BVNC_PACK_MASK_C))
> +
> +/**
> + * Unpacks B value (branch ID) from packed BVNC.
> + *
> + * \param bvnc Packed BVNC.
> + * \return Branch ID.
> + *
> + * \sa #PVR_BVNC_UNPACK_V(), #PVR_BVNC_UNPACK_N(), #PVR_BVNC_UNPACK_C(),
> + * #pvr_get_packed_bvnc() and #PVR_BVNC_PACK()
> + */
> +#define PVR_BVNC_UNPACK_B(bvnc) \
> +	((uint16_t)(((bvnc) & PVR_BVNC_PACK_MASK_B) >> PVR_BVNC_PACK_SHIFT_B))
> +
> +/**
> + * Unpacks V value (version ID) from packed BVNC.
> + *
> + * \param bvnc Packed BVNC.
> + * \return Version ID.
> + *
> + * \sa #PVR_BVNC_UNPACK_B(), #PVR_BVNC_UNPACK_N(), #PVR_BVNC_UNPACK_C(),
> + * #pvr_get_packed_bvnc() and #PVR_BVNC_PACK()
> + */
> +#define PVR_BVNC_UNPACK_V(bvnc) \
> +	((uint16_t)(((bvnc) & PVR_BVNC_PACK_MASK_V) >> PVR_BVNC_PACK_SHIFT_V))
> +
> +/**
> + * Unpacks N value (number of scalable units) from packed BVNC.
> + *
> + * \param bvnc Packed BVNC.
> + * \return Number of scalable units.
> + *
> + * \sa #PVR_BVNC_UNPACK_B(), #PVR_BVNC_UNPACK_V(), #PVR_BVNC_UNPACK_C(),
> + * #pvr_get_packed_bvnc() and #PVR_BVNC_PACK()
> + */
> +#define PVR_BVNC_UNPACK_N(bvnc) \
> +	((uint16_t)(((bvnc) & PVR_BVNC_PACK_MASK_N) >> PVR_BVNC_PACK_SHIFT_N))
> +
> +/**
> + * Unpacks C value (config ID) from packed BVNC.
> + *
> + * \param bvnc Packed BVNC.
> + * \return Config ID.
> + *
> + * \sa #PVR_BVNC_UNPACK_B(), #PVR_BVNC_UNPACK_V(), #PVR_BVNC_UNPACK_N(),
> + * #pvr_get_packed_bvnc() and #PVR_BVNC_PACK()
> + */
> +#define PVR_BVNC_UNPACK_C(bvnc) \
> +	((uint16_t)(((bvnc) & PVR_BVNC_PACK_MASK_C) >> PVR_BVNC_PACK_SHIFT_C))
> +
> +/**
> + * Tests whether a physical device has a given feature.
> + *
> + * Feature names are derived from those found in #pvr_device_features by
> + * dropping the 'has_' prefix, which is applied by this macro.
> + *
> + * \param dev_info #pvr_device_info object associated with the target physical device.
> + *
> + * \param feature  Device feature name.
> + *
> + * \return
> + *  * true if the named feature is present in the hardware.
> + *  * false if the named feature is not present in the hardware.
> + *
> + * \sa #PVR_FEATURE_VALUE() and #PVR_GET_FEATURE_VALUE()
> + */
> +#define PVR_HAS_FEATURE(dev_info, feature) ((dev_info)->features.has_##feature)
> +
> +/**
> + * Gets a physical device feature value if feature is supported.
> + *
> + * Feature names are derived from those found in #pvr_device_features by
> + * dropping the 'has_' prefix.
> + *
> + * This macro should be used in preference to #PVR_GET_FEATURE_VALUE() as it has
> + * proper error handling.
> + *
> + * \param dev_info  #pvr_device_info object associated with the target physical device.
> + *
> + * \param feature   Feature name.
> + * \param value_out Feature value.
> + *
> + * \return
> + *  * 0 on success, or
> + *  * -%EINVAL if the named feature is not present in the hardware.
> + *
> + * \sa #PVR_HAS_FEATURE() and #PVR_GET_FEATURE_VALUE()
> + */
> +#define PVR_FEATURE_VALUE(dev_info, feature, value_out)			\
> +	({								\
> +		const struct pvr_device_info *__dev_info = dev_info;	\
> +		int __ret = -EINVAL;					\
> +		if (__dev_info->features.has_##feature) {		\
> +			*(value_out) = __dev_info->features.feature;	\
> +			__ret = 0;					\
> +		}							\
> +		__ret;							\
> +	})
> +
> +/**
> + * Gets a physical device feature value if supported, but otherwise returns a
> + * default value.
> + *
> + * Feature names are derived from those found in #pvr_device_features by
> + * dropping the 'has_' prefix.
> + *
> + * #PVR_FEATURE_VALUE() should be used in preference to this macro when errors
> + * can be returned by the caller. This macro is intended for cases where errors
> + * can't be returned.
> + *
> + * \param dev_info #pvr_device_info object associated with the target
> + *                 physical device.
> + * \param feature Feature name.
> + * \param default_value Default feature value.
> + *
> + * \return Feature value.
> + *
> + * \sa #PVR_HAS_FEATURE() and #PVR_FEATURE_VALUE()
> + */
> +#define PVR_GET_FEATURE_VALUE(dev_info, feature, default_value)				\
> +	({										\
> +		const struct pvr_device_info *__dev_info = dev_info;			\
> +		__typeof__(default_value) __ret = default_value;			\
> +		if (__dev_info->features.has_##feature) {				\
> +			__ret = __dev_info->features.feature;				\
> +		} else {								\
> +			assert(0);							\
> +		}									\
> +		__ret;									\
> +	})
> +
> +/**
> + * Tests whether a physical device has a given enhancement.
> + *
> + * Enhancement numbers are derived from those found in #pvr_device_enhancements
> + * by dropping the 'has_ern' prefix, which is applied by this macro.
> + *
> + * \param dev_info #pvr_device_info object associated with the target physical
> + *                 device.
> + * \param number   Enhancement number.
> + *
> + * \return
> + *  * true if the enhancement is present in the hardware.
> + *  * false if the enhancement is not present in the hardware.
> + */
> +#define PVR_HAS_ENHANCEMENT(dev_info, number) \
> +	((dev_info)->enhancements.has_ern##number)
> +
> +/**
> + * Tests whether a physical device has a given quirk.
> + *
> + * Quirk numbers are derived from those found in #pvr_device_quirks by
> + * dropping the 'has_brn' prefix, which is applied by this macro.
> + *
> + * \param dev_info #pvr_device_info object associated with the target physical device.
> + *
> + * \param number   Quirk number.
> + *
> + * \return
> + *  * true if the quirk is present in the hardware.
> + *  * false if the quirk is not present in the hardware.
> + */
> +#define PVR_HAS_QUIRK(dev_info, number) ((dev_info)->quirks.has_brn##number)
> +
> +struct pvr_device_ident {
> +	enum pvr_device_arch arch;
> +	uint16_t b, v, n, c;
> +	uint32_t device_id;
> +	const char *series_name;
> +	const char *public_name;
> +};
> +
> +struct pvr_device_features {
> +	bool has_astc : 1;
> +	bool has_cluster_grouping : 1;
> +	bool has_common_store_size_in_dwords : 1;
> +	bool has_compute : 1;
> +	bool has_compute_morton_capable : 1;
> +	bool has_compute_overlap : 1;
> +	bool has_eight_output_registers : 1;
> +	bool has_fb_cdc_v4 : 1;
> +	bool has_fbcdc_algorithm : 1;
> +	bool has_gpu_multicore_support : 1;
> +	bool has_gs_rta_support : 1;
> +	bool has_ipf_creq_pf : 1;
> +	bool has_isp_max_tiles_in_flight : 1;
> +	bool has_isp_samples_per_pixel : 1;
> +	bool has_max_instances_per_pds_task : 1;
> +	bool has_max_multisample : 1;
> +	bool has_max_partitions : 1;
> +	bool has_max_usc_tasks : 1;
> +	bool has_num_clusters : 1;
> +	bool has_num_raster_pipes : 1;
> +	bool has_paired_tiles : 1;
> +	bool has_pbe2_in_xe : 1;
> +	bool has_pbe_filterable_f16 : 1;
> +	bool has_pbe_stride_align_1pixel : 1;
> +	bool has_pbe_yuv : 1;
> +	bool has_pds_ddmadt : 1;
> +	bool has_roguexe : 1;
> +	bool has_screen_size8K : 1;
> +	bool has_simple_internal_parameter_format : 1;
> +	bool has_simple_internal_parameter_format_v1 : 1;
> +	bool has_simple_internal_parameter_format_v2 : 1;
> +	bool has_simple_parameter_format_version : 1;
> +	bool has_slc_cache_line_size_bits : 1;
> +	bool has_slc_mcu_cache_controls : 1;
> +	bool has_tf_bicubic_filter : 1;
> +	bool has_tile_per_usc : 1;
> +	bool has_tile_size_16x16 : 1;
> +	bool has_tile_size_x : 1;
> +	bool has_tile_size_y : 1;
> +	bool has_tpu_array_textures : 1;
> +	bool has_tpu_border_colour_enhanced : 1;
> +	bool has_tpu_dm_global_registers : 1;
> +	bool has_tpu_extended_integer_lookup : 1;
> +	bool has_tpu_image_state_v2 : 1;
> +	bool has_tpu_parallel_instances : 1;
> +	bool has_unified_store_depth : 1;
> +	bool has_usc_alu_roundingmode_rne : 1;
> +	bool has_usc_f16sop_u8 : 1;
> +	bool has_usc_itrsmp : 1;
> +	bool has_usc_itrsmp_enhanced : 1;
> +	bool has_usc_itr_parallel_instances : 1;
> +	bool has_usc_min_output_registers_per_pix : 1;
> +	bool has_usc_pixel_partition_mask : 1;
> +	bool has_usc_slots : 1;
> +	bool has_uvs_banks : 1;
> +	bool has_uvs_pba_entries : 1;
> +	bool has_uvs_vtx_entries : 1;
> +	bool has_vdm_cam_size : 1;
> +	bool has_vdm_degenerate_culling : 1;
> +	bool has_xpu_max_slaves : 1;
> +	bool has_xt_top_infrastructure : 1;
> +	bool has_zls_subtile : 1;
> +
> +	uint32_t common_store_size_in_dwords;
> +	uint32_t fbcdc_algorithm;
> +	uint32_t isp_max_tiles_in_flight;
> +	uint32_t isp_samples_per_pixel;
> +	uint32_t max_instances_per_pds_task;
> +	uint32_t max_multisample;
> +	uint32_t max_partitions;
> +	uint32_t max_usc_tasks;
> +	uint32_t num_clusters;
> +	uint32_t num_raster_pipes;
> +	uint32_t simple_parameter_format_version;
> +	uint32_t slc_cache_line_size_bits;
> +	uint32_t tile_size_x;
> +	uint32_t tile_size_y;
> +	uint32_t tpu_parallel_instances;
> +	uint32_t unified_store_depth;
> +	uint32_t usc_itr_parallel_instances;
> +	uint32_t usc_min_output_registers_per_pix;
> +	uint32_t usc_slots;
> +	uint32_t uvs_banks;
> +	uint32_t uvs_pba_entries;
> +	uint32_t uvs_vtx_entries;
> +	uint32_t vdm_cam_size;
> +	uint32_t xpu_max_slaves;
> +
> +	/* Derived features. */
> +	bool has_requires_fb_cdc_zls_setup : 1;
> +	bool has_s8xe : 1;
> +};
> +
> +struct pvr_device_enhancements {
> +	bool has_ern35421 : 1;
> +	bool has_ern38020 : 1;
> +	bool has_ern38748 : 1;
> +	bool has_ern42064 : 1;
> +	bool has_ern42307 : 1;
> +	bool has_ern45493 : 1;
> +};
> +
> +struct pvr_device_quirks {
> +	bool has_brn44079 : 1;
> +	bool has_brn47727 : 1;
> +	bool has_brn48492 : 1;
> +	bool has_brn48545 : 1;
> +	bool has_brn49032 : 1;
> +	bool has_brn49927 : 1;
> +	bool has_brn51025 : 1;
> +	bool has_brn51210 : 1;
> +	bool has_brn51764 : 1;
> +	bool has_brn52354 : 1;
> +	bool has_brn52942 : 1;
> +	bool has_brn58839 : 1;
> +	bool has_brn62269 : 1;
> +	bool has_brn66011 : 1;
> +	bool has_brn70165 : 1;
> +	bool has_brn72168 : 1;
> +	bool has_brn72463 : 1;
> +	bool has_brn74056 : 1;
> +};
> +
> +struct pvr_device_info {
> +	struct pvr_device_ident ident;
> +	struct pvr_device_features features;
> +	struct pvr_device_enhancements enhancements;
> +	struct pvr_device_quirks quirks;
> +};
> +
> +struct pvr_device_runtime_info {
> +	uint64_t min_free_list_size;
> +	uint64_t max_free_list_size;
> +	uint64_t reserved_shared_size;
> +	uint64_t total_reserved_partition_size;
> +	uint64_t num_phantoms;
> +	uint64_t max_coeffs;
> +	uint64_t cdm_max_local_mem_size_regs;
> +	uint32_t core_count;
> +};
> +
> +int pvr_device_info_init(struct pvr_device_info *info, uint64_t bvnc);
> +
> +bool pvr_device_info_init_public_name(struct pvr_device_info *info,
> +				      const char *public_name);
> +
> +#endif /* PVR_DEVICE_INFO_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index d1a770b6d..2609033cb 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -129,6 +129,7 @@ lib_sources = [
>  	'igt_msm.c',
>  	'igt_dsc.c',
>  	'igt_hook.c',
> +	'imagination/pvr_device_info.c',
>  	'xe/xe_device.c',
>  	'xe/xe_ggtt.c',
>  	'xe/xe_gt.c',
> 
> -- 
> 2.43.0
> 
