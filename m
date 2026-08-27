Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF7C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 16:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E7F10F112;
	Thu, 27 Aug 2026 16:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwBsFXpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E7410F106
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787848670; x=1819384670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E1TAfq6hF++IJnVKuprr/zzNzPA3FGEzcOKZey7YTlU=;
 b=QwBsFXpUp1Q+DrWHuY640BJhhH2N+JVqF1hztXEnIyF/7y/XaOMi3TLr
 7ih8uJAfVwP6rvErAtcKTWQ1e+B+Ah6/3kg0OAs35FZQ1OSXvZQjue4vh
 6R8IDLRl1KOd3A6FkeDL1rbdAtK+SC/6+wSuSG2fccfPxU3R7OUjcHBs3
 keBrV/RqJwsyoDE6IhByRo+B831JK6qGhd/BBrhJQRyGR5Pj4ix2R5uSc
 35uWYUoU1WittIOvgp1gCVqGnjVhffJh6oxlGWp2hxfGreOTtlKaALwBu
 tCmFYRPAt6fpNBvF2QY4qsRV7qQBp8O4sh8e50ECvKx4vfhQWskj9rBFY Q==;
X-CSE-ConnectionGUID: iN/GCE4JQ+KU3i5kapsi0A==
X-CSE-MsgGUID: o3Ak7MzuSCK6RWqsZJwU3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90868256"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="90868256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:37:48 -0700
X-CSE-ConnectionGUID: pKoHZrmzRkeDLoKcdLDf3g==
X-CSE-MsgGUID: 58jBW4rjSqmv9NJ4WkTfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="292741086"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:37:47 -0700
Date: Thu, 27 Aug 2026 18:37:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel: add BO allocation stress
 coverage
Message-ID: <20260827163730.f7nsz7xh4odhopxo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 nishit.sharma@intel.com
References: <20260826155132.1313570-1-sobin.thomas@intel.com>
 <20260826155132.1313570-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826155132.1313570-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-08-26 at 15:51:29 +0000, Sobin Thomas wrote:

I have only few nits, see below.

> Add a BO allocation stress test that exercises concurrent
> buffer allocation, VM binding for randomized and threaded
> execution.
> 
> The test runs multiple workloads in parallel threads, forcing memory
> pressure, verifies execution and validate result after execution.
> This provide coverage for different BO allocation stress
> scenarios
> 
> v3: renamed the sub test functions.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 1030 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |    1 +
>  2 files changed, 1031 insertions(+)
>  create mode 100644 tests/intel/xe_bo_alloc.c
> 
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
> new file mode 100644
> index 000000000..815c7ddf2
> --- /dev/null
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -0,0 +1,1030 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation

This should be 2026, unless someone sent this back in 2021?

> + */
> +
> +/**
> + * TEST: xe_bo_alloc
> + * Category: Core
> + * Mega feature: General
> + * Sub-category: Memory
> + * Functionality: BO allocation
> + * Description: Tests for buffer object allocation in Xe driver
> + */

Add newline here.

> +#include <fcntl.h>
> +#include <errno.h>

Move errno.h before fcntl.h



Regards,
Kamil

> +#include <sys/mman.h>
> +
> +#include "igt.h"
> +
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#include "xe_drm.h"
> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define BO_BIND_BASE_ADDR	0x1a0000ull
> +#define THREAD_VA_STRIDE GB(1)
> +#define SZ_4K_SHIFT	12
> +#define MAX_ALLOCATIONS 50000
> +
[cut]
