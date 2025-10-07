Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107ECCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 08:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1110E5B7;
	Tue,  7 Oct 2025 08:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFX7hr5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD84F10E5B7
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759826127; x=1791362127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=x+sLKK1vn2tkijhRZOkYudXnjlinin3kKHun0nZJTPY=;
 b=cFX7hr5bFqDkCioDFqBm5UDzRpsrg4dAeo5U3+szksvfTPuApgPlN8rw
 4Q/kNM4ByFwEyOpNgGHAq3O4USkl1HmYQj2QxovM6Z9DVA4gVWPMJ4u+7
 WVGI349CuNHEuFyOnUoetG8v6qYijQPX9EwaaAh43PFj8wQ0x1tRqb+yX
 9HoQLThaIZvBDwEuNMC9+BccMXFhqpS46s6OE+e4zaaePtW0uIBETXAh5
 R8QaBJTcDyT1B8qWBelX+RikmhiI7J07YH0atrdbMnJai+/49NKD7gISu
 Mx4YmXPkAtJzasc5/+uYjJ4TbMC3zmfgQdAKIM2DVogRncllfECjP6f3G A==;
X-CSE-ConnectionGUID: 7NmC0EZdSHS+qaH9F8I0AA==
X-CSE-MsgGUID: YcEu8V2ySNafGXrmkJ7UPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62167672"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62167672"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:35:27 -0700
X-CSE-ConnectionGUID: 97+l+OAFRSaxNhs6om6pYw==
X-CSE-MsgGUID: pB5H3O8xTne2qOPkbBZtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="211062263"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:35:25 -0700
Date: Tue, 7 Oct 2025 10:35:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_concurrent: Add SYSVIPC support
 check
Message-ID: <20251007083523.fmnf7vq43saeihxp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250915122923.2274820-1-s.sebinraj@intel.com>
 <20250915122923.2274820-2-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915122923.2274820-2-s.sebinraj@intel.com>
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

Hi,
On 2025-09-15 at 17:59:23 +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle
> targets that don't have SYSVIPC enabled in their kernel. Without this
> check, the test would fail with assertion errors when trying to use
> message queues.
> 
> The implementation checks if the target supports IPC,
> if not found it skips the test.
> 

Also

+cc Zbigniew
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Regards,
Kamil

> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/igt_core.h         |  8 ++++++++
>  tests/kms_concurrent.c | 18 ++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 6f462205f..1da8f21dc 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -49,6 +49,14 @@
>  #include "igt_freebsd.h"
>  #endif
>  
> +/**
> + * device_supports_sysvipc:
> + *
> + * A function to check if the device supports IPC
> + * @return: true or false
> + * */
> +bool device_supports_sysvipc(void);
> +
>  #ifndef IGT_LOG_DOMAIN
>  #define IGT_LOG_DOMAIN (NULL)
>  #endif
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4f16f8b89..80512a140 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -107,6 +107,22 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
>  	data->fb = NULL;
>  }
>  
> +/**
> + * Checks if the current device supports SYSVIPC by verifying the existence and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +bool device_supports_sysvipc(void)
> +{
> +	char path[128] = {'\0'};
> +
> +	snprintf(path, sizeof(path), "/proc/sysvipc");
> +	if (access(path, R_OK | W_OK) == 0)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void
>  create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
>  			    int *rect_x, int *rect_y,
> @@ -395,6 +411,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
> +		igt_require(device_supports_sysvipc());
> +
>  		if (is_intel_device(data.drm_fd))
>  			intel_allocator_multiprocess_start();
>  	}
> -- 
> 2.34.1
> 
