Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69969C3600E
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 17:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008F310E6EF;
	Wed, 26 Mar 2025 17:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNT4Dbow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCE610E6EF
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743011076; x=1774547076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=71UpoSZzzpwYM/LGa5Du/JFkZ+vJJg1rWdDtTA3zwvM=;
 b=WNT4DbowRIDOp8EbPnai053beaA4TjFnkjXNJIYON/EgTKVm795w57oD
 pRsJKzWPR/hqwyqAlxVkNuyyFm4U7V6FtuuqZ2ArA1xA3yjKHIOh/nMlb
 yOp1BhSd1/XHBPDeTuw/3Bn9czYVIXArrrDkLjbaQS5+hqwHQ8VsdGvtp
 8tYk49Hq/atkFNBaiv4mPJ0U8R0t4RWBclQ7Loi+D659jzZa13D7wNZiF
 tyWPZBO8SR9dBRV9oCdkKlJpl+xljsBuZ3MysQs5gkZyYtBsaNxfp/k2I
 H99rUKPrPEKYTEAJgz14OD42UXJQjYT8N/+eOq0b39qPqciVROgLhO+LS Q==;
X-CSE-ConnectionGUID: RtFfFPnBTeWFSgJX6TJ27Q==
X-CSE-MsgGUID: 7C+yNqvPRsGXDNhMhCstIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61839473"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="61839473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 10:44:35 -0700
X-CSE-ConnectionGUID: bfKqlr3QRImBt568qhrbQw==
X-CSE-MsgGUID: IVrH5Z/8SniggYu5u6o9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="130041115"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 26 Mar 2025 10:44:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Mar 2025 19:44:31 +0200
Date: Wed, 26 Mar 2025 19:44:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 arun.r.murthy@intel.com, chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH i-g-t v8 1/4] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Message-ID: <Z-Q8_2IQXmHrncWM@intel.com>
References: <20250326102758.2728285-1-santhosh.reddy.guddati@intel.com>
 <20250326102758.2728285-2-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326102758.2728285-2-santhosh.reddy.guddati@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Mar 26, 2025 at 03:57:55PM +0530, Santhosh Reddy Guddati wrote:
> Parse "IN_FORMATS_ASYNC" plane property to identify supported
> format modifier pairs for async flips
> 
> V2: Add new fields async_formats and reset idx.
> 
> V3: Improve commit message , remove unused declaration (Chaitanya)
>     Introduce structure to hold a format modifier and its
>     associated format list.
> 
> V4: Implement format+modifier tuples for async similar to IN_FORMATS
>     (Chaitanya).
> 
> V5: Re use local variables for async formats and free blob after
>     usage(Chaitanya)
> 
> V6: Initialize async_modifiers and async_formats to NULL. (Chaitanya)
> 
> V7: Fix async format count to return 0 on failures (Chaitanya)
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  lib/igt_kms.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  lib/igt_kms.h |  7 ++++++-
>  2 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index cc3bb3ae7..c6c3f1894 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>  	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
>  	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
>  };
>  
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> @@ -5759,10 +5760,12 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
>  static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
>  {
>  	const struct drm_format_modifier_blob *blob_data;
> +	const struct drm_format_modifier *async_modifiers = NULL;
>  	drmModePropertyBlobPtr blob;
>  	uint64_t blob_id;
>  	int idx = 0;
> -	int count;
> +	int count = 0;
> +	const uint32_t *async_formats = NULL;
>  
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>  		drmModePlanePtr p = plane->drm_plane;
> @@ -5796,8 +5799,10 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>  	blob_data = (const struct drm_format_modifier_blob *) blob->data;
>  
>  	count = igt_count_plane_format_mod(blob_data);
> -	if (!count)
> +	if (!count) {
> +		drmModeFreePropertyBlob(blob);
>  		return;
> +	}
>  
>  	plane->format_mod_count = count;
>  	plane->formats = calloc(count, sizeof(plane->formats[0]));
> @@ -5822,6 +5827,53 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>  	}
>  
>  	igt_assert_eq(idx, plane->format_mod_count);
> +
> +	drmModeFreePropertyBlob(blob);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
> +		return;
> +
> +	blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC);
> +	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +
> +	if (!blob)
> +		return;
> +
> +	blob_data = (const struct drm_format_modifier_blob *)blob->data;
> +	count = igt_count_plane_format_mod(blob_data);
> +
> +	if (!count) {
> +		plane->async_format_mod_count = 0;
> +		drmModeFreePropertyBlob(blob);
> +		return;
> +	}
> +
> +	plane->async_format_mod_count = count;
> +	plane->async_modifiers = calloc(count, sizeof(plane->async_modifiers[0]));
> +	igt_assert(plane->async_modifiers);
> +
> +	plane->async_formats = calloc(count, sizeof(plane->async_formats[0]));
> +	igt_assert(plane->async_formats);
> +
> +	idx = 0;
> +	for (int i = 0; i < blob_data->count_modifiers; i++) {
> +		for (int j = 0; j < 64; j++) {
> +			async_modifiers = modifiers_ptr(blob_data);
> +			async_formats = formats_ptr(blob_data);
> +
> +			if (!(async_modifiers[i].formats & (1ULL << j)))
> +				continue;
> +
> +			plane->async_formats[idx] = async_formats[async_modifiers[i].offset + j];
> +			plane->async_modifiers[idx] = async_modifiers[i].modifier;
> +			idx++;
> +			igt_assert_lte(idx, plane->async_format_mod_count);
> +		}
> +	}
> +
> +	igt_assert_eq(idx, plane->async_format_mod_count);
> +
> +	drmModeFreePropertyBlob(blob);

This code looks identical to the existing stuff that parses the normal
blob. Can you refactor that into a common function?

>  }
>  
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 27b545f52..78d6a7ee4 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_X,
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>  };
>  
>  /**
> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>  	uint64_t *modifiers;
>  	uint32_t *formats;
>  	int format_mod_count;
> +
> +	uint64_t *async_modifiers;
> +	uint32_t *async_formats;
> +	int async_format_mod_count;
>  } igt_plane_t;
>  
>  /*
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
