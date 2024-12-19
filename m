Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46146E7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 20:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8CA10E092;
	Thu, 19 Dec 2024 20:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHFtvYzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A689410E092
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734639342; x=1766175342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lneKKvrt8+zlG3oChRgWmYVcFgZBgUUVqM7334zzttc=;
 b=OHFtvYzGdX05lc8NtqkWQuE9CHz2ApedVm0eclnGmGW+QY8MEyyZED5D
 OBVR8YobEtPupDqjRM216NvYaz7JV5vq27W/G63HQGk8cVRHjBZchWjg8
 2+CRDoL+jp6WQsKRFKI+2Wa1gHN/8cmwkOXg2CKgkZ55AzJ7YaqImSrqU
 inLMGRw7lDEzm++KrrIrXnqTqOFUA1bu+ican4bdmM6UxI7dEfvD3aEWR
 cbtyeodXQESET2kW7TovY5F+5lpuOxlIK0PKboCgEOZdsV8F5nRgOnA0c
 ATdDeHCXzJB+2iDZxd/n7Pcg10m6ZShxTsgbo/qE+CiBPyFcjfUGMeYW1 g==;
X-CSE-ConnectionGUID: dqGWKhVSRmaIAH/AR8VNeA==
X-CSE-MsgGUID: 9ulRSvICRz6GuKCvvlRpKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34494741"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34494741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:15:41 -0800
X-CSE-ConnectionGUID: xpKMB2fASTuuHvLP+XQ3kQ==
X-CSE-MsgGUID: DzIuVFATQSuGF2iOjpiOxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98782326"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 12:15:38 -0800
Date: Thu, 19 Dec 2024 21:15:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v3 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
Message-ID: <20241219201535.6s7q7fvv332mlbxm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
 <20241122-b4-cv3-01-igt-kms-v3-5-c5ced6976e11@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-5-c5ced6976e11@bootlin.com>
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

Hi Louis,
On 2024-11-22 at 16:19:08 +0100, Louis Chauvet wrote:
> Introduces a new function igt_get_pipe_for_output in igt_kms. The function
> is designed to retrieve a valid pipe for a specific output in a display.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 19 +++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5c242a5bdec619d181c3d0d632f1ea7d94d34743..ef783f9d3aaca9e0a65156a78c0657d2c3316bcc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7420,3 +7420,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
>  	drmModeFreeResources(res);
>  	return 0;
>  }
> +
> +/**
> + * igt_get_pipe_for_output - Get a valid pipe for a specific output
> + * @display: display to fetch the pipes
> + * @output: output to use

Document return value, write also about PIPE_NONE.

> + */
> +enum pipe igt_get_pipe_for_output(igt_display_t *display,
> +				  igt_output_t *output)
> +{
> +	enum pipe pipe;
> +
> +	for_each_pipe(display, pipe) {
> +		if ((igt_output_is_connected((output)) &&
> +		     (output->config.valid_crtc_idx_mask & (1 << (pipe)))))

if (igt_output_is_connected(output) &&
    (output->config.valid_crtc_idx_mask & (1 << (pipe))))

With above corrected
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +			return pipe;
> +	}
> +
> +	return PIPE_NONE;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index d61ddcaa0a25f1f9bc34eff7314eaa49a3de9cc2..3cf6669bcc56b4c24644091c72140ed7760ac198 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1281,5 +1281,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>  drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
> +enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.47.0
> 
