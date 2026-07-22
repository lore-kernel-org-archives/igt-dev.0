Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B52C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0952F10E46D;
	Wed, 22 Jul 2026 14:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbbDCRKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CD610E46D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731513; x=1816267513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/fzRX/1yTrYMOsT9G4bWT62g3L9ma81pEbMae9TzkTc=;
 b=VbbDCRKYFhiZZjXxAA3yodoN62dBMFixkYb7/6hyOVx2bSNvNYzyUcKc
 cKzv0aKz2WtXT7Ifv1Klk3cpdpoE+NySH4dPMaBYbAb2Hfimem3PbHdSJ
 h8rchxzBtg9XUjTKulXdByqsQpbx8gwcasdV4ptxIbPdEnbN//8Y/1n5G
 Nch2r5XHhZCDcv+EKaYjSbcoCP16+ZblBB0HSwY612aoqKNlQ4GChaINh
 4Fdw/OkanxbGqP16CdgE1EZVWXLFjsdwlsKO5cttqSPXrjLO3s6TgboJV
 Nu39nPPg5aL80RHP9opqRUH54YSugfvFhehR2caqNPuJwcjxS2mBlhkks g==;
X-CSE-ConnectionGUID: GX6Pw9oxTUCnCCNETqwG9Q==
X-CSE-MsgGUID: HU5hDipKQm+M+51dheQkcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96883425"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96883425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:45:13 -0700
X-CSE-ConnectionGUID: cGgMmogiTxKM1vOCpDcFHA==
X-CSE-MsgGUID: YbB9EPj5TQmwRuH0bomVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="251805653"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:45:10 -0700
Date: Wed, 22 Jul 2026 16:45:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v3 10/10] tests/imagination: Add DEV_QUERY
 runtime_info tests
Message-ID: <20260722144508.n5y33du3kbu4hoob@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-10-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-10-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:42 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add test validating runtime info fields from DEV_QUERY.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
>  tests/imagination/meson.build        |  1 +
>  tests/imagination/pvr_runtime_info.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
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
> index 000000000..93eca5b3f
> --- /dev/null
> +++ b/tests/imagination/pvr_runtime_info.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <stdbool.h>
> +
> +

Remove one empty line, now there are two while one is enough.

With above fixed this is
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

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
