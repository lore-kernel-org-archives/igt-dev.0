Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71897C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA0410E44C;
	Wed, 22 Jul 2026 14:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLdRrYwz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7423E10E44C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784729695; x=1816265695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4zXdjSVtGZkJUUZUzqJ3fnrq6NL+uGrufiijLyXtL7Q=;
 b=CLdRrYwzceS4VZgp5Ra4j9FNk9xlWaiyoiyp+lfa3wv3os1ZUsknfOXN
 3M/0+NiqMAqT5gUAz3KYHKD1imInq/ts588T1z7jtWv1G5A41f4iOwqOd
 yPPnpN1tn682ENc1DuF++cQjltiRW3A+Y52aKI3Yav2IeB2Q+yQ+6E/G0
 5PkNDgrMgxIA2aburBECCKva5FP5NhYH2j9ucg6Quw/JBisTGca7mmiNX
 ie/XoiBJsCB0avR7ADlhaHZ7gyDclJsqn1hsTJumU+tXsq25tt72oXnm8
 Mv6AhEmNlF5iXfgqyniDCigueyzeLQ2b2so6Ar8pPo1agNEwxb8d6uRdZ A==;
X-CSE-ConnectionGUID: 85Gzk18aSI6p4QAJnw721w==
X-CSE-MsgGUID: 344VM+E/RDqgkntJv3ZnYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95954420"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="95954420"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:14:55 -0700
X-CSE-ConnectionGUID: uLvRfBP/Rlyq6ecnkjRVTw==
X-CSE-MsgGUID: 9ns4lYCWSx22UnsTGsNZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="288097291"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:14:53 -0700
Date: Wed, 22 Jul 2026 16:14:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH i-g-t v3 05/10] tests/imagination: Add DEV_QUERY heap
 info tests
