Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EBEC27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 12:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661BA10E052;
	Fri,  7 Jun 2024 12:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWXwHi2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3B10E052
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717763081; x=1749299081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I7EKB6mhI/rUSk30mT9vtjPs9oIQHq6J59U5gHYj5oY=;
 b=dWXwHi2B+yaAqMMCGs+cJKWEVfapKu/LhbSE76G46eKgcgnUuC4ALlk1
 UvzOCXFHIL2eFdYsKFHRVkwIYri5IrIHKAbL1Z2rxcyx16CleRslFhhDB
 JsYFjC1MXRD4p25iZweBzoV7xsvWeOLU/wbd1vYbTz9h9bQniwuwjcGwz
 9ibROHO6xBcLzsQ5+xCFrVpEPHN2WL6iQ6RehpLdFBAkNBxKHkPNQbrRN
 DRgZr1nbXsYBCfej1i5g9sJYnIROkrXR2dklhphO0tg6ruCi8IlQZigpR
 KBeQMAHJPf3LRFJztcvoHmJ3Hsq1WJXkq00+mXcEAw13U8sALm1zDhiGT Q==;
X-CSE-ConnectionGUID: aWK6b8InSkSLGoCfU+zNvQ==
X-CSE-MsgGUID: ywWUY9e7RIa/jJVv257o/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39880674"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="39880674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:24:41 -0700
X-CSE-ConnectionGUID: SL640ZFOSRSoJ3ckvqOm/g==
X-CSE-MsgGUID: /avUBIjAT6Gg+rsZhl7z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43434508"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:24:39 -0700
Date: Fri, 7 Jun 2024 14:24:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Melanie Lobo <melanie.lobo@intel.com>, vidya.srinivas@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 RGB16161616_64B compressed formats
Message-ID: <20240607122435.3dmfyn4kpuee6jej@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Melanie Lobo <melanie.lobo@intel.com>, vidya.srinivas@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20240606121523.5347-1-melanie.lobo@intel.com>
 <20240606121523.5347-3-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240606121523.5347-3-melanie.lobo@intel.com>
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

Hi Melanie,
On 2024-06-06 at 17:45:23 +0530, Melanie Lobo wrote:

imho subject should be:

[PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add tests for RGB16161616_64B compressed formats

There are also whitespaces error, please use checkpatch.pl
before sending (see CONTRIBUTING.md)

> MTL supports RGB FP16 format which is a binary floating-point computer
> number format that occupies 16 bits in computer memory. In this test
> platform shall render compression in display engine to receive
> RGB FP16 compressed formats.
> 
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/series/124957/
> https://lore.kernel.org/all/20240605055819.9510-1-melanie.lobo@intel.com/
> 
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
> index 7dc07bc8330d..65fd31c5c963 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -96,6 +96,16 @@
>   * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
>   *
> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-%s
> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + * 		clock programming
-----^^^^^^^
Use tabs, then spaces.

> + * Functionality: ccs, scaling, tiling, vblank
> + *
> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-%s
> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + * 		clock programming

Same here.

Regards,
Kamil

> + * Functionality: ccs, scaling, tiling, vblank
> + *
>   * arg[1]:
>   *
>   * @downscaling:        Downscaled
> @@ -345,6 +355,22 @@ const struct {
>  		1.0,
>  		2.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_ARGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_ARGB16161616F,
> +		1.0,
> +		2.0,
> +	},
>  	{
>  		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
>  		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> @@ -529,6 +555,22 @@ const struct {
>  		0.5,
>  		1.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_ARGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_ARGB16161616F,
> +		0.5,
> +		1.0,
> +	},
>  };
>  
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
> -- 
> 2.17.1
> 
