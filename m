Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609A1C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 11:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1194610E0E2;
	Wed, 30 Apr 2025 11:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ha+2vIG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6F10E0E2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746012602; x=1777548602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GtL3DRH1STL12X2eDwGpYkQo6lAtQP+daJgNdOJPdrk=;
 b=Ha+2vIG+iPRyRgXbXJzMn76V5q+E+fJkkjtIv1f83NMJjqWvPXmIVGAk
 1NSeQxkZLHaUZ2+E0Kci7Mu4QVmQqvekou41a0wB0Gp45g1CcRfYr2Pqp
 4J9gz9VncIFs8Nh7T1IRmCFzM7uxxzzCqefti/6Uau4xGdHc3R7FlbxC4
 QpjAzOomBkZlTctPDs4SGSSIHT/6jQO9txv8sXy3l31kkHeaTZy+RYWaQ
 WOTCIg2FoZybjYzPeI5lHUR6DNYbWwBbXmnUisBZZ9eJjUeOVu87rWKDH
 TLffomD5qjjgvTH8D/Xlzt0xkOiXh/ISIM6VIm23icTzD8fe6+wjtnZOL w==;
X-CSE-ConnectionGUID: vDQnqBF8Te2kHopfL/w8hQ==
X-CSE-MsgGUID: SDBqWI8BRseV6yea/z9chw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51482590"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="51482590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:30:02 -0700
X-CSE-ConnectionGUID: t0Z1uIp8T0Kl4FNdWV9kug==
X-CSE-MsgGUID: rusCG38fT+udRjAiQ50GLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="134615277"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:30:01 -0700
Date: Wed, 30 Apr 2025 13:29:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pxp: Terminate PXP on exit
Message-ID: <20250430112944.bxk5dhdsjgbk4mc2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250429234924.2049502-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429234924.2049502-1-daniele.ceraolospurio@intel.com>
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

Hi Daniele,
On 2025-04-29 at 16:49:24 -0700, Daniele Ceraolo Spurio wrote:
> Most of out tests expect to start their execution from a clean GPU state.
> However, the PXP tests currently leave a PXP session running when they
> complete, so follow up tests will not have a clean starting state; given
> that PXP can impact the timing of some operations (e.g. suspend/resume),
> this could pollute the results of those tests. Therefore, let's make
> sure that PXP is de-activated before we exit.
> 
> While at it, update the fd cleanup to use drm_close_driver() instead
> of close().
> 
> v2: only do the termination if PXP is supported.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com> #v1

My r-b holds, I will merge it soon, thank you for contribution.

Regards,
Kamil

> ---
>  tests/intel/xe_pxp.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 458d32322..9eddc03fc 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -1140,9 +1140,23 @@ static void termination_tests(int fd, bool pxp_supported, drmModeResPtr res,
>  		}
>  }
>  
> +int xe_fd = -1;
> +
> +static void exit_handler(int sig)
> +{
> +	/*
> +	 * PXP can interact with some operations (e.g. suspend/resume), which
> +	 * could impact the behavior of other tests if they unknowingly start
> +	 * when PXP is already active. Therefore, let's make sure PXP is
> +	 * de-activated before we exit.
> +	 */
> +	trigger_termination(xe_fd, PXP_TERMINATION_IRQ);
> +	drm_close_driver(xe_fd);
> +	usleep(50 * 1000); /* give time for the termination to be processed */
> +}
> +
>  igt_main
>  {
> -	int xe_fd = -1;
>  	bool pxp_supported = true;
>  	drmModeResPtr res;
>  
> @@ -1151,6 +1165,8 @@ igt_main
>  		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
>  		pxp_supported = is_pxp_hw_supported(xe_fd);
>  		res = drmModeGetResources(xe_fd);
> +		if (pxp_supported)
> +			igt_install_exit_handler(exit_handler);
>  	}
>  
>  	igt_subtest_group {
> @@ -1215,6 +1231,7 @@ igt_main
>  
>  	igt_fixture {
>  		drmModeFreeResources(res);
> -		close(xe_fd);
> +		if (!pxp_supported)
> +			drm_close_driver(xe_fd);
>  	}
>  }
> -- 
> 2.43.0
> 
