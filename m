Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F63C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 14:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A710E589;
	Tue, 28 Jul 2026 14:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUI96Hq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D6B10E589
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785247556; x=1816783556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rqyhTzAXtY9UQtG7tmIyvILljglFeFwMbQ3Ir5mNf0Y=;
 b=CUI96Hq/uG0nv4MDvTIRwjEyYVDtP6YhOBpVTYdvF0Vuc0Jkt9NDtdyX
 fNyF5hJTaUfwAWIuFLMcenZZolnmPw1W9o0eGrJXAnWkHcC+oi4jcRMiY
 Eg+gVOYLAuyNXbyDgyvWiJVPQbMXVyzXwvRPoQxAehTlrDZemqBvbCdzG
 xfgAD8d/OwgxM8tvp1UADQjxVtEZa1le8rOHWyzGY/7PAKp1Mfu9BPzfJ
 5CB9roZ5uSyx/40TbKnXsi9SJ9eG1n4rSyl4bxUe6R8Oo22/u2UjGOfqW
 heKQUrXV2fGrUzJzo7b3siJH35U83L5rfConoRpNh3qERsjcZTcOzzsg+ w==;
X-CSE-ConnectionGUID: 2duO/0lkSbCV6DjOMn7SLw==
X-CSE-MsgGUID: mI8iwV5xQSidac/5W4yZBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85681359"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85681359"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:05:55 -0700
X-CSE-ConnectionGUID: ccv9FyzfTCK4ZxysgOuIvg==
X-CSE-MsgGUID: itHbLoQAQTSotLPe4f/Eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="264017438"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:05:53 -0700
Date: Tue, 28 Jul 2026 16:05:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v5 03/10] tests/imagination: Add DEV_QUERY tests
Message-ID: <20260728140550.xzbqhlcuvtnqoakk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
 <20260728-test-imagination-add-support-v5-3-33049f0d1937@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-test-imagination-add-support-v5-3-33049f0d1937@imgtec.com>
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
On 2026-07-28 at 09:18:58 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add subtests exercising DRM_IOCTL_PVR_DEV_QUERY with invalid type,
> successful query of all types, and undersized buffer error paths.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

For this and other patches in this series
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_pvr.c                     | 31 ++++++++++++
>  lib/igt_pvr.h                     |  4 ++
>  tests/imagination/meson.build     |  3 +-
>  tests/imagination/pvr_dev_query.c | 99 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index 048ccab31..2e6c4ade3 100644
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
> +		.pointer = to_user_pointer(pointer),
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
