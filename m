Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504A9C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 12:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BB10E05E;
	Thu, 29 Feb 2024 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+o2c4j9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE8210E08F
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709211374; x=1740747374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ekvjBdeWuQTK3gBCyP8xAdbZ+MhToex8xKXvTvvM/dk=;
 b=e+o2c4j9410TVQQ6/kqM1xjJNfW8lqDxKQouRT1sAiLOW9JfwdenLv9/
 YGs/86KgghugnIB3Oucy9lqNrPJVAAqBT8PmkTL8fMIul/3vuuzwJX+Ib
 X5cWA3Byq00KQ43KKOz89wks12tS/Pcsjb6XKB+3umPBh6vAOB0u190WG
 yxltyHkYYNE5HkWLJBlaD9dgprStE/FRXthjT/MMb+prcouPKCv+xYmjs
 6d43MMgsyYU8VLgvuOX/GQHOz+6B1sVn0CVZ1A9zDW04ePfS/TkigGLG0
 19h2G3+92iRmKo2ZIfkFqbTecUGITtpxlRRpNCG0IlZfs+Tgkhst+3bDq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14245081"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14245081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7928298"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:56:11 -0800
Date: Thu, 29 Feb 2024 13:56:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t 1/3] benchmarks/kms_fb_stress: Assert that we have
 an supported pipe
Message-ID: <20240229125609.jt3ejlzbb2xglv5v@kamilkon-desk.igk.intel.com>
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
 <20240226-kms_fb_stress-dev-v1-1-1c14942b1244@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226-kms_fb_stress-dev-v1-1-1c14942b1244@riseup.net>
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
On 2024-02-26 at 16:42:17 -0300, Arthur Grillo wrote:
> Some driver may not support overlay planes. Add a check for that.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

One small nit for subject:
benchmarks/kms_fb_stress: Assert that we have an supported pipe

s/an supported/a supported/

Regards,
Kamil

> ---
>  benchmarks/kms_fb_stress.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 9a0e98bed8ad..8fea10ef069f 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -87,6 +87,27 @@ static igt_output_t *find_wb_output(struct data_t *data)
>  	return NULL;
>  }
>  
> +static void set_wb_pipe(struct data_t *data)
> +{
> +	enum pipe pipe = PIPE_NONE;
> +
> +	for_each_pipe(&data->display, pipe) {
> +		igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
> +
> +		if (igt_pipe_count_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY) < 2)
> +			continue;
> +
> +		igt_debug("Selecting pipe %s to %s\n",
> +			  kmstest_pipe_name(pipe),
> +			  igt_output_name(data->wb_output));
> +		igt_output_set_pipe(data->wb_output, pipe);
> +
> +		return;
> +	}
> +
> +	igt_assert_f(0, "No pipe supports this benchmark\n");
> +}
> +
>  static void set_crtc_size(struct data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -142,7 +163,6 @@ static struct kms_t default_kms = {
>  igt_simple_main
>  {
>  	struct data_t data = {0};
> -	enum pipe pipe = PIPE_NONE;
>  	struct timespec then, now;
>  	double elapsed;
>  
> @@ -163,24 +183,22 @@ igt_simple_main
>  
>  	data.wb_output = find_wb_output(&data);
>  	igt_require(data.wb_output);
> -
> -	for_each_pipe(&data.display, pipe) {
> -		igt_debug("Selecting pipe %s to %s\n",
> -			  kmstest_pipe_name(pipe),
> -			  igt_output_name(data.wb_output));
> -		igt_output_set_pipe(data.wb_output, pipe);
> -		break;
> -	}
> +	set_wb_pipe(&data);
>  
>  	set_crtc_size(&data);
>  
>  	gen_fbs(&data);
>  
>  	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data.kms.primary.base != NULL);
> +
>  	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
>  								  DRM_PLANE_TYPE_OVERLAY, 0);
> +	igt_assert(data.kms.overlay_a.base != NULL);
> +
>  	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
>  								  DRM_PLANE_TYPE_OVERLAY, 1);
> +	igt_assert(data.kms.overlay_b.base != NULL);
>  
>  	igt_assert_eq(igt_gettime(&then), 0);
>  
> 
> -- 
> 2.43.0
> 
