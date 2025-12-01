Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB2D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 16:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FCF10E42A;
	Mon,  1 Dec 2025 16:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtWGHE7X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AC310E409
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764605042; x=1796141042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3Js4gOgHwS7ZBPctO7KmNldln+WUU1KhMBpf5BabJQA=;
 b=EtWGHE7XCCM1IwHn6IVV4thfCukE0ujAmgxFj8TixKHKj7hZZrVyjt5s
 xXTmEZY+/efDtYWnfZlgho2Dbp+Ivf+s32sL69IXJVktwIrxsfQhGuoMm
 irBFtzjSOcIk3688WRtNa4pNW1h5Et2qb1loGbnTwV5ZXurjcd/uUnmDc
 uVbiWc1ZllGPSIAIZSRxADsamt5Op+1YsTKJyPdZKLL0tZInloxaTY7mC
 XxIIjYARMDmWekj3gekQIJaqisKyM0/gpNAciY8MK8yw9/Btqid6nNooF
 FU93LJKLuh+EPl/7CYKaRtpa50yvZfJW+PUp4tyr8+saIoVjDktYwUP+K A==;
X-CSE-ConnectionGUID: ibzbDoQWQYWVYU1mUswxOw==
X-CSE-MsgGUID: tKOPI8KaRCOvklrPctYJAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77236313"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77236313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:04:02 -0800
X-CSE-ConnectionGUID: xxXSpIxjTvK/qslym2VYJA==
X-CSE-MsgGUID: BlhNPNEjQYaizDlNvNYg6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194100010"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:04:01 -0800
Date: Mon, 1 Dec 2025 17:03:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t v9 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU xGPU memory access test
Message-ID: <20251201160358.lcsfiwmh465ojjxa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-4-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201090349.326673-4-nishit.sharma@intel.com>
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
On 2025-12-01 at 09:03:42 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This test allocates a buffer in SVM, writes data to it from src GPU,
> and reads/verifies the data from dst GPU. Optionally, the CPU also
> reads or modifies the buffer and both GPUs verify the results,
> ensuring correct cross-GPU and CPU memory access in a multi-GPU environment.
> 
+cc Thomas Hellström <thomas.hellstrom@linux.intel.com>

> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 392 ++++++++++++++++++++++++++++++++++

This is a bad name for a test, once again - either xe_gpusvm.c or
xe_svm.c or xe_multigpu_svm.c

Imho best one is xe_svm.c

The 'multi' word is has no relevance here, it should be
'multigpu' or not used.

>  tests/meson.build             |   1 +
>  2 files changed, 393 insertions(+)
>  create mode 100644 tests/intel/xe_multi_gpusvm.c
> 
> diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
> new file mode 100644
> index 000000000..a80193b9a
> --- /dev/null
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -0,0 +1,392 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

This should be 2025. This cannot be merged until corrected.

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
> + * Category: SVM

You need a Desciption: here, it is global test description like
IGT_TEST_DESCRIPTION() used in old descriptions. Also decipher
SVM shortcut in it.

For example look into tests/kms_debugfs.c:

/**
 * TEST: kms debugfs test
 * Description: Read entries from debugfs with all displays on and with
 *              all displays off.

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

