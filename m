Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F22C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 14:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F66A10E942;
	Tue, 28 Jul 2026 14:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXBC+V38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136EE10E949
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250028; x=1816786028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zHczmc9ytFs/N1Mtg28NoNTkVItk+KapPvDGdfRM0xI=;
 b=BXBC+V38jqG/N6yOkdg398+oVBTlQxe6gkKQ0CVNBuUC5gdc0LajOq6r
 vsuHxEZOawBhW78OiL7pNxbmkPW+nfVyZk7i17N2oyHgoPS7MMS6CWEaP
 baev52YLER10/mLAc8f/Cb3o1v8QqhjPjXBms+xmBaz40uYCIi4vCiu4F
 khDLeec7DcT60C/XjU6VxgoAFr2p2Y32hLBFKLf8Wulla+eLFUdQwKbFL
 Xow3tm/zHp3jIUKrL1GVC62u1jLonAOhHjWibj6imHQ3wOmk93ijVjnt1
 kKs5AgGZarT8h8Iwd5MtusyWk5P1odzIILCamua+nvqrLZY+Ech59Xao3 w==;
X-CSE-ConnectionGUID: sM6J6xkQRSewM3Rv40j5pg==
X-CSE-MsgGUID: YPZ73klnQXGVNeKtI0O5PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97209743"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="97209743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:47:07 -0700
X-CSE-ConnectionGUID: kmCRrFldSSWgyVRFeUeAwQ==
X-CSE-MsgGUID: OZccNIuPQk2apcheIUvh3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="255797341"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:47:06 -0700
Date: Tue, 28 Jul 2026 16:47:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v5 09/10] tests/imagination: Add DEV_QUERY quirks
 and enhancements tests
Message-ID: <20260728144703.oax6tuchkxrny27g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
 <20260728-test-imagination-add-support-v5-9-33049f0d1937@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-test-imagination-add-support-v5-9-33049f0d1937@imgtec.com>
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
On 2026-07-28 at 09:19:04 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add subtests for DEV_QUERY quirks and enhancements for array copy
> and invalid padding error paths.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I applid 1...8 but this one still has problem with compilation
on 32-bit armhf:

s.p/pvr_quirks_enhancements.c.o -MF tests/imagination/pvr_quirks_enhancements.p/pvr_quirks_enhancements.c.o.d -o tests/imagination/pvr_quirks_enhancements.p/pvr_quirks_enhancements.c.o -c ../tests/imagination/pvr_quirks_enhancements.c
../tests/imagination/pvr_quirks_enhancements.c: In function '__igt_unique____real_main13':
../tests/imagination/pvr_quirks_enhancements.c:44:35: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
44 |   enhancements_get.enhancements = (uint64_t)enhancements;
|                                   ^
../tests/imagination/pvr_quirks_enhancements.c:67:23: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
67 |   quirks_get.quirks = (uint64_t)quirks;
|                       ^
cc1: some warnings being treated as errors

Please fix and resend last two patches as a separate series.

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
