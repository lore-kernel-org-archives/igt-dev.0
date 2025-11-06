Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA76CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 13:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB7310E3C5;
	Thu,  6 Nov 2025 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqBfvBrq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F76D10E3C5
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762434554; x=1793970554;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L4thtkps97y1ESBkeqrMgqkbR2c83zZcjg7zo0oeKsM=;
 b=kqBfvBrqeFUvfaoCKGydKDfRyEIyFlvFY+VrDFbKO7b6GL5E/qUJexiz
 lhi8IIhYWSUlanB9D5Kmj6bind8e3vAYP1Na84lA5rQ4t43RB55Tc6lPi
 eVOisSoMZom5ANYnW4LGQCz42TDrB67WnRNeiOSamI/UfVPZnzuAAoXln
 QwYcMBmnoexntW7xZkF2Bk+1M8ovhc862666w68y/cfbGUH2KGYdkbJ+x
 PXdvVMWtATibd1PP2dETU04/3u6cceq7o8fj0U4gJLWtPdytMX4dOVZFk
 sx6YFE3xB8iy/xtuWfNZaSOnYcPzaJZLyMmYijSd7VnhSNi1lC4aWsWkG g==;
X-CSE-ConnectionGUID: 25zngcqtSC6kccK28wsoGw==
X-CSE-MsgGUID: 9I6E2ABaSvO683DGKyTg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87198520"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="87198520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:09:13 -0800
X-CSE-ConnectionGUID: xlvAh6deTqafz3YBQ00seg==
X-CSE-MsgGUID: pGsl0NaNRZun+zWRD8WzJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191849774"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:09:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log
 level in CI for scaling tests
In-Reply-To: <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
 <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
Date: Thu, 06 Nov 2025 15:09:08 +0200
Message-ID: <191a8b272532dbd8de15b380b583de718a37e44f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 06 Nov 2025, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrote:
> Reduce excessive logging in CI environments when multiple outputs
> are connected. It prevents CI runners from exceeding disk usage
> limits.

So how do we debug issues when there are no KMD debug logs? This can't
be the go-to solution in the long run.

Moreover, update_debug_mask_if_ci() doesn't even log the actual mask
being switched to.


BR,
Jani.


>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 63d35d76b..34c8f8a64 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -32,6 +32,7 @@
>  
>  #include "igt.h"
>  #include "igt_vec.h"
> +#include "igt_sysfs.h"
>  #include <math.h>
>  
>  /**
> @@ -1358,11 +1359,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		data.devid = is_intel_device(data.drm_fd) ?
>  			intel_get_drm_devid(data.drm_fd) : 0;
>  		igt_require(data.display.is_atomic);
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>  	}
>  
>  	igt_subtest_group {
>  		igt_output_t *output;
>  
> +		if (igt_get_connected_output_count(&data.display) > 1)
> +			update_debug_mask_if_ci(DRM_UT_DRIVER | DRM_UT_CORE);
> +
>  		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
>  			igt_describe(scaler_with_pixel_format_tests[index].describe);
>  			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {

-- 
Jani Nikula, Intel
