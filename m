Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D190DC88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 15:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D30C10E3D8;
	Fri, 11 Sep 2026 15:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXai30xF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C68410E3D8
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789139034; x=1820675034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HgLpTg/j+34/v3wF5Kp3k/afU27t7KS1neDbh1Eh2lY=;
 b=VXai30xFTrFvYue1E8ty3CUeF2INEZ5Qth1hdom6YSCaHZbd1LaJWxd8
 9y0resVp5czo89zKwCp8NuDk5e4Y+9MZ/Bw3PmlaiWxLhTfqPQriaLN5M
 daKkF7veqQNXQJy+1fDSFwF/z+w0+u3qyt1dYgZivDfTF2+8WOwfiA5k4
 7iOGuoaymnwGr5hwIs3vw1Vfj71YO+DlfIrnQAIWrkdJY88EbvrzAXSdj
 Hkk4bA2ki+wNYx24kKba0YOT9yMfplJebSw12GEJjqmMqOgmwxXlzKXkv
 uYAqwbcr48LOtXCKoDswvN5DBO1v4RcxVPvgMU9r+w35GNaCs1F0dOwgZ w==;
X-CSE-ConnectionGUID: 0iY5+68bRQuEBZzB/dNOhw==
X-CSE-MsgGUID: Ss2v5Ws2T3mwwkXAMfH5zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89444723"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89444723"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:03:53 -0700
X-CSE-ConnectionGUID: sJZXYI6CTq2bGCybAecGFQ==
X-CSE-MsgGUID: N1D6ky6nSU6VbNXiLPB1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="315163"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:03:52 -0700
Date: Fri, 11 Sep 2026 17:03:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
Message-ID: <20260911150349.d3bf36adl6ujstd6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>,
 Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
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

Hi Ravi,
On 2026-09-03 at 13:03:32 +0530, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
> 
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v4:
>   - Added Steer Semaphore for disabling and enabling multicast
>     operation(soham)
>   - Increased device recovery check timeout from 5secs to 10secs
>   - Used updated library names with igt_drm_netlink_* prefix (Nikula
>     Jani & Kamil)
> ---
>  tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
>  tests/intel/xe_err_injection.h |  31 +++
>  tests/meson.build              |   1 +
>  3 files changed, 374 insertions(+)
>  create mode 100644 tests/intel/xe_err_injection.c
>  create mode 100644 tests/intel/xe_err_injection.h
> 
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..683994d1c
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>

Keep it sorted, so fcntl.h should be first.



Regards,
Kamil

> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
[cut]
