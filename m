Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D5C7EE31
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 18:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA21410E8E9;
	Thu, 26 Jun 2025 18:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQKFRILh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6110E8E9
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750962860; x=1782498860;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iJdqFrHDooiXERcIKKSmCZ+iYbPXaeP92P6jlVP6r7w=;
 b=nQKFRILhaea5iaPL7w7/t+Ud6VCHUU2EKfFNKeQbZdmpe0imU63sXgEn
 lHjgYA9g6x329xxd1eQjCH5eAmPl6Qt95qSDX4ffEsLpbq/UDdwpj1XdS
 HlNbp1dBbfQDANT4blhG6cFtTy/9aTraf44lDL0rl5mIhxJzo02hxLKFL
 xqMyv02bgMRK/PE5l+LPW4FAlilyopW61EOA+/0zRSKcYMCL4knxRLbJs
 Cfl1xnLweSI+CuBIb+e+jVisPJ26A4aMY3dYKFKXl6Z5dRw5BE6L0R7mf
 fZ0lwlIZPD5OfRRKWY4t6HAXaNKlysEqs1QC2kBx1NSW/LI8SNJbUVdm5 w==;
X-CSE-ConnectionGUID: +dv065PFT6GN1egOJ1xYxQ==
X-CSE-MsgGUID: R0YSClztTtOsTzqqsVNN3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53399956"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53399956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:34:20 -0700
X-CSE-ConnectionGUID: dPts5LyiRrGNygX3Ba79zw==
X-CSE-MsgGUID: 20ldkwLoRwOyq3YNaaWvtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157163845"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:34:19 -0700
Date: Thu, 26 Jun 2025 20:34:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_pipe_stress.c: Add support for
 additional tiling formats
Message-ID: <20250626183326.at27k6e2y5vlekz7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250626125138.1693732-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626125138.1693732-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-06-26 at 18:21:38 +0530, Swati Sharma wrote:
> Added support for X, Yf, and 4 TILING modifiers to increase coverage
> of buffer format combinations.

small nit about subject, please remove ".c", so it will be:

[PATCH i-g-t] tests/intel/kms_pipe_stress: Add support for additional tiling formats

This could be done at merge time,

Regards,
Kamil

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_pipe_stress.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 296c93b58..7551a5e9c 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -28,15 +28,18 @@
>   * Driver requirement: i915, xe
>   * Mega feature: General Display Features
>   *
> - * SUBTEST: stress-xrgb8888-untiled
> + * SUBTEST: stress-xrgb8888-%s
>   * Description:
>   *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
> - *   and resolution.
> + *   and resolution and %arg[1] modifier.
>   *
> - * SUBTEST: stress-xrgb8888-ytiled
> - * Description:
> - *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
> - *   and resolution.
> + * arg[1]:
> + *
> + * @4tiled:            TILE-4 modifier
> + * @xtiled:            TILE-X modifier
> + * @ytiled:            TILE-Y modifier
> + * @yftiled:           TILE-YF modifier
> + * @untiled:           LINEAR modifier
>   */
>  
>  IGT_TEST_DESCRIPTION("Stress test how gpu and cpu behaves if maximum amount of planes, "
> @@ -59,10 +62,13 @@ static const uint32_t formats[N_FORMATS] = {
>  	DRM_FORMAT_XRGB8888,
>  };
>  
> -#define N_TILING_METHODS 2
> +#define N_TILING_METHODS 5
>  static const uint64_t tilings[N_TILING_METHODS] = {
>  	DRM_FORMAT_MOD_LINEAR,
> +	I915_FORMAT_MOD_X_TILED,
>  	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_Yf_TILED,
> +	I915_FORMAT_MOD_4_TILED,
>  };
>  
>  static const char *format_str(int format_index)
> @@ -88,6 +94,10 @@ static const char *tiling_str(int tiling_index)
>  		return "xtiled";
>  	case I915_FORMAT_MOD_Y_TILED:
>  		return "ytiled";
> +	case I915_FORMAT_MOD_Yf_TILED:
> +		return "yftiled";
> +	case I915_FORMAT_MOD_4_TILED:
> +		return "4tiled";
>  	default:
>  		igt_assert(false);
>  	}
> -- 
> 2.25.1
> 
