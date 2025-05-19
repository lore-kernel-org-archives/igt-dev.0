Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFB5C3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 06:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51D010E17F;
	Mon, 19 May 2025 06:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHyyqpQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09DF10E1F8
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747637886; x=1779173886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=09qPINvZidOQ4h18rlNGqlI4DHNe05dBbcJPmL2eBUQ=;
 b=lHyyqpQbyRjOH+pNZNNwcC09j0ROtM1uFAwXsabGXSL0ZpW3JvkiEjAs
 4fIhxdqz+TaA4FIJ8BOTVKth7pSQpbhnvusvmDoyAwlyA90or3rdgmcAv
 cVBqyOfqcttDkZ9dt192XVLdFv1ra0OYm+EZa15ZW5QJ7cI7tS7oFtttn
 y8dDFAdGpyIr/6kwzuc2A/xN+kVnS6Iopvi26441VeeHBNChxW9lPJnSe
 FpABe2k+LjU1LR0ptFP55sJdrM8sDf8qh+48J/iZLYDSCl1JFHhWAHVi/
 sJYBi9IXoOoEoavHfpudgSXFqSkjJbFKJiWmC3sf7LFqBywpSfaNOuVRE Q==;
X-CSE-ConnectionGUID: x9D1oO76Q8S9fGxG6CLlkw==
X-CSE-MsgGUID: cB2mQomkS4ejmuSdi2QhMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49506524"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49506524"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 23:58:06 -0700
X-CSE-ConnectionGUID: +K+KrXspRgWkkpfiO9jyXw==
X-CSE-MsgGUID: k1YCRGAPTBSsM0lv3e4naA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="170319793"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 23:58:04 -0700
Date: Mon, 19 May 2025 08:58:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com, 
 sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v6 08/14] lib/xe/xe_spin: Avoid pthread_cancel use
 by introducing an exit flag
Message-ID: <32xzm5lnf3qx5gf2kofvphilqjret26mul4dkhdbii55pqylc7@y5dqa56xnfht>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-9-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516160551.58760-9-jeevaka.badrappan@intel.com>
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

On Fri, May 16, 2025 at 04:05:45PM +0000, Jeevaka Prabu Badrappan wrote:
> Android build fails due to pthread_cancel unavailability.
> Replace pthread_cancel with thread exit based on an exit flag.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/xe/xe_spin.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index a92903b6b..23f1dfbfd 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <string.h>
> +#include <sys/timerfd.h>
>  
>  #include "drmtest.h"
>  #include "igt.h"
> @@ -264,7 +265,16 @@ void xe_spin_free(int fd, struct igt_spin *spin)
>  	igt_assert(spin->driver == INTEL_DRIVER_XE);
>  
>  	if (spin->timerfd >= 0) {
> +#ifdef ANDROID
> +		struct itimerspec its;
> +
> +		memset(&its, 0, sizeof(its));
> +		its.it_value.tv_sec = 0;
> +		its.it_value.tv_nsec = 1;
> +		timerfd_settime(spin->timerfd, 0, &its, NULL);
> +#else
>  		pthread_cancel(spin->timer_thread);
> +#endif
>  		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
>  		close(spin->timerfd);
>  	}
> -- 
> 2.49.0
> 
