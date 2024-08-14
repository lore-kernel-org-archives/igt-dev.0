Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DD1C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 06:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4708E10E40E;
	Wed, 14 Aug 2024 06:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfI7LQEj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C861510E40E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723618185; x=1755154185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SrgyMmGGG0c2DvGDJ70hrWEdesPe4c4RwTgUQbphD14=;
 b=LfI7LQEjZNnQ6I1iTA0kcUs9XcsHWgKAdn7LiB+oAf/dQ3Fv61yYdeDE
 KRoUXf03Ger8FS92nlvTi/yer+l/mC3p8wWZuJjQKMdcCefq1XI9a6ntF
 tkllg2A9USHvzLucAuH1FwefrJSbBdTvPAyNwLvMzXMlxTo4dPJAfcfGw
 VwCBsFHwAIwmMkTt8KgUCDntYZV+DFy705rYeOq3MUkQbaHtSaaEtGPpE
 VNFB/P4+kRnaog/eUA0ZIibELCVmIpqnLb9hNBcRK/R/zEyuxbuvfb7Z/
 f431DswbZR9rPsaUHGgJ+5wkZUrbvdZe1SV3nPhiXn6SeOen7oQ9ymEkt g==;
X-CSE-ConnectionGUID: +xDDWFl3RCOUno49ZiaWVg==
X-CSE-MsgGUID: +fojGROqRWGcxV8O1elCvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33222231"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="33222231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:49:45 -0700
X-CSE-ConnectionGUID: E7RXHC9yQTSbpOLkAu/H1Q==
X-CSE-MsgGUID: whB86FKMRpGuNpIc0O0eYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="63067639"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.48])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:49:44 -0700
Date: Wed, 14 Aug 2024 08:49:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/igt_fb: add Xe2 ccs modifier support
Message-ID: <20240814064940.ylt42io75dwpkvoz@zkempczy-mobl2>
References: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
 <20240812201124.2013652-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240812201124.2013652-3-juhapekka.heikkila@gmail.com>
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

On Mon, Aug 12, 2024 at 11:11:23PM +0300, Juha-Pekka Heikkila wrote:
> Here is added support for I915_FORMAT_MOD_4_TILED_BMG_CCS and
> I915_FORMAT_MOD_4_TILED_LNL_CCS modifiers for Intel Xe2 hardware.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_fb.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ab162a5b7..50b4ee5a3 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -481,6 +481,8 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
> +	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
> +	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
>  		igt_require_intel(fd);
>  		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
>  			*width_ret = 128;
> @@ -955,8 +957,11 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
>  		size += calc_plane_size(fb, plane);
>  	}
>  
> -	if (is_xe_device(fb->fd))
> +	if (is_xe_device(fb->fd)) {
>  		size = ALIGN(size, xe_get_default_alignment(fb->fd));
> +		if (fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
> +			size = ALIGN(size, SZ_64K);
> +	}
>  
>  	return size;
>  }
> @@ -1020,6 +1025,8 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
>  	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
> +	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
> +	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
>  		return I915_TILING_4;
>  	case I915_FORMAT_MOD_Yf_TILED:
>  	case I915_FORMAT_MOD_Yf_TILED_CCS:
> @@ -2564,7 +2571,9 @@ static bool use_blitter(const struct igt_fb *fb)
>  	if (!blitter_ok(fb))
>  		return false;
>  
> -	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
> +	return fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
> +	       fb->modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS ||
> +	       fb->modifier == I915_FORMAT_MOD_4_TILED ||
>  	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>  	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>  	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
> @@ -5000,6 +5009,8 @@ const char *igt_fb_modifier_name(uint64_t modifier)
>  		return "4";
>  	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
> +	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
> +	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
>  		return "4-rc-ccs";
>  	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
>  	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
> -- 
> 2.45.2
> 
