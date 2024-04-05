Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D01BC67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 17:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8695610EC71;
	Fri,  5 Apr 2024 17:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRYOVZEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3939010FE6B
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712338345; x=1743874345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/5ryMQGtbdeuoPjYV3vMpww0G1GxLB97jPfIV6a3pHA=;
 b=BRYOVZErWgcHf2kwvEk3nJwikkwiF7+tA75dX0MNO+8/qd5rVCX0dkRt
 jH2IZTWjjN8juLd2u5tT1+I2eEdiliSIemk+9SPbo1p8MSKqg+6JAYcGl
 wcUUHi4xJeo1+LIAP0tmbMPtGMuyEG1+l7UGDCR8sM0BWbbbuLyNGwNSO
 1cSfUc2i5tXQuAvh+wWXv40UCbJW21Z5OWsvWPwo06lCUwa5ArqiA0X+F
 ZToOWRBzY6VVCQZy5BGouERhIYk7by47nEVcTEDwj6L7+1qF1JtlT3FD7
 JGvJ32d4eeEGC/UisyYBNiGV6DgVaOm4+XdMkmTFRGDhy4TrfOsAROd+u g==;
X-CSE-ConnectionGUID: YTdBZQyJQp6m3BSJ+zW5bw==
X-CSE-MsgGUID: UngHzSspRGm7mtXJXAxnKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7519077"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7519077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 10:32:21 -0700
X-CSE-ConnectionGUID: JIUjIzeLSASphwISDlH8bw==
X-CSE-MsgGUID: oYDjJ4WhSW6pAyPCWteLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="56712064"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 10:32:19 -0700
Date: Fri, 5 Apr 2024 19:32:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Melanie Lobo <melanie.lobo@intel.com>, juha-pekka.heikkila@intel.com,
 vidya.srinivas@intel.com, swati2.sharma@intel.com,
 bhanuprakash.modem@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 FP16 compressed formats
Message-ID: <20240405173216.pr222ckvzleiceam@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Melanie Lobo <melanie.lobo@intel.com>,
 juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 swati2.sharma@intel.com, bhanuprakash.modem@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20240405102622.11666-1-melanie.lobo@intel.com>
 <20240405102622.11666-3-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240405102622.11666-3-melanie.lobo@intel.com>
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
On 2024-04-05 at 15:56:22 +0530, Melanie Lobo wrote:

small nit about subject, you wrote:

[PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for FP16 compressed formats

imho you added actual test here, so this should be:

[PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add tests for FP16 compressed format

> MTL supports FP16 format which is a binary floating-point computer
> number format that occupies 16 bits in computer memory. In this test
> platform shall render compression in display engine to receive
> FP16 compressed formats.
> 
> This IGT test was tested with kernel patch,
> https://patchwork.freedesktop.org/patch/563854

Could you also write lore.kernel.org link?

> 
> Test-with: 20231012062620.23886-1-melanie.lobo@intel.com
- ^^^^^^^^^^
I am not sure but imho this is used at kernel patches, not for igt?

> 
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> 

Remove this one newline between Cc: and s-o-b.

Regards,
Kamil

> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
> index 7dc07bc8330d..94a4cacc9813 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -96,6 +96,10 @@
>   * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
>   *
> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-%s
> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + *              clock programming
> + *
>   * arg[1]:
>   *
>   * @downscaling:        Downscaled
> @@ -345,6 +349,14 @@ const struct {
>  		1.0,
>  		2.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
>  	{
>  		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
>  		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> @@ -529,6 +541,14 @@ const struct {
>  		0.5,
>  		1.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
>  };
>  
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
> -- 
> 2.17.1
> 
