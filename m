Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AADC25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 09:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06FF10E196;
	Wed, 22 May 2024 09:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eaTIBGK6";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CA210E196
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 09:08:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D5EA20013;
 Wed, 22 May 2024 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716368881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=159jYr3xyy0cxXmNyTX6+CEuwjPBP+AvVFYCPBaFqbs=;
 b=eaTIBGK6lXhIfp9vXleift7HHE2cX1HIBF0UU1vbz6KpnENeNHEiJ5/Bhqbktrf2s99zyP
 Y8oYjOFoGDpR4p+z9CFoh9dvglXq4XiOubRpZ+2YCA8LhovtoCRMMSwdxjVw71GFEqbSn2
 ZUxxbsQvXezwfL/O3saxhnPph4GPzU/e6CpZyIT6uuv0FLBeFHMcZZ9nqKGRQSvIq6q8Lx
 ufFSPPaEEJZSCPRunaGfuDVYZAQ5ZtKSGTHdtAjQNFfqVWFsksghA28zz+wx/+K+LKYRqp
 bE/DQwBiWboquG0+u6LLGrurviWanPcHKBTjo7Q2gczZgweCNwkXMRSVqt2GvQ==
Date: Wed, 22 May 2024 11:07:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 7/8] benchmarks/kms_fb_stress: Optionally enable
 the overlay planes
Message-ID: <Zk217vwFb9WlPE6o@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-7-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-7-0c577163dc88@riseup.net>
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

Le 22/04/24 - 19:18, Arthur Grillo a écrit :
> In the future, we would like to not use overlay planes, so make them
> optional.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 40 ++++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 8775fabdd164..d2d6b3e65eae 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -37,6 +37,7 @@ struct data_t {
>  	igt_output_t *wb_output;
>  	drmModeModeInfo *mode;
>  	struct kms_t kms;
> +	bool use_overlay;
>  };
>  
>  static void plane_setup(struct plane_t *plane, int index)
> @@ -75,8 +76,10 @@ static void gen_fbs(struct data_t *data)
>  
>  	for (int i = 0; i < NUM_FBS; i++) {
>  		create_fb(data->fd, &kms->primary, i, !i, i, i);
> -		create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
> -		create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
> +		if (data->use_overlay) {
> +			create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
> +			create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
> +		}
>  
>  		kms->writeback.rect.width = mode->hdisplay;
>  		kms->writeback.rect.height = mode->vdisplay;
> @@ -150,12 +153,14 @@ static void stress_driver(struct data_t *data)
>  	igt_info("\tprimary:\n");
>  	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.primary.format));
>  	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.primary.rect));
> -	igt_info("\toverlay A:\n");
> -	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
> -	igt_info("\toverlay B:\n");
> -	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
> +	if (data->use_overlay) {
> +		igt_info("\toverlay A:\n");
> +		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
> +		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
> +		igt_info("\toverlay B:\n");
> +		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
> +		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
> +	}
>  	igt_info("\twriteback:\n");
>  	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.writeback.format));
>  	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.writeback.rect));
> @@ -169,9 +174,11 @@ static void stress_driver(struct data_t *data)
>  
>  		plane_setup(&data->kms.primary, fb_index);
>  
> -		plane_setup(&data->kms.overlay_a, fb_index);
> +		if (data->use_overlay) {
> +			plane_setup(&data->kms.overlay_a, fb_index);
>  
> -		plane_setup(&data->kms.overlay_b, fb_index);
> +			plane_setup(&data->kms.overlay_b, fb_index);
> +		}
>  
>  		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
>  
> @@ -187,14 +194,18 @@ static void stress_driver(struct data_t *data)
>  	elapsed = igt_time_elapsed(&then, &now);
>  
>  	igt_plane_set_fb(data->kms.primary.base, NULL);
> -	igt_plane_set_fb(data->kms.overlay_a.base, NULL);
> -	igt_plane_set_fb(data->kms.overlay_b.base, NULL);
> +	if (data->use_overlay) {
> +		igt_plane_set_fb(data->kms.overlay_a.base, NULL);
> +		igt_plane_set_fb(data->kms.overlay_b.base, NULL);
> +	}
>  	igt_output_set_writeback_fb(data->wb_output, NULL);
>  
>  	for (int i = 0; i < NUM_FBS; i++) {
>  		igt_remove_fb(data->fd, &data->kms.primary.fbs[i]);
> -		igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
> -		igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
> +		if (data->use_overlay) {
> +			igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
> +			igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
> +		}
>  		igt_remove_fb(data->fd, &data->kms.writeback.fbs[i]);
>  	}
>  
> @@ -279,6 +290,7 @@ igt_main
>  	}
>  
>  	igt_subtest("default-stress") {
> +		data.use_overlay = true;
>  		stress_driver(&data);
>  
>  	}
> 
> -- 
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
