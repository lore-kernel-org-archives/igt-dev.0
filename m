Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055E1C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 09:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9CD10E196;
	Wed, 22 May 2024 09:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FQttWt3g";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B54E10EFD8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 09:07:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 617E61C0007;
 Wed, 22 May 2024 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716368856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxuPapdfo1l55tl8PAAAsRc5MusIkjutOb/r+9HGfwA=;
 b=FQttWt3g9BKAw7EPyInQGsgacMC8U4hQ/F9J4mxYllIHqbtRUTWQXjw/WyrfReLFIS+KRU
 0cO5df2EMXLSD9zRCcbu8lpDdku5erbMPMKUCJWSsH4ZyNy3U23Yr8Q5Iuyv33nZ1eXFG5
 Ak2dZm7ofK9p7rwweXi7H8mfDW/W0FN/fSJaok/5K1KFmikazupj7B6eB2QkwRRIlLsbwt
 OG+tgfBGGLhMbniiAJn9Qedijiaojf/saWAZeQW8cU8Vod0UMY/MZhfAXkly/pPurnTEzN
 UnEWA6bjqoqDIud5f4Bhi0tBWJ/HxoYABAb+nlZiK4wfoh9cDjpTfqzuODq12Q==
Date: Wed, 22 May 2024 11:07:33 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 5/8] benchmarks/kms_fb_stress: Move FB creation
 to a separate function
Message-ID: <Zk211csPypGv7IJ3@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-5-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-5-0c577163dc88@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

Le 22/04/24 - 19:18, Arthur Grillo a écrit :
> In the future, we want to add more logic to the FB creation. So, to
> reduce code repetition, move the procedure to its own function.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 433e751273e6..e028424bb3e4 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -46,26 +46,23 @@ static void plane_setup(struct plane_t *plane, int index)
>  	igt_plane_set_fb(plane->base, &plane->fbs[index]);
>  }
>  
> +static void create_fb(int fd, struct plane_t *plane, int fb_index, double r, double g, double b)
> +{
> +	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
> +			    plane->format, DRM_FORMAT_MOD_LINEAR,
> +			    r, g, b,
> +			    &plane->fbs[fb_index]);
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
> +		create_fb(data->fd, &kms->primary, i, !i, i, i);
> +		create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
> +		create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
>  
>  		kms->writeback.rect.width = mode->hdisplay;
>  		kms->writeback.rect.height = mode->vdisplay;
> 
> -- 
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
