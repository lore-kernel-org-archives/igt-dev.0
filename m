Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0119C8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 12:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E089EBB;
	Wed,  2 Jul 2025 12:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+B0A8aO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E85F89EBB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751459315; x=1782995315;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SoTE36Lupdoimj4pakgUlckzRQvoPpouK2Z5Euh0gUc=;
 b=a+B0A8aOb+Ee1H6hN4B29dqcYNWvmcNK5+pUK1bIbsVVCnAud3GR6xyl
 MGEAzlunFnJP61bRFtv3GoL9ZZt25auNbCWQszJqtIVk4BLmfA94/J0h4
 99uvBlA2+nneccAK08dAsjeyb9fOuNWnWbmHv+/F29vGHkr+OAdsLXWvR
 Cv4Q2hu0Fnn8tnO+Y6Es7Sk7S8ujeTVNtFggwcXQGCGwCwdtXRN7n7f8P
 7w6mH14Xz7VRUO8DaCeuVNCcGTNQOwd4sQR2gIA7o1OluCGvk96ITGJ0S
 4T/KIn7ig2myRHkccZiUxtx45oe/rLNj1TLhAmbr682DxBtsfDtWWswsc w==;
X-CSE-ConnectionGUID: I71HKnlCTp2P5OE7Bi0p3g==
X-CSE-MsgGUID: OblSgaFCQlCk3//asFERLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57426579"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="57426579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 05:28:35 -0700
X-CSE-ConnectionGUID: tGHWxJmdQmaPAvEobytOyg==
X-CSE-MsgGUID: LOs61GAMRaWLLcrEwl7VeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153839580"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:28:32 -0700
Date: Wed, 2 Jul 2025 14:28:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 harry.wentland@amd.com
Subject: Re: [PATCH][V5] lib/igt_kms: Move get_writeback_formats_blob to lib
Message-ID: <20250702122830.fz742bilu3cnrhya@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 karthik.b.s@intel.com, harry.wentland@amd.com
References: <20250627234409.702251-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627234409.702251-1-alex.hung@amd.com>
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
On 2025-06-27 at 17:44:09 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This function can be used by other tests that need writeback. A prefix
> "igt_" is also added to the function name.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Thank you all, I merged it with reversed r-b and s-o-b.

Regards,
Kamil

> ---
>  lib/igt_kms.c         | 25 +++++++++++++++++++++++++
>  lib/igt_kms.h         |  2 ++
>  tests/kms_writeback.c | 22 ++--------------------
>  3 files changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 9ee03e870..d71076f24 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>  
>  	return 0;
>  }
> +
> +/**
> + * igt_get_writeback_formats_blob:
> + * @output: Target output
> + *
> + * get supported formats from the writeback connector
> + *
> + * Returns: pointer to the writeback formats blob or NULL if not available
> + */
> +drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
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
> +	return blob;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a85fee515..09d7d4414 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>  int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>  int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>  
> +drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
> +
>  #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 05680837e..1b81088d7 100644
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
> @@ -616,7 +597,8 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  		const char *valid_chars;
>  
>  		igt_skip_on(data.dump_check || data.list_modes);
> -		formats_blob = get_writeback_formats_blob(output);
> +		formats_blob = igt_get_writeback_formats_blob(output);
> +		igt_assert_f(formats_blob, "No writeback pixel formats\n");
>  		valid_chars = "01234568 ABCGNRUVXY";
>  
>  		/*
> -- 
> 2.43.0
> 
