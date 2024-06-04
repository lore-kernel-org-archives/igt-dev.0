Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B882C25B7E
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 07:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239910E3A0;
	Tue,  4 Jun 2024 07:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Op7R5aB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003A710E3A0
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717487320; x=1749023320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XXRnLruSv+xJorgD7I12FAFkndv0t6nWJ1LautGFsOw=;
 b=Op7R5aB+y1wSwua2tcCAYj7P7VLXpJ+HjYHIpov8ymdw8tu9blGUFhI5
 BMKPk2AwLgfFP41ohYGBf2zj2QsUYvzB3Sum/AgTbrzRs68H6ZIFrf5BG
 6NQZYWKipJB3UknKhGf7PfO8WTlHLEK+XHsDm6cOG9F5RXdE9YlXeJdTz
 GD7DFO7q9qKkt8qIEhXpJ+q+7wTwzfT/pzptacVFIjXuY/IpQ17X6odVV
 GqwnNliGd/0yjyLw1VpFfZG588kMaMj4KEOOWfgQMu0c/aLWaEQbT+2So
 p74/KWd7gmoQRLmfoth9CDDJ7wS+khudZFl+7QbAVDaK+jB9XEYtQZ2VV Q==;
X-CSE-ConnectionGUID: Kqxt0VQaS8KKpvehaTUCJg==
X-CSE-MsgGUID: A14UXgh6T7GNVmBN9LD6+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17850560"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="17850560"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:48:39 -0700
X-CSE-ConnectionGUID: cmL5K7b1Tj2jPCFc8LdDJA==
X-CSE-MsgGUID: OByHLpRgSUeEEYKs/vw6XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37138470"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 00:48:36 -0700
Date: Tue, 4 Jun 2024 09:48:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 1/5] lib/igt_fb: make blt_compression_format
 function more readable
Message-ID: <20240604074833.5op622k3quuiheb7@zkempczy-mobl2>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
 <20240530142346.1511811-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530142346.1511811-2-juhapekka.heikkila@gmail.com>
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

On Thu, May 30, 2024 at 05:23:42PM +0300, Juha-Pekka Heikkila wrote:
> Intel blitter compression format getter sanitizing.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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
> +	return 0; // This line is to avoid compilation warnings, it will not be reached.

Keep r-b but please change comment to /* */ style.

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
> 2.43.2
> 
