Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F02AC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 13:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8410E7FE;
	Thu, 25 Jul 2024 13:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8WMYFQ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA6210E7FE
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721915125; x=1753451125;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s7qEimJ9PUkl0tAANLitFAn4OBl5tRNGdIwBwG9P/4o=;
 b=M8WMYFQ710qO0HB7CdNNiRkULb7HDzI5q2T5LonVxaBKAk3xmkH5ui88
 wELOMtFiHoyUEpqeNEOwjzhSILwfMJYTaLnxCa9NRcgbLnNKBk+h3Ih1w
 ccBp3Y909lN4Uhp3X2gunxD9JIwKhdiDs73C+y7OP6LsakDM/Sh+WInz/
 moRly14dGKw9DR0O5CblWbm3JXpu/KVc9hv6p+jljH6mSI2+wCptM0m3u
 0fwPczFNdTjKjyMaLF4V22bJWDgB1LXZXv2c82TNghiKqQoGcrb4ZpGvS
 qM/X4F3KsT7C23d6NSwig9LVzZrAC0S0mltwnrGL/PYT1clZCYNUx/tCI w==;
X-CSE-ConnectionGUID: u55QRo50TMWK1X//4jVptQ==
X-CSE-MsgGUID: STFqXD6kQAaDtcyG7paZzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19531696"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19531696"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 06:45:24 -0700
X-CSE-ConnectionGUID: eBI/wav7RGunNWauYwwHxg==
X-CSE-MsgGUID: J5xEuv4CRKCCZ6qzFm8mbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53168746"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.122])
 ([10.246.0.122])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 06:45:23 -0700
Message-ID: <75f51358-3cba-41c3-92f2-dadf8eb33604@linux.intel.com>
Date: Thu, 25 Jul 2024 15:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2 1/2] lib/drmtest: Ensure the XE driver is idle before
 starting a test
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
 <20240725041803.1764959-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240725041803.1764959-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/25/2024 6:18 AM, Bhanuprakash Modem wrote:
> Re-use the existing i915's exit handler to make sure that the
> XE driver is idle before starting the subtest.
> 
> V2:
>   - Add some delay after attempting the gt reset
>   - Cover drm render device path too
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/drmtest.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index f8810da43..90885ec36 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -64,6 +64,7 @@
>   #include "intel_reg.h"
>   #include "ioctl_wrappers.h"
>   #include "igt_dummyload.h"
> +#include "xe/xe_gt.h"
>   #include "xe/xe_query.h"
>   
>   /**
> @@ -663,12 +664,17 @@ static void __cancel_work_at_exit(int fd)
>   {
>   	igt_terminate_spins(); /* for older kernels */
>   
> -	igt_params_set(fd, "reset", "%u", -1u /* any method */);
> -	igt_drop_caches_set(fd,
> -			    /* cancel everything */
> -			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> -			    /* cleanup */
> -			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> +	if (is_xe_device(fd)) {
> +		xe_force_gt_reset_all(fd);

It looks quite invasive, we will loose the guc log ?

> +		sleep(1);

How the 1 is selected? Is it reliable enough ?

> +	} else {
> +		igt_params_set(fd, "reset", "%u", -1u /* any method */);
> +		igt_drop_caches_set(fd,
> +				    /* cancel everything */
> +				    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> +				    /* cleanup */
> +				    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> +	}
>   }
>   
>   static void cancel_work_at_exit(int sig)
> @@ -716,11 +722,11 @@ int drm_open_driver(int chipset)
>   	igt_skip_on_f(fd<0, "No known gpu found for chipset flags 0x%u (%s)\n",
>   		      chipset, chipset_to_str(chipset));
>   
> -	/* For i915, at least, we ensure that the driver is idle before
> +	/* For i915 & xe, at least, we ensure that the driver is idle before
>   	 * starting a test and we install an exit handler to wait until
>   	 * idle before quitting.
>   	 */
> -	if (is_i915_device(fd)) {
> +	if (is_intel_device(fd)) {
>   		if (__sync_fetch_and_add(&open_count, 1) == 0) {
>   			__cancel_work_at_exit(fd);
>   			at_exit_drm_fd = drm_reopen_driver(fd);
> @@ -836,7 +842,7 @@ int drm_open_driver_render(int chipset)
>   		return fd;
>   
>   	at_exit_drm_render_fd = drm_reopen_driver(fd);
> -	if (chipset & DRIVER_INTEL) {
> +	if (chipset & (DRIVER_INTEL | DRIVER_XE)) {
>   		__cancel_work_at_exit(fd);
>   		igt_install_exit_handler(cancel_work_at_exit_render);
>   	}
