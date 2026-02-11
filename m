Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93FDE9E305
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 13:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FDF10E124;
	Wed, 11 Feb 2026 13:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDwzl/8a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCEB10E124
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770816730; x=1802352730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o0koq7HmgOXJ/9MrIqaIpkQwQOcH0E7PcmMUUNFQB7w=;
 b=IDwzl/8aMHXlmLxbplTfafZMSjCYfr3+hTx7WJag2fj9aZUbuzJB1M9/
 HDzP35SYJeM2pAIexPHv9H+OoI0iIfDVfrx74jdGlsrGPI9bDwKIveAWy
 Il1i3ZGGmCZ6j5y9tvW7R/+auczNbC7WvSJwkyNdl3Z40Amm+5pBxzyhc
 Cpew2k8VJIraXojA9qss4YiIReooH0iL/PioqQFutQGhZTVDsLAkG2vW/
 Bp26cyFegSI2/mi260+sky/a6snfcOjS77TdRCBs6klW+oLCeqLDBMxpT
 Zb5Zme/AQrMMV7H7GriIOuKa20y6p2HLmPMTugqJsuNaCvfSy/1RSIXir g==;
X-CSE-ConnectionGUID: 8X0rHHslQ2afd9/Jcxba7g==
X-CSE-MsgGUID: NeBTSjh6S9yLtmC1bce4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83064242"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83064242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:32:09 -0800
X-CSE-ConnectionGUID: RuFdU0/iQ8qO5oCGOcRQ9A==
X-CSE-MsgGUID: DePGjdUUS76suCVDKeU1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211281213"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:32:08 -0800
Date: Wed, 11 Feb 2026 15:32:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: use for_each_crtc() for iterating
 CRTCs
Message-ID: <aYyE1aTDfiZUCgA-@intel.com>
References: <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
 <20260211091635.1075060-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211091635.1075060-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Feb 11, 2026 at 11:16:35AM +0200, Jani Nikula wrote:
> The loop still figures out the pipe mask, keep using pipe here. The main
> thing is not using the loop index as pipe, as that is subject to change
> in the future.
> 
> v2: 1 << pipe (Ville)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  lib/igt_kms.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c4be889dc696..68d61472d9e8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3622,16 +3622,14 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
>  {
>  	unsigned full_pipe_mask = 0, assigned_pipes = 0;
>  	igt_output_t *output;
> +	igt_crtc_t *crtc;
>  	int i, j;
>  
>  	memset(chosen_outputs, 0,
>  	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
>  
> -	for (i = 0; i < igt_display_n_crtcs(display); i++) {
> -		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
> -		if (crtc->valid)
> -			full_pipe_mask |= (1 << i);
> -	}
> +	for_each_crtc(display, crtc)
> +		full_pipe_mask |= 1 << crtc->pipe;
>  
>  	/*
>  	 * Try to assign all outputs to the first available CRTC for
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
