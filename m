Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C60DC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 15:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923B10EB4B;
	Fri, 19 Apr 2024 15:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtJWWbc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F30810EB4B
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713538844; x=1745074844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YR4+BI6YvzPIJlwhD5KuK6c84OMHZ3geKLAXH0ZGoyY=;
 b=AtJWWbc6cmTcewZRzz647pcb60FWkSGmlasWQuYUB7I6BSCEcF72HRE6
 oIOfaIs0GO+K9NXeXl16/fFiOcoR4w74/JVMA374WTzHIH9ApQAnXrthS
 nBuCE0GD3q6rnSmzrsilcgs/gfqLhy6+5ajXKok7tHCuaPDgsyLKfcFq7
 Y6Ruv6+xkH7ECnz1Ir/z3XFkenCAFfXFmtBJObGRiw5dM0GgVR+YzXHx/
 CvG7A08z0Sd7e3VBYeep4+27AxzgnX+J+i0ioxvnrNnvK8bkiY8DFCNMo
 QorPGrDH9WCILMnu0Nz+jRgkVfc7s8hxaOLWPo/43sGuATjb6NtDI/nxJ w==;
X-CSE-ConnectionGUID: YK3K5u+WRtyHmKJgM8zocA==
X-CSE-MsgGUID: 32mK0QqGQ6mj9D2k6uDLog==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9063830"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9063830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:00:44 -0700
X-CSE-ConnectionGUID: lVcDH7FZS26gmZ4h1TRUcg==
X-CSE-MsgGUID: iWuQSPwGSqeGe9AZgPOfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23344181"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 08:00:41 -0700
Date: Fri, 19 Apr 2024 17:00:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v4 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is not supported by Pixman
Message-ID: <20240419150023.aomxc7cn2spb2wsa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
 <20240411-kms_fb_stress-dev-v4-5-7a8f3a419ebb@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411-kms_fb_stress-dev-v4-5-7a8f3a419ebb@riseup.net>
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
On 2024-04-11 at 15:51:15 -0300, Arthur Grillo wrote:
> Pixman requires strides to be divisible by sizeof(uint32_t).
> So, don't paint the FB's if the stride is not.

Why are you limiting stress to pixman? What about an option for
non-dword aligned stress benchmark? Btw most hardware use dword
or qword alignment.

> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 62 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 14 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 76e82e0d76ea..bb85dfb18d2b 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -46,26 +46,60 @@ static void plane_setup(struct plane_t *plane, int index)
>  	igt_plane_set_fb(plane->base, &plane->fbs[index]);
>  }
>  
> +static bool have_supported_pixman_stride(int fd, struct plane_t *plane) {
> +	unsigned stride;
> +
> +	igt_calc_fb_size(fd, plane->rect.width, plane->rect.height,
> +			 plane->format, DRM_FORMAT_MOD_LINEAR,
> +			 NULL, &stride);
> +
> +	return stride % sizeof(uint32_t) == 0;

I do not see int this function pixman related ioctl, all you
do is checking stride is dword aligned, imho it would be better
to rename this function, like has_stride_dw_aligned (you are
free to find out better name).

> +}
> +
>  static void gen_fbs(struct data_t *data)
>  {
>  	struct kms_t *kms = &data->kms;
>  	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
>  
>  	for (int i = 0; i < NUM_FBS; i++) {
> -		igt_create_color_fb(data->fd, kms->primary.rect.width, kms->primary.rect.height,
> -				    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
> -				    !i, i, i,
> -				    &kms->primary.fbs[i]);
> -
> -		igt_create_color_fb(data->fd, kms->overlay_a.rect.width, kms->overlay_a.rect.height,
> -				    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
> -				    i, !i, i,
> -				    &kms->overlay_a.fbs[i]);
> -
> -		igt_create_color_fb(data->fd, kms->overlay_b.rect.width, kms->overlay_b.rect.height,
> -				    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
> -				    i, i, !i,
> -				    &kms->overlay_b.fbs[i]);
> +		if (have_supported_pixman_stride(data->fd, &kms->primary)) {
> +			igt_create_color_fb(data->fd,
> +					    kms->primary.rect.width, kms->primary.rect.height,
> +					    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
> +					    !i, i, i,
> +					    &kms->primary.fbs[i]);
> +		} else {
> +			igt_create_fb(data->fd,
> +				      kms->primary.rect.width, kms->primary.rect.height,
> +				      kms->primary.format, DRM_FORMAT_MOD_LINEAR,
> +				      &kms->primary.fbs[i]);
> +		}
> +
> +		if (have_supported_pixman_stride(data->fd, &kms->overlay_a)) {
> +			igt_create_color_fb(data->fd,
> +					    kms->overlay_a.rect.width, kms->overlay_a.rect.height,
> +					    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
> +					    i, !i, i,
> +					    &kms->overlay_a.fbs[i]);
> +		} else {
> +			igt_create_fb(data->fd,
> +				      kms->overlay_a.rect.width, kms->overlay_a.rect.height,
> +				      kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
> +				      &kms->overlay_a.fbs[i]);
> +		}

It looks like repeating code, maybe create a function?

Regards,
Kamil

> +
> +		if (have_supported_pixman_stride(data->fd, &kms->overlay_b)) {
> +			igt_create_color_fb(data->fd,
> +					    kms->overlay_b.rect.width, kms->overlay_b.rect.height,
> +					    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
> +					    i, i, !i,
> +					    &kms->overlay_b.fbs[i]);
> +		} else {
> +			igt_create_fb(data->fd,
> +				      kms->overlay_b.rect.width, kms->overlay_b.rect.height,
> +				      kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
> +				      &kms->overlay_b.fbs[i]);
> +		}
>  
>  		kms->writeback.rect.width = mode->hdisplay;
>  		kms->writeback.rect.height = mode->vdisplay;
> 
> -- 
> 2.44.0
> 
