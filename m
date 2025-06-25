Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D9C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 10:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD06110E6C0;
	Wed, 25 Jun 2025 10:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVbR/btk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3527E10E215
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750847313; x=1782383313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eCI+S1JjaBRLx0n/doe18ZsrN4UDjlQ71WSa1fiLzyQ=;
 b=iVbR/btkEyXUQR0q0rYus4pfbQjb9t3rGKSIpZqFM5wIXOJ3s6GEbxxE
 wVWr5K9CxJ5uZ0N5g47ZuwGb+lic9YWzC9Ht+vkOHgJtLlxmBmFN5dPAz
 EI68K5yHgvJl574U99Ww7++cdaunVRuN8XRXY9zTKa8tuE9cXCdZq7WSX
 NsDt5xxKBMq/U+/m/0jTc5txKqrB8oKIUJqTNZoNl40gQOJg4RJyqH4zd
 yOK0U6OV1H6locj4gyfKg6H00cHRYqop6r99XyDPTb8Qg7Q1D4GG7Bxzq
 ry2tL6GmVl7j17DDIv1zE7HSuCA6mOtoguVQQIdnWx0S+VpsiPyBL2G0X A==;
X-CSE-ConnectionGUID: +hrglQCNT0KeEp9/6jF6EA==
X-CSE-MsgGUID: Ksb9WG5kRpq11KbX1RLeHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52975531"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52975531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 03:28:33 -0700
X-CSE-ConnectionGUID: RZR4xZXRRgijlAwZ9xkn3w==
X-CSE-MsgGUID: Ck0aJ/vQQiWh9UGHhS+zLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="152313068"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:28:31 -0700
Date: Wed, 25 Jun 2025 12:28:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [PATCH][V3] lib/igt_kms: Move get_writeback_formats_blob to lib
Message-ID: <20250625102810.7k7yao2tc4sxlq2l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com
References: <20250624221712.1786983-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624221712.1786983-1-alex.hung@amd.com>
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
On 2025-06-24 at 16:17:12 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This function can be used by other tests that need writeback. A prefix
> "igt_" is also added to the function name.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_kms.c         | 25 +++++++++++++++++++++++++
>  lib/igt_kms.h         |  2 ++
>  tests/kms_writeback.c | 21 +--------------------
>  3 files changed, 28 insertions(+), 20 deletions(-)
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
> index 8765fda34..86afed509 100644
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
> @@ -621,7 +602,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  		const char *valid_chars;
>  
>  		igt_skip_on(data.dump_check || data.list_modes);
> -		formats_blob = get_writeback_formats_blob(output);
> +		formats_blob = igt_get_writeback_formats_blob(output);

This now needs a check for NULL here, rest looks good.
So just add here something like:

		igt_require_f(formats_blob, "No writeback pixel formats\n");

and this patch is ready to be merged.

Regards,
Kamil
>  		valid_chars = "01234568 ABCGNRUVXY";
>  
>  		/*
> -- 
> 2.43.0
> 
