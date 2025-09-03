Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD044CA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 16:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBB210E8F1;
	Wed,  3 Sep 2025 16:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9plwYbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A8610E8F1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756917678; x=1788453678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RYCnHbPGSpSjcsUjUEAMlJg8sUjgm9mIIP/9r2SlmZY=;
 b=c9plwYbhk1JDAybQgoWorgTb2OgkfmFjyeLQRX4e2CZ4UZgw2aYlTs9P
 GmFFN3eP8xT+31rZ5AakJDdCEoS61DL7P0+EBbnUmEfqjJjI9EJt+kDoc
 2hFQ67hAmy/XQ9+M7/INN1rTA44FAOxPkH6vpV1qd/n65yo7hFC5HT/7D
 lvRRHzFCMVNEojjkLSvcf3WGgtHSqkIfSQFG5MLlEYArjq8+SCUj/tCQu
 aDtQI8mSHSrlgcnU57evMLUk77B1Llj7ytbIGcnoFPWU+sUbWgfOkdkI6
 KIP8BbkFU0NZN9P2sBQb2mwEH7K6dEegQaNDW2o9y1vNV0E6YkpUtYCYh Q==;
X-CSE-ConnectionGUID: DMPnauEDSdqMIp2lg14Nog==
X-CSE-MsgGUID: yxd9aug8Q/KiBVt6sHNpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76684446"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76684446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 09:41:17 -0700
X-CSE-ConnectionGUID: zOKGZ+XeRLWVlHmtv0V3Rg==
X-CSE-MsgGUID: OXNAW+apTxqJophicSERvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176001191"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 09:41:16 -0700
Date: Wed, 3 Sep 2025 18:41:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com
Subject: Re: [PATCH V10 28/30] drm-uapi: Update kernel doc for drm_colorop_type
Message-ID: <20250903164112.yxyrmo34p2eyudym@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-29-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815040659.3321102-29-alex.hung@amd.com>
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

Hi Alex,
On 2025-08-14 at 22:06:57 -0600, Alex Hung wrote:

please improve subject, imho add 'drm_mode' prefix:

[PATCH V10 28/30] drm-uapi/drm_mode: Update kernel doc for drm_colorop_type

> Sync up with kernel documents.

Provide kernel commit here, link to lore.kernel.org also
could be added.
Or look into history and do similar commit:
git log -- include/drm-uapi/drm_mode.h

Regards,
Kamil

> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  include/drm-uapi/drm_mode.h | 44 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index 009bb3e7f..e00b21067 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -886,11 +886,55 @@ struct drm_color_lut32 {
>  	__u32 reserved;
>  };
>  
> +/**
> + * enum drm_colorop_type - Type of color operation
> + *
> + *
> + * drm_colorops can be of many different types. Each type behaves differently
> + * and defines a different set of properties. This enum defines all types and
> + * gives a high-level description.
> + */
>  enum drm_colorop_type {
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE:
> +	 *
> +	 * A 1D curve that is being applied to all color channels. The
> +	 * curve is specified via tha CURVE_1D_TYPE colorop property.
> +	 */
>  	DRM_COLOROP_1D_CURVE,
> +
> +	/**
> +	 * @DRM_COLOROP_1D_LUT:
> +	 *
> +	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
> +	 * packed into a blob via the DATA property. The driver's expected
> +	 * LUT size is advertised via the SIZE property.
> +	 */
>  	DRM_COLOROP_1D_LUT,
> +
> +	/**
> +	 * @DRM_COLOROP_CTM_3X4:
> +	 *
> +	 * A 3x4 matrix. Its values are specified via the
> +	 * &drm_color_ctm_3x4 struct provided via the DATA property.
> +	 */
>  	DRM_COLOROP_CTM_3X4,
> +
> +	/**
> +	 * @DRM_COLOROP_MULTIPLIER:
> +	 *
> +	 * A simple multiplier, applied to all color values. The
> +	 * multiplier is specified as a S31.32 via the MULTIPLIER
> +	 * property.
> +	 */
>  	DRM_COLOROP_MULTIPLIER,
> +	/**
> +	 * @DRM_COLOROP_3D_LUT:
> +	 *
> +	 * A 3D LUT of &drm_color_lut entries,
> +	 * packed into a blob via the DATA property. The driver's expected
> +	 * LUT size is advertised via the SIZE property.
> +	 */
>  	DRM_COLOROP_3D_LUT,
>  };
>  
> -- 
> 2.43.0
> 
