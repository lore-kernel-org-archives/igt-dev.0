Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1FFC48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 11:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB310E0E0;
	Mon, 19 Feb 2024 11:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOjJVNkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FFA10E0E0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 11:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708341071; x=1739877071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fi4cBy8OoESedOt86ALmL/eat2vHTbltdl/Tj0kpkVo=;
 b=jOjJVNkT8hZfUpsVge0+VyD9Uszpo1OTbBwuRGtyTwfI+aQ0e5KAS/w+
 I+YC9cxzim0ekaBAtHSE4TekPIdxyd1QJJ2IndLVTTO/23OblqIpmGWBB
 u6qg5klnQ1SmyeP92H3+aAcdCDFn3V4jAvfFrqVVMsVxiKMi8I5gTyu6p
 +iGuRXW8WoLNxz5DBzsgJE1LOKZcNiO8LhhdndZJFfxOEwRmTneTXb7LK
 mv1h/8wJ4aXrW2JJkjjezl34MIzstM/xJJnor9fAAV1ugCwpV7UcMYhfG
 /CSJZ9A/5fOz2K98+BqXfdEjBYsKahjHe6oD0/nx7CvQY+rkRDA23pbkJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2545864"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2545864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4846908"
Received: from unknown (HELO localhost) ([10.246.5.157])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:11:08 -0800
Date: Mon, 19 Feb 2024 12:11:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v9 3/7] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Message-ID: <20240219111104.53sdorfempz6tp6i@zkempczy-mobl2>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <20240215161014.60304-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215161014.60304-4-kamil.konieczny@linux.intel.com>
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

On Thu, Feb 15, 2024 at 05:10:10PM +0100, Kamil Konieczny wrote:
> From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> 
> Implemented gem_require_multigpu in order to replace
> igt_require(gpu_count > 1), as well as printing available
> PCI devices if requirement fails.
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
> [Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_multigpu.c | 28 ++++++++++++++++++++++++++++
>  lib/intel_multigpu.h | 11 +++++++++++
>  lib/meson.build      |  1 +
>  3 files changed, 40 insertions(+)
>  create mode 100644 lib/intel_multigpu.c
>  create mode 100644 lib/intel_multigpu.h
> 
> diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> new file mode 100644
> index 000000000..34c9f936d
> --- /dev/null
> +++ b/lib/intel_multigpu.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "intel_multigpu.h"
> +
> +void gem_require_multigpu(int count)
> +{
> +	struct igt_devices_print_format fmt = {
> +		.type = IGT_PRINT_SIMPLE,
> +		.option = IGT_PRINT_PCI,
> +	};
> +	int devices;
> +
> +	if (igt_device_filter_count() >= count)
> +		return;

If we have 2 filters and count == 2 we return?

--
Zbigniew

> +
> +	igt_info("PCI devices available in the system:\n");
> +
> +	igt_devices_scan(true);
> +	devices = igt_device_filter_pci();
> +	igt_devices_print(&fmt);
> +
> +	igt_skip("Test requires at least %d GPUs, %d available.\n", count, devices);
> +}
> diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> new file mode 100644
> index 000000000..98dc5a4ce
> --- /dev/null
> +++ b/lib/intel_multigpu.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_MULTIGPU_H
> +#define __INTEL_MULTIGPU_H
> +
> +void gem_require_multigpu(int count);
> +
> +#endif /* __INTEL_MULTIGPU_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 6122861d8..8251695e1 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -65,6 +65,7 @@ lib_sources = [
>  	'intel_device_info.c',
>  	'intel_mmio.c',
>  	'intel_mocs.c',
> +	'intel_multigpu.c',
>  	'intel_pat.c',
>  	'ioctl_wrappers.c',
>  	'media_spin.c',
> -- 
> 2.42.0
> 
