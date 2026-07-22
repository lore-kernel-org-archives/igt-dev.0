Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BE7C44539
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0E010EE1D;
	Wed, 22 Jul 2026 14:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1qOOt+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6D010EE1D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731397; x=1816267397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iD9MkSee/226Fju6sjqD4I9vRe49REOlh4W20Frws98=;
 b=N1qOOt+y7r8iRz7E0wkmhRbHztgB/LZrVnTqaN1GRkyJwQZB4XZ/YABE
 iG569xp5GIxNSwBCet0KdYw/6CkZ/DcYRqGmARLFExUqu5XR62t9Ngouv
 ZF02Nzj7o8Q/3pdbyMt52f+OH5oQ2lB7hZIK2hOX+iBhsH1+rtl3QoE5I
 kO7kAC//82+Vd5U0WO4ds++EISwgzx2hnl4ZD5/7Tw4z1ptr5EOxwrlM3
 8efKoX1SwqIPeN12/xrPJ5sJ5BLyXtaxGLvgR6H8LWuBDmZpB03fYSFr+
 +4AnP2bwQLJB6NmTAQybZy3GGBYWb2cnuBbbODGvuoVwdUV0xuQk4Uny+ Q==;
X-CSE-ConnectionGUID: u3Dz8azPRkuECUojkqpRjw==
X-CSE-MsgGUID: JCnfcYf8R/Kjf6dfiNsQfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96883215"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96883215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:43:16 -0700
X-CSE-ConnectionGUID: 6FOz4t1iRr6zdM4VzoSEuw==
X-CSE-MsgGUID: TMqe5LvvT5ShNjONTq0Gtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="251805088"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:43:14 -0700
Date: Wed, 22 Jul 2026 16:43:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v3 09/10] tests/imagination: Add DEV_QUERY quirks
 and enhancements tests
Message-ID: <20260722144311.5tduhurcwa3e5iit@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-9-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-9-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:41 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add subtests for DEV_QUERY quirks and enhancements: array copy

s/:/ for/

> and invalid padding error paths.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

With above fixed this is
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/imagination/meson.build               |   1 +
>  tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index 69ef0a8c6..dc08a5d8b 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -4,6 +4,7 @@ pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_gpu_info',
>  	      'pvr_heap_info',
>  	      'pvr_hwrt',
> +	      'pvr_quirks_enhancements',
>  	      'pvr_vm_context',
>  	    ]
>  
> diff --git a/tests/imagination/pvr_quirks_enhancements.c b/tests/imagination/pvr_quirks_enhancements.c
> new file mode 100644
> index 000000000..35e5ff190
> --- /dev/null
> +++ b/tests/imagination/pvr_quirks_enhancements.c
> @@ -0,0 +1,112 @@
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
> +int igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture()
> +	{
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +	}
> +
> +	igt_describe("Test copying enhancements from the kernel");
> +	igt_subtest("enhancements-array-copy")
> +	{
> +		struct drm_pvr_dev_query_enhancements enhancements_get = {0};
> +		uint32_t *enhancements;
> +
> +		/* Enhancements. */
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
> +					sizeof(enhancements_get),
> +					&enhancements_get, 0);
> +		/*
> +		 * Supplementary check - alloc one extra space as a watermark
> +		 * to check the copy does not overflow.  We only need to check
> +		 * this once for the whole UAPI, as a macro is used to do this.
> +		 */
> +		enhancements = calloc(enhancements_get.count + 1,
> +				      sizeof(*enhancements));
> +		igt_assert(enhancements);
> +
> +		/* Set watermark. */
> +		enhancements[enhancements_get.count] = 0xABCDEFAB;
> +
> +		enhancements_get.enhancements = (uint64_t)enhancements;
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
> +					sizeof(enhancements_get),
> +					&enhancements_get, 0);
> +
> +		for (int i = 0; i < enhancements_get.count; i++)
> +			igt_assert_neq(enhancements[i], 0);
> +
> +		/* Check the watermark is intact. */
> +		igt_assert_eq(enhancements[enhancements_get.count], 0xABCDEFAB);
> +	}
> +
> +	igt_describe("Test copying quirks from the kernel");
> +	igt_subtest("quirks-array-copy")
> +	{
> +		struct drm_pvr_dev_query_quirks quirks_get = {0};
> +		uint32_t *quirks;
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,
> +					sizeof(quirks_get), &quirks_get, 0);
> +		quirks = calloc(quirks_get.count, sizeof(*quirks));
> +		igt_assert(quirks);
> +
> +		quirks_get.quirks = (uint64_t)quirks;
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,
> +					sizeof(quirks_get),
> +					&quirks_get, 0);
> +
> +		for (int i = 0; i < quirks_get.count; i++)
> +			igt_assert_neq(quirks[i], 0);
> +
> +		igt_assert_lte(quirks_get.musthave_count, quirks_get.count);
> +	}
> +
> +	igt_describe("Test enhancements query with invalid padding");
> +	igt_subtest("enhancements-bad-padding")
> +	{
> +		struct drm_pvr_dev_query_enhancements enhancements_get = {
> +			._padding_a = 1,
> +		};
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
> +					sizeof(enhancements_get),
> +					&enhancements_get, EINVAL);
> +
> +		enhancements_get._padding_a = 0;
> +		enhancements_get._padding_c = 1;
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
> +					sizeof(enhancements_get),
> +					&enhancements_get, EINVAL);
> +	}
> +
> +	igt_describe("Test quirks query with invalid padding");
> +	igt_subtest("quirks-bad-padding")
> +	{
> +		struct drm_pvr_dev_query_quirks quirks_get = {
> +			._padding_c = 1,
> +		};
> +
> +		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,
> +					sizeof(quirks_get), &quirks_get, EINVAL);
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
