Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF0AC3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 15:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A64F10E88B;
	Thu, 25 Jul 2024 15:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ms0WShCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8510E88D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721923071; x=1753459071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8DoJBMA8B9UvKfRM1ouu8TegJltalzTwo8QirnkDaRM=;
 b=ms0WShCUFz2vQ3qSVcuGEAwydChvpnSS6UPwJPlv76+05Y4Ynr44k7/A
 mEyZeeq8vFD5nTwhUJK9+1FPirn2G5KekOGMWfW8IknvfpQj7qGAOuRsz
 h2wTtC/MxUui0F3xbdcNQC5PahfTSn1dR1Et6RMP5vQvcXr7PyHJXEL98
 oBkr8Mpte5PAkba/cq7t7XmiOIDSIRPpimMKyuBXaISQs7ZHowzVxm0Ho
 lOtNX/0XTj8WqqkNRLhJwqFrhTfVU/GNL2C6UDoOy7meplx5OXO3dk0bG
 geAeKJ0HJ28DLcWYxhWWpXwffUkjtbhNEYNaH4BQOEh+PrJA/7lDpTTqD Q==;
X-CSE-ConnectionGUID: XdjUxdTbSBGYP3lAqw52vA==
X-CSE-MsgGUID: Lp+NOMlJSQ29XlaUwIH18A==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22583734"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="22583734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:57:51 -0700
X-CSE-ConnectionGUID: 3I3aKr1QRfegMM9SaLAL1w==
X-CSE-MsgGUID: Ssm+aeo4Sw2RfsYe6lgbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52848932"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 08:57:49 -0700
Date: Thu, 25 Jul 2024 17:57:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [i-g-t V2 1/2] lib/drmtest: Ensure the XE driver is idle before
 starting a test
Message-ID: <20240725155734.cy5uckcqu2vq32ls@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
 <20240725041803.1764959-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240725041803.1764959-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-07-25 at 09:48:03 +0530, Bhanuprakash Modem wrote:
> Re-use the existing i915's exit handler to make sure that the
> XE driver is idle before starting the subtest.
> 
> V2:
>  - Add some delay after attempting the gt reset
>  - Cover drm render device path too
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

+Cc Marcin

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please remove my r-b after changes were done in v2.

> ---
>  lib/drmtest.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index f8810da43..90885ec36 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -64,6 +64,7 @@
>  #include "intel_reg.h"
>  #include "ioctl_wrappers.h"
>  #include "igt_dummyload.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_query.h"
>  
>  /**
> @@ -663,12 +664,17 @@ static void __cancel_work_at_exit(int fd)
>  {
>  	igt_terminate_spins(); /* for older kernels */
>  
> -	igt_params_set(fd, "reset", "%u", -1u /* any method */);
> -	igt_drop_caches_set(fd,
> -			    /* cancel everything */
> -			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> -			    /* cleanup */
> -			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> +	if (is_xe_device(fd)) {
> +		xe_force_gt_reset_all(fd);
> +		sleep(1);

Please remove r-b and a-b tags when you make some changes to code.

imho we should discuss it more to see the problem and
think how to solve it.

Regards,
Kamil

> +	} else {
> +		igt_params_set(fd, "reset", "%u", -1u /* any method */);
> +		igt_drop_caches_set(fd,
> +				    /* cancel everything */
> +				    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> +				    /* cleanup */
> +				    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> +	}
>  }
>  
>  static void cancel_work_at_exit(int sig)
> @@ -716,11 +722,11 @@ int drm_open_driver(int chipset)
>  	igt_skip_on_f(fd<0, "No known gpu found for chipset flags 0x%u (%s)\n",
>  		      chipset, chipset_to_str(chipset));
>  
> -	/* For i915, at least, we ensure that the driver is idle before
> +	/* For i915 & xe, at least, we ensure that the driver is idle before
>  	 * starting a test and we install an exit handler to wait until
>  	 * idle before quitting.
>  	 */
> -	if (is_i915_device(fd)) {
> +	if (is_intel_device(fd)) {
>  		if (__sync_fetch_and_add(&open_count, 1) == 0) {
>  			__cancel_work_at_exit(fd);
>  			at_exit_drm_fd = drm_reopen_driver(fd);
> @@ -836,7 +842,7 @@ int drm_open_driver_render(int chipset)
>  		return fd;
>  
>  	at_exit_drm_render_fd = drm_reopen_driver(fd);
> -	if (chipset & DRIVER_INTEL) {
> +	if (chipset & (DRIVER_INTEL | DRIVER_XE)) {
>  		__cancel_work_at_exit(fd);
>  		igt_install_exit_handler(cancel_work_at_exit_render);
>  	}
> -- 
> 2.43.2
> 
