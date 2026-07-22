Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E7C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BB410EDFA;
	Wed, 22 Jul 2026 14:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHbNbqc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ED210E1D0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784729529; x=1816265529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6WUhqZj9y2/3nPsZ4FusgwDWdQTVvXCw7jsMu0jaql8=;
 b=oHbNbqc1NzOJ9ox1z8pJDOycBa1luVEIqlmujHIEbb2znxUSOUuh8lyc
 057chooijCYVlvp7qlpBISr69mltzWZZuyOXPilVfpXHLQa6x5e2ZDSPW
 fjsUYRaaE4Zq8SPSrKaSHgzOtAAlEzc0H99zj4ZSMZV1Wpv7/7lhr2HM+
 qQtA955IdnrlXv5Ze4/HNhZhJhEzjtdHCPxMGpLoP3np8F58DE5TNGP/Y
 Xl2xU7srHl399QKNM3U9ClUp3/Gznt6c95IzEjIQmyNYm75pEgiaOvrWc
 vO6dtnaNtuGBsn/NHlDy6aP0ZTdx9mzLSWklA2kEPgfWajGJqRwNzkWHa g==;
X-CSE-ConnectionGUID: UczMz5oTQQW0CaL+SfKgfw==
X-CSE-MsgGUID: YCkWqB5eQZSi0QZfY/4yZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96739988"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96739988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:12:09 -0700
X-CSE-ConnectionGUID: PGYHiPx9TvaTXJWB4sSEGw==
X-CSE-MsgGUID: E0CdSoYcTBGnwc2vNw8OXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="251798513"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:12:07 -0700
Date: Wed, 22 Jul 2026 16:12:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v3 03/10] tests/imagination: Add DEV_QUERY tests
Message-ID: <20260722141205.6xjpgshpg4lb2ufh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-3-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-3-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:35 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add subtests exercising DRM_IOCTL_PVR_DEV_QUERY: invalid type,

s/:/ with/

> successful query of all types, and undersized buffer error paths.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
>  lib/igt_pvr.c                     | 31 ++++++++++++
>  lib/igt_pvr.h                     |  4 ++
>  tests/imagination/meson.build     |  3 +-
>  tests/imagination/pvr_dev_query.c | 99 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 048ccab31..421cbc24c 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -73,3 +73,34 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle)
>  
>  	return (off_t)arg.offset;
>  }
> +
> +/**
> + * igt_pvr_ioctl_dev_query:
> + * @fd: The file descriptor of the DRM device.
> + * @type: The type of the device query.
> + * @size: The size of the query structure.
> + * @pointer: Pointer to the query structure.
> + * @expect_err: Expected error code, or 0 if no error is expected.
> + *
> + * Function to perform a device query.
> + *
> + * Returns: The filled-in query arguments structure.
> + */
> +struct drm_pvr_ioctl_dev_query_args
> +igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
> +			void *pointer, int expect_err)
> +{
> +	struct drm_pvr_ioctl_dev_query_args args = {
> +		.type = type,
> +		.size = size,
> +		.pointer = (uint64_t)pointer,

This will not compile on armhf docker image on GitLab:

../lib/igt_pvr.c: In function 'igt_pvr_ioctl_dev_query':
../lib/igt_pvr.c:113:14: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  113 |   .pointer = (uint64_t)pointer,
      |              ^

You should use to_user_pointer(pointer) here.

Regards,
Kamil

> +	};
> +
> +	if (expect_err)
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DEV_QUERY, &args, expect_err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PVR_DEV_QUERY, &args);
> +
> +	return args;
> +}
> +
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index e8b2d9026..b25fb1867 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -13,4 +13,8 @@
>  uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
>  off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
>  
> +struct drm_pvr_ioctl_dev_query_args
> +igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
> +			void *pointer, int expect_err);
> +
>  #endif /* IGT_PVR_H */
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index 65b90c39f..62930da2b 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -1,4 +1,5 @@
> -pvr_progs = [ 'pvr_gem',
> +pvr_progs = [ 'pvr_dev_query',
> +	      'pvr_gem',
>  	    ]
>  
>  pvr_deps = test_deps
> diff --git a/tests/imagination/pvr_dev_query.c b/tests/imagination/pvr_dev_query.c
> new file mode 100644
> index 000000000..29c7eb550
> --- /dev/null
> +++ b/tests/imagination/pvr_dev_query.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <errno.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +int igt_main()
> +{
> +	const enum drm_pvr_dev_query types[] = {
> +		DRM_PVR_DEV_QUERY_GPU_INFO_GET,
> +		DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
> +		DRM_PVR_DEV_QUERY_QUIRKS_GET,
> +		DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
> +		DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +		DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
> +	};
> +
> +	const uint64_t sizes[] = {
> +		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] =
> +			sizeof(struct drm_pvr_dev_query_gpu_info),
> +		[DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET] =
> +			sizeof(struct drm_pvr_dev_query_runtime_info),
> +		[DRM_PVR_DEV_QUERY_QUIRKS_GET] =
> +			sizeof(struct drm_pvr_dev_query_quirks),
> +		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] =
> +			sizeof(struct drm_pvr_dev_query_enhancements),
> +		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] =
> +			sizeof(struct drm_pvr_dev_query_heap_info),
> +		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] =
> +			sizeof(struct drm_pvr_dev_query_static_data_areas),
> +	};
> +
> +	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
> +	struct drm_pvr_dev_query_runtime_info runtime_info = {0};
> +	struct drm_pvr_dev_query_quirks quirks = {0};
> +	struct drm_pvr_dev_query_enhancements enhancements = {0};
> +	struct drm_pvr_dev_query_heap_info heap_info = {0};
> +	struct drm_pvr_dev_query_static_data_areas static_data_areas = {0};
> +
> +	void *const containers[] = {
> +		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] = &gpu_info,
> +		[DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET] = &runtime_info,
> +		[DRM_PVR_DEV_QUERY_QUIRKS_GET] = &quirks,
> +		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] = &enhancements,
> +		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] = &heap_info,
> +		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] = &static_data_areas,
> +	};
> +
> +	int fd;
> +
> +	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(sizes));
> +	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(containers));
> +
> +	igt_fixture()
> +	{
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +
> +		for (int i = 0; i < ARRAY_SIZE(types); i++)
> +			memset(containers[i], 0, sizes[i]);
> +	}
> +
> +	igt_describe("Test invalid dev query");
> +	igt_subtest("dev-query-invalid") {
> +		igt_pvr_ioctl_dev_query(fd, (enum drm_pvr_dev_query)-1, 0, NULL,
> +					EINVAL);
> +	}
> +
> +	igt_describe("Test valid dev query");
> +	igt_subtest("dev-query-success-all") {
> +		for (int i = 0; i < ARRAY_SIZE(types); i++) {
> +			struct drm_pvr_ioctl_dev_query_args args =
> +				igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);
> +
> +			igt_assert(args.size);
> +			igt_assert(args.size <= sizes[i]);
> +
> +			igt_pvr_ioctl_dev_query(fd, types[i], args.size, containers[i], 0);
> +		}
> +	}
> +
> +	igt_describe("Test dev query with too small size");
> +	igt_subtest("dev-query-fail-too-small") {
> +		for (int i = 0; i < ARRAY_SIZE(types); i++) {
> +			igt_pvr_ioctl_dev_query(fd, types[i], 0, containers[i], EINVAL);
> +			igt_pvr_ioctl_dev_query(fd, types[i], 1, containers[i],	EINVAL);
> +		}
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
