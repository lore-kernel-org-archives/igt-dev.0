Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA8CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 19:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DC810E14E;
	Wed,  8 Oct 2025 19:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baq3Gf4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8A10E14E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759953447; x=1791489447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pxAf6K6lFHp23i9jmWf0tVMsSc6W2lsxsTQ6T7Y1y5E=;
 b=baq3Gf4Ip8YSQCxAEca2xZ3xAKtYc/5Ld8IHmKMN2gRvrFO+D9bkbj7e
 HBxpn4T19SFOjS/K0095HUd9Nq+cZgLlbyieAQP/YgXtFo+aadrRhSnPK
 StiUdySUO3b95TFDpYDIFGOffTKgbkC7yJxBoiv+3j1uFdf+ArqR7X1bB
 GlffgR1yOoSTJFBVER2lm4QWBCA5QuDRJHf/EXyLVdW6Wr1zWFgCSiTgc
 mea1llA2LnFAaHvI4IpX8dfsh7SIVdPaoovCD/G5SXrmhc1dHCWG5WaJg
 3ZbRJ0sdN7TwQy+6hSSazcxkmPFtUIEbnkswcbbXnsogzsp0XcIuU9gu9 w==;
X-CSE-ConnectionGUID: N35qnuvSQviai5rTfRDaBQ==
X-CSE-MsgGUID: MZKO8LvnTfqbgzWtUdeDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62203123"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62203123"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:57:27 -0700
X-CSE-ConnectionGUID: eS3UdQ57T4yrNydBcv6P9Q==
X-CSE-MsgGUID: /yVRoyFyQ9iYFTQ+HcvX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="179644770"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:57:25 -0700
Date: Wed, 8 Oct 2025 22:57:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 pranay.samala@intel.com
Subject: Re: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
Message-ID: <aObCIXt0HPVWwl3n@intel.com>
References: <20251008152540.1556189-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008152540.1556189-1-jeevan.b@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Oct 08, 2025 at 08:55:40PM +0530, Jeevan B wrote:
> For simulation environment, we can reduce execution time
> by running test only with basic tiling combinations.
> 
> v2: Add helper to check basic tiling support.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_flip_tiling.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index ff9ad1229..024421b58 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -84,6 +84,13 @@ static int try_commit(igt_display_t *display)
>  				       COMMIT_ATOMIC : COMMIT_LEGACY);
>  }
>  
> +static bool is_allowed_modifier(uint64_t mod)

That function name and implementation is extremely confusing.
Why are these allowed and nothing else? Nothing here tells me
any of that.

> +{
> +	return mod == DRM_FORMAT_MOD_LINEAR ||
> +	       mod == I915_FORMAT_MOD_4_TILED ||
> +	       mod == I915_FORMAT_MOD_X_TILED;
> +}
> +
>  static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
>  {
>  	uint64_t timeout_ns;
> @@ -216,6 +223,7 @@ igt_main
>  	igt_describe("Check pageflip between modifiers");
>  	igt_subtest_with_dynamic("flip-change-tiling") {
>  		enum pipe pipe;
> +		bool run_in_simulation = igt_run_in_simulation();
>  
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>  			igt_plane_t *plane;
> @@ -242,6 +250,11 @@ igt_main
>  					if (plane->formats[j] != data.testformat)
>  						continue;
>  
> +					if (run_in_simulation &&
> +					    (!is_allowed_modifier(plane->modifiers[i]) ||
> +					     !is_allowed_modifier(plane->modifiers[j])))
> +						continue;
> +
>  					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>  						      kmstest_pipe_name(pipe),
>  						      igt_output_name(output),
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
