Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C8C7EE30
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 09:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F110E352;
	Mon, 23 Jun 2025 09:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQTge9vj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC9810E352
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672343; x=1782208343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YFuy3BYxd+145h86BVM6PorrpjvgvQ2QIXbVJnvkfks=;
 b=eQTge9vj2rgM2ysKTh+9/tvPFmi/fHiM2ig3+nbAJev9ErzNqhN02CsL
 KOKISk4ICNVbZ43mbO5FtiQu7u8JADu93qxhhsvj91AfDJDAg0r9342E6
 g9CZWTH1AEVMQtj+NE7w6Fv+l/18nQtGCFJ6xK+efbX+oe/P+rwngaWVH
 g2vtisRzMaEE52UQgzXyTincN52DmdBGCLmwJn+SZkQM2pBX3mHoVEKce
 /e3s8M+c62MLupfmh4mryWbCwcgfV1vaeW5+6+aKAFnnD3wwafnQ+ED0/
 kloDrpCxik13HcU62+hY8ZwMJO47ceGbveaPAQ2ymV71eR8G4sFjw0vkR Q==;
X-CSE-ConnectionGUID: 0fi5WljUSIu7tlosFV2NiA==
X-CSE-MsgGUID: oP/bLelCSzCIUsaIX+oTtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52741700"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52741700"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:52:22 -0700
X-CSE-ConnectionGUID: SKaN4fXLSlyngy/2n/VV8g==
X-CSE-MsgGUID: 9VC2yzAWQWWc+1+Y9vpl7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152060755"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:52:22 -0700
Date: Mon, 23 Jun 2025 11:52:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [PATCH] lib/igt_kms: Move get_writeback_formats_blob to lib
Message-ID: <20250623095205.2wb2qlew56ry3nyu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com
References: <20250618230234.1721865-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618230234.1721865-1-alex.hung@amd.com>
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
On 2025-06-18 at 17:02:34 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This function can be used by other tests that need writeback.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_kms.c         | 25 +++++++++++++++++++++++++
>  lib/igt_kms.h         |  2 ++
>  tests/kms_writeback.c | 19 -------------------
>  3 files changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 9ee03e870..35c381e40 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>  
>  	return 0;
>  }
> +
> +/**
> + * get_writeback_formats_blob:
> + * @output: Target output
> + *
> + * get supported formats from the writeback connector
> + */
> +drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)

imho this should have a prefix 'igt_' so:

drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)

Rest looks good,

Regards,
Kamil

> +{
> +	drmModePropertyBlobRes *blob = NULL;
> +	uint64_t blob_id;
> +	int ret;
> +
> +	ret = kmstest_get_property(output->display->drm_fd,
> +				   output->config.connector->connector_id,
> +				   DRM_MODE_OBJECT_CONNECTOR,
> +				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
> +				   NULL, &blob_id, NULL);
> +	if (ret)
> +		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
> +
> +	igt_assert(blob);
> +
> +	return blob;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a85fee515..6f96b482f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>  int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>  int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>  
> +drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
> +
>  #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 05680837e..d075cc5b6 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -92,25 +92,6 @@ enum {
>  	XRGB2101010 = 1 << 1,
>  };
>  
> -static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
> -{
> -	drmModePropertyBlobRes *blob = NULL;
> -	uint64_t blob_id;
> -	int ret;
> -
> -	ret = kmstest_get_property(output->display->drm_fd,
> -				   output->config.connector->connector_id,
> -				   DRM_MODE_OBJECT_CONNECTOR,
> -				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
> -				   NULL, &blob_id, NULL);
> -	if (ret)
> -		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
> -
> -	igt_assert(blob);
> -
> -	return blob;
> -}
> -
>  static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  				    drmModeModeInfo override_mode)
>  {
> -- 
> 2.43.0
> 
