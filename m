Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294EFCA1013
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 15:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B444C10E1F8;
	Thu, 18 Sep 2025 15:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADcHPtM7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B2210E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758209882; x=1789745882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jElVRUu8RD+JyUi9K7p8UbHprNRruYigIgjtm1aGJAE=;
 b=ADcHPtM7ESUb8LYNeGQsAEFebizBw8k3I/ENHwpq3YNWH3a/rLO8Vwt3
 qWoq10thkcOrkrqd3XdxTOIjQ/PtRB5qljon3MNoCZOX1FcoppHZD4vKm
 YpKE+9L2O8Dc3VD6GmqX2HxnkV4T4HAfDEqCpseJljY+1TSaLq7ncYErm
 SLZ3ZEHWDwoUDbOIJxnyHcrUUqV55fbxiHMuYnEd8V2u/1POLJrVAkTNl
 T+ofmdE3DbgCLthizN0c4eblkWqbFb+4gMg9AxcH0DCxxRn3o4vd/ESV9
 v1DC/18v8tN/3e09J7TUr14EJ6RTrmQI1vfMyIelZrb7B0pmQB0tUusLU w==;
X-CSE-ConnectionGUID: JMb1/ITXS2a4VFYCSlRHlg==
X-CSE-MsgGUID: 5H9p+6WsSjOXcIwVCNNbGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60600153"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60600153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 08:37:44 -0700
X-CSE-ConnectionGUID: qH8fGGNUTW2akwXXCMgUng==
X-CSE-MsgGUID: c4OoSQarRjm2JVGIs4Oerw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="174690441"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 08:37:43 -0700
Date: Thu, 18 Sep 2025 17:37:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t 1/2] tests/kms_setmode: simplify mode selection by
 removing goto
Message-ID: <20250918153725.5ujsvetggv7kztmx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com
References: <20250917144308.1355953-1-jeevan.b@intel.com>
 <20250917144308.1355953-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917144308.1355953-2-jeevan.b@intel.com>
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

Hi Jeevan,
On 2025-09-17 at 20:13:07 +0530, Jeevan B wrote:
> replaced 'goto found' with early returns in get_mode_for_crtc() and
> added braces around the fallback loop. This makes the logic cleaner
> and easier to follow without changing behavior.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..49fc45043 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -238,8 +238,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  	 */
>  	for (i = 0; i < crtc->connector_count; i++) {
>  		mode = &crtc->cconfs[i].default_mode;
> -		if (crtc_supports_mode(crtc, mode))
> -			goto found;
> +		if (crtc_supports_mode(crtc, mode)) {
> +			*mode_ret = *mode;
> +			return;
> +		}
>  	}
>  
>  	/*
> @@ -248,8 +250,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  	 */
>  	for (i = 0; i < crtc->cconfs[0].connector->count_modes; i++) {
>  		mode = &crtc->cconfs[0].connector->modes[i];
> -		if (crtc_supports_mode(crtc, mode))
> -			goto found;
> +		if (crtc_supports_mode(crtc, mode)) {
> +			*mode_ret = *mode;
> +			return;
> +		}
>  	}
>  
>  	/*
> @@ -258,11 +262,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  	 * scaling etc.
>  	 */
>  	mode = &crtc->cconfs[0].default_mode;
> -	for (i = 1; i < crtc->connector_count; i++)
> +	for (i = 1; i < crtc->connector_count; i++) {
>  		if (crtc->cconfs[i].default_mode.clock < mode->clock)
>  			mode = &crtc->cconfs[i].default_mode;
> -found:
> -	*mode_ret = *mode;
> +	}

You need write to *mode_ret before returning from function:

	for (i = 1; i < crtc->connector_count; i++)
 		if (crtc->cconfs[i].default_mode.clock < mode->clock)
  			mode = &crtc->cconfs[i].default_mode;

	*mode_ret = *mode;

Regards,
Kamil

>  }
>  
>  static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
> -- 
> 2.43.0
> 
