Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9033C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 10:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602C210E492;
	Thu,  9 May 2024 10:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz3julTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCE510E492
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715249532; x=1746785532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=50kkTxLwBml5Psf5SWfZ22zg/D0eMYbk1dmhDhiVZkA=;
 b=Yz3julTC5YVvDsu576bcWkr+H9o9csnZ0yfs7s1q2m/uhTumE8E1G9xu
 v9YPIXJFDB9EvTtuE4CCIIJ8nGcPlRi6W+BOc6SFezbTBaLo6CYV3ccoj
 0VRkrD/L/dP2f+sN2K3XM/dkX5Jo+0QZjKtEc868Jnz+Ti7u4PYbsXgBi
 z6Rat5MKJo+mFBMQN/riQTegc5FSLgQ3a+nBHtrNnOnTIcoS8/+03WMFt
 NvewutM5NUxvJTDTOhzGsyQp4Vn0z8SzRF3tVcP0VMMsenzJUfzi0EdxP
 r48VSdMhXURe/Ee909Q3jVAI6v4a+TN+MNHA7E0Uy4r4K2jdJio8oMMzw g==;
X-CSE-ConnectionGUID: z4r+alC0QxScHgE1PjuS9Q==
X-CSE-MsgGUID: O2kL2/HKS7qa3NjwOBHpaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28643019"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="28643019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:12:11 -0700
X-CSE-ConnectionGUID: 9JbAPd66SUCT0pTJ/z0lPQ==
X-CSE-MsgGUID: IwqECL6NStuGBa7ta9BFXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="29145323"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:12:09 -0700
Date: Thu, 9 May 2024 12:12:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 2/6] lib/igt_fb: make blt_compression_format
 function more readable
Message-ID: <20240509101206.mjr4hhsxrxasgyei@zkempczy-mobl2>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430162939.272990-3-juhapekka.heikkila@gmail.com>
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

On Tue, Apr 30, 2024 at 07:29:35PM +0300, Juha-Pekka Heikkila wrote:
> Intel blitter compression format getter sanitizing.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 63 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 37 insertions(+), 26 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5df5cb08f..707eb0a1e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2825,6 +2825,32 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
>  #define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
>  			  x.compression_type == COMPRESSION_TYPE_MEDIA)
>  
> +const struct {
> +	uint32_t key;
> +	enum blt_compression_type type;
> +	uint32_t return_value;
> +} compression_mappings[] = {
> +	{ CD_32bit, COMPRESSION_TYPE_3D, 8 },
> +	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
> +	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
> +	{ DRM_FORMAT_NV12, COMPRESSION_TYPE_MEDIA, 9 },
> +	{ DRM_FORMAT_P010, COMPRESSION_TYPE_MEDIA, 8 },
> +	{ DRM_FORMAT_P012, COMPRESSION_TYPE_MEDIA, 8 },
> +	{ DRM_FORMAT_P016, COMPRESSION_TYPE_MEDIA, 8 },
> +};
> +
> +static uint32_t get_compression_return_value(uint32_t key, enum  blt_compression_type type)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(compression_mappings); i++) {
> +		if (compression_mappings[i].key == key &&
> +		    compression_mappings[i].type == type) {
> +			return compression_mappings[i].return_value;
> +		}
> +	}
> +	igt_assert_f(0, "Unknown compression type or format\n");

I would add blank line here.

> +	return 0; // This line is to avoid compilation warnings, it will not be reached.

Please use /* */ style comment.

With those nits addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +}
> +
>  static uint32_t blt_compression_format(struct blt_copy_data *blt,
>  				       const struct igt_fb *fb)
>  {
> @@ -2832,33 +2858,18 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
>  	    blt->dst.compression == COMPRESSION_DISABLED)
>  		return 0;
>  
> -	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst)) {
> -		switch (blt->color_depth) {
> -		case CD_32bit:
> -			return 8;
> -		default:
> -			igt_assert_f(0, "COMPRESSION_TYPE_3D unknown color depth\n");
> -		}
> -	} else if (BLT_TARGET_MC(blt->src)) {
> -		switch (fb->drm_format) {
> -		case DRM_FORMAT_XRGB8888:
> -			return 8;
> -		case DRM_FORMAT_XYUV8888:
> -			return 9;
> -		case DRM_FORMAT_NV12:
> -			return 9;
> -		case DRM_FORMAT_P010:
> -		case DRM_FORMAT_P012:
> -		case DRM_FORMAT_P016:
> -			return 8;
> -		default:
> -			igt_assert_f(0, "COMPRESSION_TYPE_MEDIA unknown format\n");
> -		}
> -	} else if (BLT_TARGET_MC(blt->dst)) {
> +	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst))
> +		return get_compression_return_value(blt->color_depth,
> +						    COMPRESSION_TYPE_3D);
> +
> +	if (BLT_TARGET_MC(blt->src))
> +		return get_compression_return_value(fb->drm_format,
> +						    COMPRESSION_TYPE_MEDIA);
> +
> +	if (BLT_TARGET_MC(blt->dst))
>  		igt_assert_f(0, "Destination compression not supported on mc ccs\n");
> -	} else {
> -		igt_assert_f(0, "unknown compression\n");
> -	}
> +
> +	igt_assert_f(0, "unknown compression\n");
>  }
>  
>  static void blitcopy(const struct igt_fb *dst_fb,
> -- 
> 2.25.1
> 
