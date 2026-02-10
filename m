Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8735EB26F3
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 17:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4813510E5E6;
	Tue, 10 Feb 2026 17:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHb7b8FU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7986210E5C7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770745165; x=1802281165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LVuP++I8krTTpRT4BaE2ydAHZAfTNgNQzwvSHhy2hC8=;
 b=KHb7b8FUpqbshidLoMW0cXIW8bjzX9Xox9ff+/kMVMUwwaKMomRsuC6q
 PxFloWl1AgpVoyu86da6R7edQF/gY50fZlimqH01BRl9B69ZgCZci/4mn
 lxyNOSUCkkGC9lWZY/JFCB+pkA8oNU7vG8L2bM0pS66GNKUnR0mVc6gCE
 DhVmLpHMeqrQogLfeHUPPN7xpUbbnNxXSPkbiGho3nzW9zplGqMORc2C5
 e0uogLy4vv3lM5eKqlTFCgyFpoFXU9SqomrUFucugQGhUCK3jjW6P5qUD
 yOuQJ64dvlyxOFvhaD58MjaczrqSZGVripB5YkUfl+vX4WERuFx5/VmzN Q==;
X-CSE-ConnectionGUID: J1lNltx0QRm1pLjLFd6jLQ==
X-CSE-MsgGUID: rJ64uk7fSJGRqrHZU5R/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="59445678"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="59445678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:39:25 -0800
X-CSE-ConnectionGUID: LEuA512XR4yG0Ye01yvJtw==
X-CSE-MsgGUID: JBc07T09TWW4mJOrHKfLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211085546"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:39:24 -0800
Date: Tue, 10 Feb 2026 19:39:21 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/11] lib/igt_kms: use for_each_crtc() for
 iterating CRTCs
Message-ID: <aYttSeO152W8Z-kN@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
 <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
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

On Tue, Feb 10, 2026 at 05:23:48PM +0200, Jani Nikula wrote:
> The loop still figures out the pipe mask, keep using pipe here. The main
> thing is not using the loop index as pipe, as that is subject to change
> in the future.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/igt_kms.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c4be889dc696..63fd8095c551 100644
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
> +		full_pipe_mask |= crtc->pipe;

1 << crtc->pipe

>  
>  	/*
>  	 * Try to assign all outputs to the first available CRTC for
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
