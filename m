Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F6C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0209210E035;
	Wed, 29 Jul 2026 10:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DT6VOF9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36A10E1C4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 10:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322208; x=1816858208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r7hrJwP5V32LkrMq2mdi8kBtHGkOHvTLgVmZFkGJGws=;
 b=DT6VOF9VYCWs78Rdzzwlymc57kDmP2VHE/Hy8Rq82Dd7slB76toYSh7a
 VLGL7HDPy7cAMDAT2/5TfE26BkfPTp0BiJa93b7XqvbYkCj1uv8pLOYpl
 3IBIISeqGlnN2nPtGS3t7mq6cWKORk+d6bsBhDDcS7UrQFsC8PPPvBPsX
 E5w8Ld/2m0zR1UK/5Ty6qFg2UKJO/x3Kk6IiH24Qksa7m7SGKN65EgtDb
 cm2RpBdPw//ZdEOb6KE2tSUqJ22G8iMn6CSSpf7d77w+Ls0ilRhxJTlS/
 cg8sCBk39LLGbog+N4P7wzFgrAL5fAeexXVkxzgIVgACF1rlLfDFer011 w==;
X-CSE-ConnectionGUID: If+Vhk18RYGHLLJAie1Ovw==
X-CSE-MsgGUID: rxTK6pqZRSO6GJk798nHBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73458521"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="73458521"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:50:07 -0700
X-CSE-ConnectionGUID: TzPWgXZ8R5C0BcQrphk40w==
X-CSE-MsgGUID: TXQqukDKQgOWTvxwSCDvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="260037444"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:50:06 -0700
Date: Wed, 29 Jul 2026 12:49:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: Re: [PATCH i-g-t 2/2] tests/imagination: Add DEV_QUERY runtime_info
 tests
Message-ID: <20260729104950.2cigmyi44du7s6ru@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>
References: <20260728-test-imagination-additional-dev_query-tests-v1-0-f361c7c2b513@imgtec.com>
 <20260728-test-imagination-additional-dev_query-tests-v1-2-f361c7c2b513@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-test-imagination-additional-dev_query-tests-v1-2-f361c7c2b513@imgtec.com>
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
On 2026-07-28 at 21:39:34 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add test validating runtime info fields from DEV_QUERY.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Applied, thank you.

Regards,
Kamil

> ---
>  tests/imagination/meson.build        |  1 +
>  tests/imagination/pvr_runtime_info.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index dc08a5d8b..59749b51e 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -5,6 +5,7 @@ pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_heap_info',
>  	      'pvr_hwrt',
>  	      'pvr_quirks_enhancements',
> +	      'pvr_runtime_info',
>  	      'pvr_vm_context',
>  	    ]
>  
> diff --git a/tests/imagination/pvr_runtime_info.c b/tests/imagination/pvr_runtime_info.c
> new file mode 100644
> index 000000000..02496e043
> --- /dev/null
> +++ b/tests/imagination/pvr_runtime_info.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <stdbool.h>
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +IGT_TEST_DESCRIPTION("Test that the runtime info query returns valid data");
> +
> +int igt_simple_main()
> +{
> +	int fd = drm_open_driver(DRIVER_POWERVR);
> +	struct drm_pvr_dev_query_runtime_info runtime_info = {0};
> +
> +	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
> +				sizeof(runtime_info), &runtime_info, 0);
> +
> +	igt_assert_neq_u64(runtime_info.free_list_min_pages, 0);
> +	igt_assert_lt_u64(runtime_info.free_list_min_pages,
> +			  runtime_info.free_list_max_pages);
> +
> +	igt_assert_neq(runtime_info.common_store_alloc_region_size, 0);
> +	igt_assert_neq(runtime_info.common_store_partition_space_size, 0);
> +
> +	igt_assert_neq(runtime_info.max_coeffs, 0);
> +
> +	igt_assert_neq(runtime_info.cdm_max_local_mem_size_regs, 0);
> +}
> 
> -- 
> 2.43.0
> 
