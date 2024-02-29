Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69997C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 13:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F091910E05E;
	Thu, 29 Feb 2024 13:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwbYwnly";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97B010E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709211681; x=1740747681;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xc+DskNR+yfccavaHWoxKnlm7JnXevQaK0TDV/qAtdg=;
 b=FwbYwnlycetb1ZCQA+BNNhb1hgxEgVdNE0PtqqvDierh2owjutBz2lSk
 iaTLoDN6V7wRv5Tx4dejNfgR84hJm1zFyzdI9hf/eOS83thtHk2qV2asH
 7e74UQ+/N1/J/FWQM0XRCZjwsQdvhvBs5A9/GxVtnc2H1Bcr78jQfCLy7
 ADUklqwDoZW/VRCD6s2+CSiiz0jEFuMw2leJO0/jfCL/Lbt79eeCkv4Al
 X9yLVo17XGdM6/hFa0khojvYpYbACzDCjiFF23dPoZ6vLpj+saGoNI4pR
 MAfFjJVQkV33S3za7OxLRaFphqQ+efGugLptk1xypTjEAX2mernwOUtC1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3843281"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3843281"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12429844"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:01:17 -0800
Date: Thu, 29 Feb 2024 14:01:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t 3/3] benchmarks/kms_fb_stress: Log the KMS structure
Message-ID: <20240229130114.viizafj25ofmyggn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
 <20240226-kms_fb_stress-dev-v1-3-1c14942b1244@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226-kms_fb_stress-dev-v1-3-1c14942b1244@riseup.net>
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

Hi Arthur,
On 2024-02-26 at 16:42:19 -0300, Arthur Grillo wrote:
> Now that we can change the planes and writeback formats, log the KMS
> structure to the user.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/kms_fb_stress.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 073104b8e4f8..ee34df3da826 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -8,6 +8,9 @@
>  #define FRAME_COUNT 100
>  #define NUM_FBS 2
>  
> +#define RECT_FMT    "%dx%d%+d%+d"
> +#define RECT_ARG(r) (r)->width, (r)->height, (r)->x, (r)->y
> +
>  struct rect_t {
>  	int x, y;
>  	int width, height;
> @@ -209,7 +212,6 @@ igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
>  	struct timespec then, now;
>  	double elapsed;
>  
> -
>  	data.fd = drm_open_driver_master(DRIVER_ANY);
>  
>  	igt_display_require(&data.display, data.fd);
> @@ -231,6 +233,22 @@ igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
>  
>  	gen_fbs(&data);
>  
> +	igt_info("KMS structure:\n");
> +	igt_info("\tCRTC:\n");
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.crtc));
> +	igt_info("\tprimary:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.primary.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.primary.rect));
> +	igt_info("\toverlay A:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_a.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_a.rect));
> +	igt_info("\toverlay B:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_b.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_b.rect));
> +	igt_info("\twriteback:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.writeback.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.writeback.rect));
> +
>  	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_assert(data.kms.primary.base != NULL);
>  
> 
> -- 
> 2.43.0
> 