Message-ID: <20260722141450.ioqch63xu7gvg74l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-5-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-5-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:37 +0200, Robert Mazur wrote:
> From: Sarah Walker <sarah.walker@imgtec.com>
> 
> Add subtests for DRM_IOCTL_PVR_DEV_QUERY heap info queries.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_pvr.c                     |  31 +++++++++
>  lib/igt_pvr.h                     |   2 +
>  tests/imagination/meson.build     |   1 +
>  tests/imagination/pvr_heap_info.c | 130 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 164 insertions(+)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 421cbc24c..a26b4edad 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -104,3 +104,34 @@ igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
>  	return args;
>  }
>  
> +/**
> + * igt_pvr_get_heap_info:
> + * @fd: The file descriptor of the DRM device.
> + * @array_len_out: Pointer to store the number of heaps.
> + *
> + * Function to get information about the device heaps.
> + *
> + * Returns: An array of drm_pvr_heap structures. The caller is responsible
> + * for freeing the array.
> + */
> +struct drm_pvr_heap *
> +igt_pvr_get_heap_info(int fd, uint32_t *array_len_out)
> +{
> +	struct drm_pvr_heap *heaps =
> +		calloc(DRM_PVR_HEAP_COUNT, sizeof(*heaps));
> +	struct drm_pvr_dev_query_heap_info heap_info_get = {
> +		.heaps = DRM_PVR_OBJ_ARRAY(DRM_PVR_HEAP_COUNT, heaps),
> +	};
> +
> +	if (!heaps)
> +		return NULL;
> +
> +	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +				sizeof(heap_info_get), &heap_info_get, 0);
> +
> +	if (array_len_out)
> +		*array_len_out = heap_info_get.heaps.count;
> +
> +	return heaps;
> +}
> +
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index b25fb1867..ca09f39e1 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -16,5 +16,7 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
>  struct drm_pvr_ioctl_dev_query_args
>  igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
>  			void *pointer, int expect_err);
> +struct drm_pvr_heap *
> +igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
>  
>  #endif /* IGT_PVR_H */
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index c5899972b..fc24d0220 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -1,6 +1,7 @@
>  pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_gem',
>  	      'pvr_gpu_info',
> +	      'pvr_heap_info',
>  	    ]
>  
>  pvr_deps = test_deps
> diff --git a/tests/imagination/pvr_heap_info.c b/tests/imagination/pvr_heap_info.c
> new file mode 100644
> index 000000000..7d953044e
> --- /dev/null
> +++ b/tests/imagination/pvr_heap_info.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +enum pvr_page_size {
> +	PVR_PAGE_SIZE_4K = 12,
> +	PVR_PAGE_SIZE_16K = 14,
> +	PVR_PAGE_SIZE_64K = 16,
> +	PVR_PAGE_SIZE_256K = 18,
> +	PVR_PAGE_SIZE_1M = 20,
> +	PVR_PAGE_SIZE_2M = 21
> +};
> +
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture()
> +	{
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +	}
> +
> +	igt_describe("Test getting the size of an array from the kernel");
> +	igt_subtest("heap-info-get-size")
> +	{
> +		/* Check we can get the size of the array kernel side. */
> +		struct drm_pvr_dev_query_heap_info heap_info_get = {0};
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +					sizeof(heap_info_get), &heap_info_get, 0);
> +		igt_assert_neq(heap_info_get.heaps.count, 0);
> +		igt_assert_neq(heap_info_get.heaps.stride, 0);
> +	}
> +
> +	igt_describe("Test copying a single heap info from the kernel");
> +	igt_subtest("heap-info-copy-single")
> +	{
> +		struct drm_pvr_heap *heaps =
> +			calloc(DRM_PVR_HEAP_COUNT, sizeof(*heaps));
> +
> +		/* Try copying a single heap. */
> +		struct drm_pvr_dev_query_heap_info heap_info_get = {
> +			.heaps = DRM_PVR_OBJ_ARRAY(1, heaps),
> +		};
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +					sizeof(heap_info_get), &heap_info_get, 0);
> +
> +		/* Kernel should stop copying after a single heap. */
> +		igt_assert_eq(heap_info_get.heaps.count, 1);
> +		igt_assert_eq(heaps[1].size, 0);
> +
> +		/* Kernel should respect the user side array stride. */
> +		igt_assert_eq(heap_info_get.heaps.stride, sizeof(*heaps));
> +	}
> +
> +	igt_describe("Test copying all heaps info from the kernel");
> +	igt_subtest("heap-info-copy-all")
> +	{
> +		struct drm_pvr_dev_query_heap_info heap_info_get = {0};
> +		struct drm_pvr_heap *heaps =
> +			calloc(DRM_PVR_HEAP_COUNT, sizeof(*heaps));
> +		uint32_t kernel_array_size = 0;
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +					sizeof(heap_info_get), &heap_info_get, 0);
> +
> +		kernel_array_size = heap_info_get.heaps.count;
> +
> +		heap_info_get.heaps =
> +			(struct drm_pvr_obj_array)DRM_PVR_OBJ_ARRAY(DRM_PVR_HEAP_COUNT,
> +								    heaps);
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +					sizeof(heap_info_get), &heap_info_get, 0);
> +
> +		igt_assert(heap_info_get.heaps.count == DRM_PVR_HEAP_COUNT ||
> +			   heap_info_get.heaps.count == kernel_array_size);
> +
> +		/* Kernel should respect the user side array stride. */
> +		igt_assert_eq(heap_info_get.heaps.stride, sizeof(*heaps));
> +	}
> +
> +	igt_describe("Test validity of all heaps");
> +	igt_subtest("heap-info-heaps-valid")
> +	{
> +		uint32_t heaps_count = 0;
> +		struct drm_pvr_heap *heaps =
> +			igt_pvr_get_heap_info(fd, &heaps_count);
> +
> +		igt_assert(heaps);
> +
> +		for (int heap_id = 0; heap_id < heaps_count; heap_id++) {
> +			const uint64_t page_mask =
> +				(1ull << heaps[heap_id].page_size_log2) - 1;
> +
> +			/* This heap isn't present for all devices. */
> +			if (heap_id == (int)DRM_PVR_HEAP_RGNHDR)
> +				continue;
> +
> +			igt_assert(heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_4K ||
> +				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_16K ||
> +				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_64K ||
> +				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_256K ||
> +				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_1M ||
> +				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_2M);
> +
> +			igt_assert_neq_u64(heaps[heap_id].size, 0);
> +			igt_assert(!(heaps[heap_id].size & page_mask));
> +			igt_assert(!(heaps[heap_id].base & page_mask));
> +
> +			igt_assert(heaps[heap_id].flags == 0);
> +		}
> +
> +		free(heaps);
> +	}
> +
> +	igt_fixture()
> +	{
> +		drm_close_driver(fd);
> +	}
> +}
> 
> -- 
> 2.43.0
> 
