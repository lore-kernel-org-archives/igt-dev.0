Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABECCFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 13:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A6610E6CC;
	Thu, 27 Nov 2025 13:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsMuyVel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F5C10E6CC
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764249358; x=1795785358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UEYlO85JB44JpP4pE+Hiz8Fcg1JXKNACr7lyjnTXJIU=;
 b=GsMuyVel5oBfrPluy2UYHTZmxiucH4uGURnmlgrkwC0W9taGfQRY9RJO
 iCc7xIvs6yyILKqq2PGNF5fGbvg2GjoGT3/20KbNBL5o7fVJm/sKmUFTb
 DDT+0ixROFZUGcnLYZAYjs//FSpCk/RdCXuDiCyXiAY36oyqiqSPrq+fE
 2TXkURqnf9EYqIddRuJSLjWLe2b7YMgD72jrZevm37V6bs2S2EZdhRlqo
 Fq+wyOXu8jGKi6zrD2sVaaMsT6s1/56/Jqa6uLyiQCHAVpLOdMx2I65m4
 dNClWDbY+DJ17Rh3E/BPnKhc4Rx45/CHRzzEGtJshnWLefKmVD0ZaikVG A==;
X-CSE-ConnectionGUID: 2sPivZsVSxG0nmcphiGHSg==
X-CSE-MsgGUID: CfbGPCwqRy6AT7pRTU6yZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66334931"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66334931"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 05:15:58 -0800
X-CSE-ConnectionGUID: 4h2gTOuUR8C4iw1rkHJ+mw==
X-CSE-MsgGUID: jaEAWq1+QhaR8ETfG2IsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197549005"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 05:15:56 -0800
Date: Thu, 27 Nov 2025 14:15:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v8 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU xGPU memory access test
Message-ID: <20251127131554.5zucjiu5mpzwvlw5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-4-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121162537.77551-4-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2025-11-21 at 16:25:30 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This test allocates a buffer in SVM, writes data to it from src GPU,
> and reads/verifies the data from dst GPU. Optionally, the CPU also
> reads or modifies the buffer and both GPUs verify the results,
> ensuring correct cross-GPU and CPU memory access in a multi-GPU environment.

Please add link to kernel part, preferrably to lore.kernel.org

+Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 395 ++++++++++++++++++++++++++++++++++

imho test shoud be named xe_svm.c (best) or
xe_multigpu_svm.c (second best) or xe_multi_gpu_svm.c
For rationale see below.

>  tests/meson.build             |   1 +
>  2 files changed, 396 insertions(+)
>  create mode 100644 tests/intel/xe_multi_gpusvm.c
> 
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
> new file mode 100644
> index 000000000..471be6449
> --- /dev/null
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <unistd.h>
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_multigpu.h"
> +
> +#include "intel_blt.h"
> +#include "intel_mocs.h"
> +#include "intel_reg.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_util.h"
> +
> +/**
> + * TEST: Basic multi-gpu SVM testing

Here in description you do not use GPUSVM, so test name should follow.
Also s/gpu/GPU/

> + * Category: SVM

Add description here, also write down what is SVM shortcut,
for example:

 * Description: Test for Shared Virtual Memory (SVM) on multi-GPU

Regards,
Kamil

> + * Mega feature: Compute
> + * Sub-category: Compute tests
> + * Functionality: SVM p2p access, madvise and prefetch.
> + * Test category: functionality test
> + *
> + * SUBTEST: mgpu-xgpu-access-basic
> + * Description:
> + *	Test basic cross-GPU memory access in multi-GPU SVM configuration
> + *
> + * SUBTEST: mgpu-xgpu-access-prefetch
> + * Description:
> + *	Test cross-GPU memory access with prefetch in multi-GPU SVM configuration
> + *
> + */
[cut]
