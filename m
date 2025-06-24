Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7586C77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 13:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756B110E5AE;
	Tue, 24 Jun 2025 13:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9EOM4hM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938AE10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 13:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750771884; x=1782307884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R0fL5nNTzFFzh2VVl/+T9RXV5UTiXYyR8d51zP3hvbo=;
 b=D9EOM4hMG+apiKEB2oCvoyZCWGDuxEJi90z5W3Yu6+GNbqjRKs5Nf6W2
 u8yjd16ef+raYs/sGE8mA2javPkZw6FHwlX6rIoSKE2G9ewtwXTn3295V
 a3uToMDvQIzqdAIW4k+jarc+zkEC/7CVxCaXGdQx+h7S4J8O9dqn/Ofgt
 oT2r7KAkddM30lSmJsmoYFxinpxNlCcMdrO1c/vq+TL29/1D6PVqpIZoP
 CzLI3U9+mTuoN1jbc9xS1mHveEX3UN4fAGavL6A3Y2CGVT5ld7aJKr7nk
 VTFYTmFHp0Pjlik1FcZ/W3oIRArF55Um29QpoCUhE3SUmsNQ7hY8vQ/D8 g==;
X-CSE-ConnectionGUID: wPV9pqFUSFOHYSWIz0Cb7A==
X-CSE-MsgGUID: sYtoarTfQPisxsEGnBuCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63702899"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="63702899"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:31:24 -0700
X-CSE-ConnectionGUID: AK3rh5S+SAGYQH+dTRbL7w==
X-CSE-MsgGUID: P2BNSuJ+RmOJ2IHNtShbRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151342921"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:31:23 -0700
Date: Tue, 24 Jun 2025 15:31:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH][V2] lib/igt_kms: Move get_writeback_formats_blob to lib
Message-ID: <20250624133106.s2lppebjpbc5grg6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, Karthik B S <karthik.b.s@intel.com>
References: <20250623181440.462861-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623181440.462861-1-alex.hung@amd.com>
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
On 2025-06-23 at 12:14:40 -0600, Alex Hung wrote:
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
> index 9ee03e870..085c3f430 100644
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

Document here when this could assert (or not)
also document when return value could be NULL

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
> +	igt_assert(blob);

Please remove assert from here, or at least move it iside 'if':

	if (ret) {
		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
		igt_assert(blob);
	}

Or provide second function __igt_get_writeback_formats_blob
without any asserts, see note about writing library functions
in CONTRIBUTING.md

Or it could be merged as is now and improved later on?
+cc Karthik

Cc: Karthik B S <karthik.b.s@intel.com>

Regards,
Kamil

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
>  		valid_chars = "01234568 ABCGNRUVXY";
>  
>  		/*
> -- 
> 2.43.0
> 
