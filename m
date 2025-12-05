Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2E6D33992
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 17:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646610EB6C;
	Fri,  5 Dec 2025 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgVWnYea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE92B10EB6C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764954201; x=1796490201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QJtDXxHW6Afsq7RjEgqpWuwoo3xfZiOfDXMnmn3NFpw=;
 b=lgVWnYeaXEnKs81on+iXWLSPpDfZ7KJAAtHCQCuFxiRH4DKccTJ1C1Ge
 QsaF2cjP5Rgk2wM7Vxo6idT/Z8tca5331UlOleJMSxa3jjGqvPjPVO0LO
 xzqr4qAn0EbyAlf1hmrENjSv1k3Q+RYM2OHFlj7dn2tg4JLS3jiH9wb2b
 LO1Bm6jZXteGzuBya8uxEv5OYtH5VtRn1VsaxOC7Mox5WwEXQcRfSY8HH
 tFrvHiiIBbvgWeZEKYKXKfMBTfxcahtuTdaHy/Y9bmUK1hIpM+sZMf9W1
 X3XpTTEGcNfV0lNatF6GavmvV2FkAhHTmbDAu4xOneiy48wCnXVQJMBh/ A==;
X-CSE-ConnectionGUID: 0ydMagazTxCWfFt3YqL2lA==
X-CSE-MsgGUID: UWJmBlW7RJCrPxwrVxxe5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66875011"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66875011"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 09:03:21 -0800
X-CSE-ConnectionGUID: r/hB/mLtSIChN6XFVaJs3w==
X-CSE-MsgGUID: WDv5nHZDRK+igPWStH8KCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="218684754"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 09:03:18 -0800
Date: Fri, 5 Dec 2025 18:02:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Message-ID: <20251205170257.ziuhcoetjvxnr5xa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251127094043.3916839-1-soham.purkait@intel.com>
 <20251127094043.3916839-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127094043.3916839-3-soham.purkait@intel.com>
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

Hi Soham,
On 2025-11-27 at 15:10:43 +0530, Soham Purkait wrote:
> Introduce vendor-agnostic support for handling multiple GPUs and instances
> in gputop. Improve the tool's adaptability to various GPU configurations.
> 
> v1:
>  - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>  - Add device filter to populate the array of cards for
>    all supported drivers. (Zbigniew)
> v3:
>  - Cosmetic changes. (Riana)
>  - Avoid three level indentation. (Riana)
> v4:
>  - Add user message for running without root privileges. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/{ => gputop}/gputop.c | 253 ++++++++++++++++++++++++++++++------
>  tools/gputop/meson.build    |   6 +
>  tools/meson.build           |   6 +-
>  3 files changed, 220 insertions(+), 45 deletions(-)
>  rename tools/{ => gputop}/gputop.c (63%)
>  create mode 100644 tools/gputop/meson.build
> 
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 63%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index f577a1750..4d6c684b2 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>   */
>  
>  #include <assert.h>
> @@ -14,66 +14,149 @@
>  #include <math.h>
>  #include <poll.h>
>  #include <signal.h>
> +#include <stdbool.h>
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
>  #include <sys/stat.h>
> +#include <sys/sysmacros.h>
>  #include <sys/types.h>
> -#include <unistd.h>
>  #include <termios.h>
> -#include <sys/sysmacros.h>
> -#include <stdbool.h>
> +#include <unistd.h>
>  
> +#include "drmtest.h"

This tool should not use drmtest if possible. The main reason it
is a tool not a test, and drmtest is mainly for testing.

Let me explain how it should work in pseudocode:

for each g in gpu_set
	p = get_plugin(g)
	if p and plugin_supports_gpu(p, g) and could_display(p, g)
		display_workload_by_plugin(p, g)
	else
		display_using_old_gputop_method(g)
	fi

This way you do not need to implement plugin for i915 as it will
just work by fall through. Plugin could just extend printed info
when someone calls it with root/sudo or group or with added
capabilities.

If this is hard, you could also consider creating new tool, for
example ngputop (n = new). In new tool you could make new
assumptions and ignore GPUs for which there is no plugin, also
demand having root or capabilities.

Regards,
Kamil

>  #include "igt_core.h"
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
> +#include "igt_perf.h"
>  #include "igt_profiling.h"
> -#include "drmtest.h"
> +#include "xe_gputop.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * Supported Drivers
> + *
> + * Adhere to the following requirements when implementing support for the
> + * new driver:
> + * @drivers: Update drivers[] with driver string.
> + * @sizeof_gputop_obj: Update this function as per new driver support included.
> + * @operations: Update the respective operations of the new driver:
> + * gputop_init,
> + * discover_engines,
> + * pmu_init,
> + * pmu_sample,
> + * print_engines,
> + * clean_up
> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
> + * initial values.
> + */
[cut]
