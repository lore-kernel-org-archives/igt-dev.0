Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FEFC7115B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8DE10E042;
	Thu, 26 Jun 2025 08:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaWDm20o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC910E038
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750926306; x=1782462306;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dwV1ecss4pjH6AUeqYKRHr4LLzQQh/jf5eR5RKbfQDI=;
 b=TaWDm20okCVYdNDwFSD5xCsEOLAMMrLScyvlDaB+tBToERERXBAVg6O1
 t8ASMOyfCQZUVse0u7RmjAnNcuQLF0PQy4dA/ad5KOLUgDqC+IDlgx0iO
 YItqsJO/9xEPadtUdbw+gfFCrvnnYpBWJ2FoMEbdhFJ5o+hlPnR1NLniJ
 zGSTATQz7V8kL+7nduPVlpiEUyijvCwB4PPR84LHefVrx4nPJIzqot65g
 Rabj4P2FJqpskBIEgcI99Y3VK3ouV5NWWsbRdDH2GAD/RlGL9tXcSbNSc
 vhsacA69VP62/kVZh/L6qnU87qNxKWU3q7JcJ5W6q8bSbddOhHX8n7rbK w==;
X-CSE-ConnectionGUID: h5RTBk3LQtqf8keqPIqhvQ==
X-CSE-MsgGUID: arS0d9hgTCGgnZh815gytQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52329273"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52329273"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:25:06 -0700
X-CSE-ConnectionGUID: kOVjleMMSh6gAfAhyqgiaA==
X-CSE-MsgGUID: ZJCMwEO+TS6NFF1L4OgClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156723080"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:25:04 -0700
Date: Thu, 26 Jun 2025 10:24:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH][V4] lib/igt_kms: Move get_writeback_formats_blob to lib
Message-ID: <20250626082444.6tfhinn6asoo2udx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250625174115.2536661-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625174115.2536661-1-alex.hung@amd.com>
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
On 2025-06-25 at 11:41:15 -0600, Alex Hung wrote:
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
> index 8765fda34..b4c3b1cd2 100644
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
> @@ -621,7 +602,8 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  		const char *valid_chars;
>  
>  		igt_skip_on(data.dump_check || data.list_modes);
> -		formats_blob = get_writeback_formats_blob(output);
> +		formats_blob = igt_get_writeback_formats_blob(output);
> +		igt_require_f(formats_blob, "No writeback pixel formats\n");

Now imho it looks good but I am not KMS dev so I am not sure
if not having pixel formats is a bug or not, e.g. if we need
igt_assert_f here or igt_require_f is good enough.

Khartik or Swati or Juha-Pekka, could you help here?

+cc Karthik B S <karthik.b.s@intel.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

So moving function to lib looks ok, for that part

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		valid_chars = "01234568 ABCGNRUVXY";
>  
>  		/*
> -- 
> 2.43.0
> 
