Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9385FC02198
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 15:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63A10E888;
	Thu,  6 Feb 2025 15:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8mAx2IO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BD710E885
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738854258; x=1770390258;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NlHC71geyQ+HEF7F0wIL0altVEWpjmfGgkzsarJUXvs=;
 b=g8mAx2IOYFbIYeqFQUKxDFk5qVR7+rIZ2uO5OMQnvPzhiHCnLnjTHN/i
 Ps/ZiFx90+c612yzTwW9jWvMwyzT0cTwF2YEy/bu4BHLbDdOGf50iUI60
 xSd2AcHbeXNs7eVptJM6l5NsPrA3vouBYurFjyrA8oynOLsV+g5FhBqPA
 tlKGrDWSSSSfafvoLPfyvv5ivPzPKIHeIJDLTZ+rRqtKoUGeN6yI0lQPP
 1FckrVaFP395okUKEHE58IieTxTHQwUKm9TghY9JnuwvZrxC1xaVcpR9E
 79NINOI6HZjj0C7HyOPBRUyRuAi5f86XTKH5v/Fbd1JGjqwmPDzRbxEmx Q==;
X-CSE-ConnectionGUID: h1paRIKpSf+o8odoNRcaMw==
X-CSE-MsgGUID: XmgDWC95S/Ou2AcQ3AGEEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43119644"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43119644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:04:17 -0800
X-CSE-ConnectionGUID: yX6F9wX5SQizg5mIh2Y9xw==
X-CSE-MsgGUID: IHIo9eVoSBGpLyP/MFvL4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111426307"
Received: from pnass-mobl.ger.corp.intel.com (HELO [10.245.112.60])
 ([10.245.112.60])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:04:16 -0800
Message-ID: <c1781020-7632-43ad-a3b5-1d2d71aaac32@linux.intel.com>
Date: Thu, 6 Feb 2025 16:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Stop unloading drm
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250205030948.1965423-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250205030948.1965423-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Lucas,

My nits are not blockers to your patch being merged.

On 05.02.2025 04:07, Lucas De Marchi wrote:
> When testing i915, if there's another driver present, unloading i915 may
> cause the other driver to unload and let developers chasing ghosts when
> they think it was caused by i915.
> 
> Hopefully fix the ATSM testing where AST driver is also bound to a
> a device.

Maybe a sentence about intel-gtt?

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13292
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> After this change, running i915_module_load@reload doesn't cause ast to
> be unloaded, but I couldn't check it really fixes the issue since I
> couldn't reproduce it.
> 
>  lib/igt_kmod.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index d154701c6..524c1a632 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -690,7 +690,6 @@ int igt_kmod_unbind(const char *mod_name)
>   * igt_intel_driver_unload:
>   *
>   * Unloads an Intel driver and its dependencies.
Maybe change this to reflect what it is doing as the dependencies
bit may no longer apply.

> - *
>   */
>  int
>  igt_intel_driver_unload(const char *driver)
> @@ -709,12 +708,6 @@ igt_intel_driver_unload(const char *driver)
>  	}
>  	free(who);
>  
> -	if (igt_kmod_is_loaded("intel-gtt"))
> -		igt_kmod_unload("intel-gtt");
> -
> -	igt_kmod_unload("drm_kms_helper");
> -	igt_kmod_unload("drm");
> -
>  	if (igt_kmod_is_loaded(driver)) {
>  		igt_warn("%s.ko still loaded!\n", driver);
>  		return -EBUSY;

