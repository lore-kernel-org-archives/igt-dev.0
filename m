Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5980C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786B610EDFA;
	Wed, 22 Jul 2026 14:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz8aBA2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCBE10EDFC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784729634; x=1816265634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4MZt96wu33L0QrrVnadpVb0ZAhk2MJOkGC6QBcgMSvc=;
 b=Wz8aBA2zu8ZaljJzQbSyodtJPDD2EQTk4gPBqqp2nNw5OXZBE7LDjvsq
 KT/dmrAb3PHO16IrPUY+flDnuYi+hdRAo19YybbzKJOh1BXbCZVYMlUGM
 fECFecmmZ8SIWyF8Hy7ryqoobWKx/GR4mEtMQ8FGRbS86C9UfalX6MbEz
 QkNOHCp86iT5LIkwCBM0woTmnjZem4PWNW0v1lVYg8ZY8QtkV9LNvAqCq
 TLQtnrNxmAhjGy4VJrDoPA37DurTQbcGVwPzfWpfn8I1ltMipTs6r2bXs
 VA3H5WhVVa2WtMKE1UArv6zJ7UxvPN4T6KCRWqmUTr/6F6SaABfB3lPT4 w==;
X-CSE-ConnectionGUID: 1HhKkdZESse1TrW5lnfLgw==
X-CSE-MsgGUID: YjletbvWRkaR7pTNUdxE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85128762"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85128762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:13:53 -0700
X-CSE-ConnectionGUID: 4q+HUjCJQiW/iHmgEs5V5g==
X-CSE-MsgGUID: L4vEqdAQSOKTrkPKuSzKJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="253742187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:13:51 -0700
Date: Wed, 22 Jul 2026 16:13:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v3 04/10] tests/imagination: Add GPU ID test
Message-ID: <20260722141349.r34qpyayzkohxw2z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-4-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-4-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:36 +0200, Robert Mazur wrote:
> From: Frank Binns <frank.binns@imgtec.com>
> 
> Add a basic GPU ID validation subtest.
> 
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
>  tests/imagination/meson.build    |  1 +
>  tests/imagination/pvr_gpu_info.c | 54 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index 62930da2b..c5899972b 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -1,5 +1,6 @@
>  pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_gem',
> +	      'pvr_gpu_info',
>  	    ]
>  
>  pvr_deps = test_deps
> diff --git a/tests/imagination/pvr_gpu_info.c b/tests/imagination/pvr_gpu_info.c
> new file mode 100644
> index 000000000..24ab18491
> --- /dev/null
> +++ b/tests/imagination/pvr_gpu_info.c
> @@ -0,0 +1,54 @@
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
> +IGT_TEST_DESCRIPTION("Check that igt/imagination knows about this GPU ID");
> +
> +static bool
> +has_known_gpu_id(int fd, const struct drm_pvr_dev_query_gpu_info *gpu_info)
> +{
> +#define PVR_BVNC_ID(b, v, n, c) \
> +	(((uint64_t)(b) << 48) | \
> +	((uint64_t)(v) << 32) | \
> +	((uint64_t)(n) << 16) | \
> +	((uint64_t)(c)))
> +
> +	switch (gpu_info->gpu_id) {
> +	case PVR_BVNC_ID(4, 40, 2, 51):
> +	case PVR_BVNC_ID(33, 15, 11, 3):
> +	case PVR_BVNC_ID(36, 53, 104, 796):
> +		break;
> +	default:
> +		igt_warn("Unknown GPU ID: 0x%016llx\n", gpu_info->gpu_id);
> +		return false;
> +	}
> +#undef PVR_BVNC_ID
> +
> +	igt_info("GPU BVNC: %u.%u.%u.%u\n",
> +		 (unsigned int)(gpu_info->gpu_id >> 48 & 0xffff),
> +		 (unsigned int)(gpu_info->gpu_id >> 32 & 0xffff),
> +		 (unsigned int)(gpu_info->gpu_id >> 16 & 0xffff),
> +		 (unsigned int)(gpu_info->gpu_id & 0xffff));
> +
> +	return true;
> +}
> +
> +int igt_simple_main()

I would prefer igt_main() as it has proper startup/cleanup.
Up to you, LGTM

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil


> +{
> +	int fd = drm_open_driver(DRIVER_POWERVR);
> +	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
> +
> +	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_GPU_INFO_GET,
> +				sizeof(gpu_info), &gpu_info, 0);
> +
> +	igt_assert(has_known_gpu_id(fd, &gpu_info));
> +	igt_assert_neq(gpu_info.num_phantoms, 0);
> +}
> 
> -- 
> 2.43.0
> 
