Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869D4ED7B91
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3870F10E5B7;
	Tue, 14 Apr 2026 09:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XinSicgH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABEF10E166
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776158589; x=1807694589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JP5Im7h5/xfcj8zB1ZQWOWCbOcCFv3TbRX4sCZAfT6U=;
 b=XinSicgHvsOxBpo6h3r/eOzTaNDTMe7AdG0J6yX5Er2L3Phd3dh+wqaf
 EwFsiYZZYhPlDoJ8Uz46oBl8Gk8v6vjmpRiXCKxOGGtcbzJBnIHSkAjr0
 +O4BARI/6MJw7hVQI611fm7lqps9hL9z87YlgYO3gs50ZpEqOt6NkrFYc
 g2tPRaQx/9/Zrb+K4/ZG4C5HBvQtX+GXpmUXmuu44B/7ROrbhUFVcUkhv
 cdpavagFSI/H6yrYNJfIfk+HaK3tzqPAsnTho7jTvC8PT7Iv9Wz6wkqx/
 +IHoFoEBDItZNXjbjllvDoYfnXq1PE8QmdiY/qk9p7g/HuCXqVoV1ddzg g==;
X-CSE-ConnectionGUID: N3CCX4ZLTAi/RSkVn335ng==
X-CSE-MsgGUID: usqJxOIbQUuiDm07zgRavg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80704112"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80704112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:23:08 -0700
X-CSE-ConnectionGUID: LEQYAI3TQjKVeUR1IbORRw==
X-CSE-MsgGUID: RgGTBiR9S6S4qFZ4euKUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225739315"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:23:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t 5/6] tests/kms_feature_discovery: add basic usb4
 switch discovery
In-Reply-To: <20260409043714.284108-6-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
 <20260409043714.284108-6-kunal1.joshi@intel.com>
Date: Tue, 14 Apr 2026 12:23:03 +0300
Message-ID: <fb0186beeb70b5c485d4e726b584a2403e73b76c@intel.com>
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

On Thu, 09 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Add a 'usb4-switch' subtest that verifies the Microsoft USB4 Switch
> 3141 is reachable. The test initializes the switch library and queries
> the active port to confirm communication works.
>
> This enables CI to detect when USB4 switch hardware is available
> before running the full kms_usb4_switch test suite.

How long is this going to take when the device is *not* there, i.e. most
cases in CI?

BR,
Jani.

>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  tests/kms_feature_discovery.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 28ec89c55..abb9bad97 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -40,6 +40,7 @@
>  #include "igt_psr.h"
>  #include "igt_sysfs.h"
>  #include "igt_types.h"
> +#include "igt_usb4_switch.h"
>  
>  /**
>   * SUBTEST: display
> @@ -63,6 +64,9 @@
>   * SUBTEST: dp-mst
>   * Description: Make sure that we have DP-MST configuration.
>   *
> + * SUBTEST: usb4-switch
> + * Description: Verify that USB4 Switch 3141 is available and responding.
> + *
>   * arg[1].values: 1, 2, 3, 4
>   */
>  
> @@ -147,6 +151,25 @@ int igt_main() {
>  		}
>  #endif
>  
> +		igt_describe("Verify that USB4 Switch 3141 is available and responding.");
> +		igt_subtest("usb4-switch") {
> +			struct usb4switch *sw;
> +			int port;
> +
> +			sw = usb4switch_init(fd);
> +			igt_require_f(sw,
> +				      "USB4 Switch 3141 not available\n");
> +
> +			/* Verify communication works by querying active port */
> +			port = usb4switch_get_active_port(sw);
> +			igt_assert_f(port >= 0,
> +				     "Cannot communicate with USB4 switch\n");
> +
> +			igt_info("USB4 Switch 3141 available (active port: %d)\n",
> +				 port);
> +			usb4switch_deinit(sw);
> +		}
> +
>  		igt_describe("Make sure that we have eDP panel with PSR1 support.");
>  		igt_subtest("psr1") {
>  			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_1, NULL));

-- 
Jani Nikula, Intel
