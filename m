Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76052C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 14:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F87710EBAB;
	Fri, 18 Apr 2025 14:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUcl4BoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8F10EBAB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744988110; x=1776524110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SMrrljlhi9gJ6WBhoR4TtdFCpg2KAiEG5L45Usg01II=;
 b=ZUcl4BoBbjBWyE2sEUNsWQq4hro4yZfNU20tUpBcA9PrrSLTg4S5tOfr
 xwLUrWUoP70SWdLrO7JSej9QNEetlvtLqm5plpqZ44qSx9hHot2jJ9RNQ
 JQ0FuHTgU7hTzM0c6MjLJE4vZzFlM48koF9iCwewDVZQkbPsEsiIqSuhn
 Ed3UpN2/msklRSEHmz3yJxfHJMEWv22dcUeoZBWCBNGahUlmn9ceu15MU
 Lz4mppqF+VHdvzK+6N8tlD5DYAJzL/0piK1ptJyVBhd5APgxZRa5EkJxt
 qtd3St7vq/TkEiTzXEIjKGuR34V5mJzVRYgBTMq6ksGZpZcDvwCzc+HSH g==;
X-CSE-ConnectionGUID: c5GCHJVeTWWygUsXmEYFww==
X-CSE-MsgGUID: DH4ik2AkSQm1zPI0p6GNJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="69109450"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="69109450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 07:55:04 -0700
X-CSE-ConnectionGUID: qfOmnwP5Q1yyrJUECFO0Ag==
X-CSE-MsgGUID: fYFZnUCFQ7Ofn/T7DpBgjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="162096166"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 07:55:02 -0700
Date: Fri, 18 Apr 2025 16:54:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pxp: Terminate PXP on exit
Message-ID: <20250418145447.h4kpkferveojdrvx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250417235720.1379479-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417235720.1379479-1-daniele.ceraolospurio@intel.com>
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
On 2025-04-17 at 16:57:19 -0700, Daniele Ceraolo Spurio wrote:
> Most of out tests expect to start their execution from a clean GPU state.
> However, the PXP tests currently leave a PXP session running when they
> complete, so follow up tests will not have a clean starting state; given
> that PXP can impact the timing of some operations (e.g. suspend/resume),

What kind of problems could occur? Is it longer wakeup or refusing
to enter sleep?

> this could pollute the results of those tests. Therefore, let's make
> sure that PXP is de-activated before we exit.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/intel/xe_pxp.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 458d32322..3442396b2 100644
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
> @@ -1151,6 +1165,7 @@ igt_main
>  		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
>  		pxp_supported = is_pxp_hw_supported(xe_fd);
>  		res = drmModeGetResources(xe_fd);
> +		igt_install_exit_handler(exit_handler);
>  	}
>  
>  	igt_subtest_group {
> @@ -1213,8 +1228,6 @@ igt_main
>  		}
>  	}
>  
> -	igt_fixture {
> +	igt_fixture
>  		drmModeFreeResources(res);
> -		close(xe_fd);

Looks like you are fixing a bug here, it should be
drm_close_driver(xe_fd);

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> -	}
>  }
> -- 
> 2.43.0
> 
