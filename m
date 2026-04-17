Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A061F4368A
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 10:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E310E08C;
	Fri, 17 Apr 2026 10:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhIAlbbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C477410E08C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776422748; x=1807958748;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DQ/lEEgwSiBzFQK+zA/48d1CUUrdkabg0KpIWT+nhQM=;
 b=jhIAlbbZEGL/qO8QobmFg4ns73j++6cchAoPznI3+6wnn56wh+r2eYWp
 ADS3jJ5NQoqi6oAy8VMy7pUblk9OzOxIrJ4G6zB/shlvcXTYH+cX/dzqo
 rZob9fFAN2JvWEca4Q8ffqrbeEWgBicRiC8U8eMFSASYz+UzOpXX1YVgN
 6CkddxTwpmFQBruC0LJ7pulY80cdwm6uSmZ4q/q4JtAoy5LBOpGXupVFl
 7oUdTC6dtnW+0UhD1a9Q10ISBfG8nFMwHafdlzc+MU+6AV5hCu23fvfSi
 Pp+P0fJzJEcBg87Arjjcpb9WWFNrhADWiTghMj/SF4XUInZqZnQ6P6Zod w==;
X-CSE-ConnectionGUID: cgPTL3a9S7ucIjeFlJJ/FA==
X-CSE-MsgGUID: CFbz+ClpS5ODEtm3j43JCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77614132"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77614132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 03:45:47 -0700
X-CSE-ConnectionGUID: 0Qb8jCn9SQy7hBgIdoNbCA==
X-CSE-MsgGUID: YFX5W3jQT6+5vwjyaC+Wkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="227877591"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 03:45:45 -0700
Date: Fri, 17 Apr 2026 12:45:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 1/7] Revert "tests/intel/kms_pm_dc: Ensure eDP
 detection before skipping test"
Message-ID: <20260417104543.edcay3f74xnrmoyl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 Jani Nikula <jani.nikula@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <20260417083506.33404-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260417083506.33404-2-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2026-04-17 at 14:05:00 +0530, Mohammed Thasleem wrote:
> This reverts commit d063ceaeaf2d2d561670945e9e81b8976a16f080.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

As Jani said, this is not compiling, so please fix compilation at first
change and amend a fix. Do this step by step, so bisect should work.

Jani's hint: This should work for your series:

$ git rebase -i origin -x 'ninja -C build'

+cc Jani

Regards,
Kamil 

> ---
>  tests/intel/kms_pm_dc.c | 39 ++++++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 8138933d4..da74a21ce 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -543,38 +543,31 @@ static void test_deep_pkgc_state(data_t *data)
>  	time_t delay;
>  	igt_crtc_t *crtc;
>  	bool pkgc_flag = false;
> -	bool flip = true, edp_found = false;
> +	bool flip = true;
>  
>  	igt_display_t *display = &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output = NULL;
>  	drmModeModeInfo *mode;
>  
> -	for_each_crtc_with_valid_output(display, crtc, output) {
> -		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> -
> -			edp_found = true;
> -			/* Check VRR capabilities before setting up */
> -			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> -			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> -				/*
> -				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> -				 * when KMD allows for such capability.
> -				 */
> -				igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
> -				igt_assert(igt_display_try_commit_atomic(display,
> -									 DRM_MODE_ATOMIC_ALLOW_MODESET,
> -									 NULL) == 0);
> -			}
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the test.\n");
> +		/* Check VRR capabilities before setting up */
> +		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> +		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> +			/*
> +			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> +			 * when KMD allows for such capability.
> +			 */
> +			igt_pipe_set_prop_value(display, pipe,
> +						IGT_CRTC_VRR_ENABLED, false);
> +			igt_assert(igt_display_try_commit_atomic(display,
> +								 DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								 NULL) == 0);
>  			break;
>  		}
>  	}
> -
> -	if (!edp_found) {
> -		igt_skip("No eDP output found, skipping the test.\n");
> -		return;
> -	}
> -
>  	igt_display_reset(display);
>  
>  	igt_output_set_crtc(output, crtc);
> -- 
> 2.43.0
> 
