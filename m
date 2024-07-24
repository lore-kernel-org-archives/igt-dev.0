Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D8EC3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 09:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE8710E580;
	Wed, 24 Jul 2024 09:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXf+LNw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F7210E5DF
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721812443; x=1753348443;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6axVhLdPiMVEIxluTAHQ3exV/adUzQVgrh4YZA8e9cU=;
 b=hXf+LNw9yfj0q7V70gEEEreQXWaEUPetbNw0HZ0ae4OVRP15v93IVGC2
 /PlDE9n1Rcm9HTFoL09gd3TRJUoFNc63C6Ni0UMsOyey1ZBFCw+FitcHI
 3F3unZeh6s2wFzikZ/XV5exxTycZ2ufxdX6ZJSYbMmCStLI/hJ22jGGpb
 yBzCPb+ZYirw8g4w5NS+qnKX+heEaC9NbAs9IvsqeBBn5X7ivR5g6K0H/
 57ynwtaQAlR5dyqI/kuJSE5D4F5ZyXkd6+2VbgRTlwcaxo2maAaOaT8BW
 ozZynBy+MIeJG1he3cvdBXxjjqZk3NQZ4yGaLcUd5uECbPSIe6SwNdr4l g==;
X-CSE-ConnectionGUID: k78AIToUQImef9jRTxluLQ==
X-CSE-MsgGUID: nosH5cLoTeqFzk3M5ewujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19331600"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19331600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 02:13:52 -0700
X-CSE-ConnectionGUID: fNWLLwL7QB+jNNwcidtQhQ==
X-CSE-MsgGUID: /2EzuLIYQa6JqLn63d6+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="52756097"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 02:13:50 -0700
Date: Wed, 24 Jul 2024 11:13:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [i-g-t 1/2] lib/drmtest: Ensure the XE driver is idle before
 starting a test
Message-ID: <20240724091334.vqyhnmd3ci4fzksi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
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
On 2024-07-24 at 12:35:43 +0530, Bhanuprakash Modem wrote:
> Re-use the existing i915's exit handler to make sure that the
> XE driver is idle before starting the subtest.
> 
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
s/Fixes/Closes/

with that
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/drmtest.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index f8810da43..8851029a7 100644
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
> @@ -663,12 +664,16 @@ static void __cancel_work_at_exit(int fd)
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
> @@ -716,11 +721,11 @@ int drm_open_driver(int chipset)
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
> -- 
> 2.43.2
> 
