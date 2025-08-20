Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D25CA0EE4
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 14:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E545710E73D;
	Wed, 20 Aug 2025 14:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELj/UCqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE46B10E73D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755698418; x=1787234418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N0elbA2j5HK8eCIvvEOne9NBWPlL9zgijvbyGOpfFSQ=;
 b=ELj/UCqM8+xb3TEkFqN6OBuChMfZh1DocKW8WDEUVejJ+UbRtiyOVS1o
 uo7KdLXlsX8O4VFsSq0+zgLQbyX8djg2DM8mAGpAvEVaapCjjgvhqBuYi
 1iLvvcmQPOg+BZIjmOx25fbIyIJKwxLE5QHmBvMSDvI2KluuuwVd/CwAw
 lP9a5wIoq6V/GoMbvlX7VfVuS29eLGTVRuZuwWUMVBn9cdyp/4/n2atiB
 OCx9dzB9CB74AQzdnV2Q/3qO9HPbX+c8nWNJ66rUDCFdUYAe2tw3FQdBZ
 p+TKJzYb0o+FnN8bYGhj2szzZE960Ta8ld+gEAwrRw7GesTa6ZNCVDH9A A==;
X-CSE-ConnectionGUID: Kp8qol/7QoCRLiFsDZHyOQ==
X-CSE-MsgGUID: Y8F5pzDVQ6WBP3BTAdYVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57881331"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57881331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 07:00:17 -0700
X-CSE-ConnectionGUID: L1fjrlqKTjexo2UjN0A7jw==
X-CSE-MsgGUID: faUXBgIxS/+ciym5HKeG6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172393311"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:00:16 -0700
Date: Wed, 20 Aug 2025 16:00:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com,
 pranay.samala@intel.com
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar
 and packed YUV formats
Message-ID: <20250820140013.hupfwi6v5iku6hmn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com,
 pranay.samala@intel.com
References: <20250716092036.301862-1-ramanaidu.naladala@intel.com>
 <20250716092036.301862-2-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716092036.301862-2-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-07-16 at 14:50:35 +0530, Naladala Ramanaidu wrote:

in subject there is 'v1' while it is 'v2'? Or am I missing something?

Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_fb: Add helpers to identify planar
> Add new helper logic to distinguish between planar/semi-planar and
> packed YUV formats. This classification enables more efficient test
> coverage by reducing iterations in IGT, allowing tests to focus on
> relevant format groups based on their memory layout.

Please add information here about what changed, for example:

v2: add helper functions (Santosh)
> 

This is following Santosh suggestion so add here to Cc:

Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  lib/igt_fb.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_fb.h |  2 ++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 9fc1bfc65..f68aeaf42 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -5044,6 +5044,63 @@ bool igt_format_is_yuv(uint32_t drm_format)
>  	}
>  }
>  
> +/**
> + * igt_format_is_planaryuv:

Add '_' before youv, so it will be:

+ * igt_format_is_planar_yuv:

> + * @drm_format: drm fourcc
> + *
> + * This functions returns if @drm_format is planar/semi-planar YUV formats.
> + */
> +
> +bool igt_format_is_planaryuv(uint32_t drm_format)

Same here:

+bool igt_format_is_planar_yuv(uint32_t drm_format)

> +{
> +	switch (drm_format) {
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * igt_format_is_yuv:

Incorrect, function below has other name.

> + * @drm_format: drm fourcc
> + *
> + * This functions returns if @drm_format is packed YUV formats.
> + */
> +
> +bool igt_format_is_packedyuv(uint32_t drm_format)

Same here:
+bool igt_format_is_packed_yuv(uint32_t drm_format)

> +{
> +	switch (drm_format) {
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
> +	case DRM_FORMAT_XVYU2101010:
> +	case DRM_FORMAT_XVYU12_16161616:
> +	case DRM_FORMAT_XVYU16161616:
> +	case DRM_FORMAT_Y410:
> +	case DRM_FORMAT_Y412:
> +	case DRM_FORMAT_Y416:
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_YVYU:
> +	case DRM_FORMAT_UYVY:
> +	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_XYUV8888:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /**
>   * igt_format_is_fp16
>   * @drm_format: drm fourcc
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index d5aa1e88a..ace02a960 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -220,6 +220,8 @@ const char *igt_format_str(uint32_t drm_format);
>  bool igt_fb_supported_format(uint32_t drm_format);
>  bool igt_format_is_yuv(uint32_t drm_format);
>  bool igt_format_is_yuv_semiplanar(uint32_t format);
> +bool igt_format_is_planaryuv(uint32_t drm_format);
> +bool igt_format_is_packedyuv(uint32_t drm_format);

Same here, add '_' before 'yuv'.

Regards,
Kamil

>  
>  uint32_t igt_drm_format_str_to_format(const char *drm_format);
>  
> -- 
> 2.43.0
> 
