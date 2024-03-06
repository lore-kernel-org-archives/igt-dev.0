Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE89C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B33113303;
	Wed,  6 Mar 2024 17:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S6vZPis9";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DCD11339B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:29:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C8D46000A;
 Wed,  6 Mar 2024 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmMY8UNx6AzHIeSAZ0J1XMbXzTotW8uit2zv5lsdf1Y=;
 b=S6vZPis9hB6K+w8OCJOxAEI8svMsKxTa8DyAPbPxWa7vcVtt0+zAL9PW9NoRDwU+ZSRKRO
 bIzXp+KoGaMjrKjcQlxUwWaXTcNnjFfyIeA41IlS1r3qoXPQ0OVHMJzdvdFerN4OEA80do
 l7fEGbEa0/B2lQTwHGvhXCm6xO5G8Y/q+PTD/xiWozutq+QdQ4s7/zAdwejc9rZ43VluxY
 RZIQFm4NFOIotfXpVyEEvIwy+e1NPG5HxItd0qPWwebKMyK9GADWua2SVb1rUIaoS501a1
 JGBZIHFcPDDh4Qo+P9QZdAWen8ipFurvFNhCfdiYgOin9eHclvAMEpYWwiPq/Q==
Date: Wed, 6 Mar 2024 18:29:55 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v2 7/7] benchmarks/kms_fb_stress: Add command line
 options to pin the planes or writeback formats
Message-ID: <ZeioE0eiabj1Tp4x@localhost.localdomain>
References: <20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net>
 <20240305-kms_fb_stress-dev-v2-7-78888a38e563@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305-kms_fb_stress-dev-v2-7-78888a38e563@riseup.net>
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

Le 05/03/24 - 20:15, Arthur Grillo a écrit :
> Currently, the benchmark runs all the possible combinations of formats,
> which can take a lot of time. Change that by adding command line options
> to pin the planes or writeback formats, with the intention to decrease
> the number of cases to run.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 140 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 99 insertions(+), 41 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index deee9d557175..37f60f0bfa94 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2024 Arthur Grillo
>   */
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  
>  #include "igt.h"
> @@ -41,6 +42,10 @@ struct data_t {
>  	size_t wb_fmt_count;
>  	drmModeModeInfo *mode;
>  	struct kms_t kms;
> +	bool selected_primary_fmt;
> +	bool selected_overlay_a_fmt;
> +	bool selected_overlay_b_fmt;
> +	bool selected_writeback_fmt;
>  };

Hi Arthur!

Nice work, for the next iteration of my series I will use this to run 
a full test, thanks!

If I understand correclty, when you "pin" a format, it will always use the 
first available? It's not possible to say "I want to test NV24"?

Do you think it will be difficult to add this kind of option (like 
--writeback-format in kms_writeback)?

Kind regards,
Louis Chauvet

>  static void plane_setup(struct plane_t *plane, int index)
> @@ -243,45 +248,87 @@ static void stress_driver(struct data_t *data)
>  	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
>  }
>  
> -static struct kms_t default_kms = {
> -	.crtc = {
> -		.width = 4096, .height = 2160,
> -	},
> -	.primary = {
> -		.rect = {
> -			.x = 101, .y = 0,
> -			.width = 3639, .height = 2160,
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	struct data_t *data = _data;
> +	struct kms_t *kms =  &data->kms;
> +
> +	switch (opt) {
> +	case 'p':
> +		kms->primary.format = igt_drm_format_str_to_format(optarg);
> +		data->selected_primary_fmt = true;
> +		break;
> +	case 'a':
> +		kms->overlay_a.format = igt_drm_format_str_to_format(optarg);
> +		data->selected_overlay_a_fmt = true;
> +		break;
> +	case 'b':
> +		kms->overlay_b.format = igt_drm_format_str_to_format(optarg);
> +		data->selected_overlay_b_fmt = true;
> +		break;
> +	case 'w':
> +		kms->writeback.format = igt_drm_format_str_to_format(optarg);
> +		data->selected_writeback_fmt = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char *help_str =
> +	"  --primary-format\t\tPin the primary plane format\n"
> +	"  --overlay-a-format\t\tPin the overlay A plane format\n"
> +	"  --overlay-b-format\t\tPin the overlay B plane format\n"
> +	"  --writeback-format\t\tPin the writeback format\n";
> +
> +static const struct option long_options[] = {
> +	{ .name = "primary-format", .has_arg = true, .val = 'p'},
> +	{ .name = "overlay-a-format", .has_arg = true, .val = 'a'},
> +	{ .name = "overlay-b-format", .has_arg = true, .val = 'b'},
> +	{ .name = "writeback-format", .has_arg = true, .val = 'w'},
> +	{}
> +};
> +
> +static struct data_t data = (struct data_t){
> +	.kms = {
> +			.crtc = {
> +				.width = 4096, .height = 2160,
> +			},
> +		.primary = {
> +			.rect = {
> +				.x = 101, .y = 0,
> +				.width = 3639, .height = 2160,
> +			},
>  		},
> -	},
> -	.overlay_a = {
> -		.rect = {
> -			.x = 201, .y = 199,
> -			.width = 3033, .height = 1777,
> +		.overlay_a = {
> +			.rect = {
> +				.x = 201, .y = 199,
> +				.width = 3033, .height = 1777,
> +			},
>  		},
> -	},
> -	.overlay_b = {
> -		.rect = {
> -			.x = 1800, .y = 250,
> -			.width = 1507, .height = 1400,
> +		.overlay_b = {
> +			.rect = {
> +				.x = 1800, .y = 250,
> +				.width = 1507, .height = 1400,
> +			},
>  		},
> -	},
> -	.writeback = {
> -		.rect = {
> -			.x = 0, .y = 0,
> -			// Size is to be determined at runtime
> +		.writeback = {
> +			.rect = {
> +				.x = 0, .y = 0,
> +				// Size is to be determined at runtime
> +			},
>  		},
>  	},
>  };
>  
> -
> -igt_simple_main
> +igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
>  {
> -	struct data_t data = {0};
>  	size_t primary_fmt_count = 0;
>  	size_t overlay_a_fmt_count = 0;
>  	size_t overlay_b_fmt_count = 0;
> -
> -	data.kms = default_kms;
> +	size_t wb_fmt_count = 0;
>  
>  	data.fd = drm_open_driver_master(DRIVER_ANY);
>  
> @@ -314,37 +361,48 @@ igt_simple_main
>  								  DRM_PLANE_TYPE_OVERLAY, 1);
>  	igt_assert(data.kms.overlay_b.base != NULL);
>  
> -	primary_fmt_count = data.kms.primary.base->format_mod_count;
> -	overlay_a_fmt_count = data.kms.overlay_a.base->format_mod_count;
> -	overlay_b_fmt_count = data.kms.overlay_b.base->format_mod_count;
> +	primary_fmt_count = data.selected_primary_fmt ?
> +			    1 : data.kms.primary.base->format_mod_count;
> +	overlay_a_fmt_count = data.selected_overlay_a_fmt ?
> +			      1 : data.kms.overlay_a.base->format_mod_count;
> +	overlay_b_fmt_count = data.selected_overlay_b_fmt ?
> +			      1 : data.kms.overlay_b.base->format_mod_count;
> +	wb_fmt_count = data.selected_writeback_fmt ? 1 : data.wb_fmt_count;
>  
>  	for (size_t i = 0;
>  	     i < primary_fmt_count *
>  		 overlay_a_fmt_count *
>  		 overlay_b_fmt_count *
> -		 data.wb_fmt_count;
> +		 wb_fmt_count;
>  	     i++) {
>  		size_t p = (i / (overlay_a_fmt_count *
>  				 overlay_b_fmt_count *
> -				 data.wb_fmt_count)) % primary_fmt_count;
> +				 wb_fmt_count)) % primary_fmt_count;
>  
>  		size_t a = (i / (overlay_b_fmt_count *
> -				 data.wb_fmt_count)) % overlay_a_fmt_count;
> +				 wb_fmt_count)) % overlay_a_fmt_count;
> +
> +		size_t b = (i / wb_fmt_count) % overlay_a_fmt_count;
> +
> +		size_t w = i % wb_fmt_count;
> +
> +		if (data.selected_primary_fmt == false)
> +			data.kms.primary.format = data.kms.primary.base->formats[p];
>  
> -		size_t b = (i / data.wb_fmt_count) % overlay_a_fmt_count;
> +		if (data.selected_overlay_a_fmt == false)
> +			data.kms.overlay_a.format = data.kms.overlay_a.base->formats[a];
>  
> -		size_t w = i % data.wb_fmt_count;
> +		if (data.selected_overlay_b_fmt == false)
> +			data.kms.overlay_b.format = data.kms.overlay_b.base->formats[b];
>  
> -		data.kms.primary.format = data.kms.primary.base->formats[p];
> -		data.kms.overlay_a.format = data.kms.overlay_a.base->formats[a];
> -		data.kms.overlay_b.format = data.kms.overlay_b.base->formats[b];
> -		data.kms.writeback.format = data.wb_formats[w];
> +		if (data.selected_writeback_fmt == false)
> +			data.kms.writeback.format = data.wb_formats[w];
>  
>  		igt_info("formats: primary: %zu/%zu overlay_a: %zu/%zu overlay_b: %zu/%zu writeback: %zu/%zu\n",
>  			 p + 1, primary_fmt_count,
>  			 a + 1, overlay_a_fmt_count,
>  			 b + 1, overlay_b_fmt_count,
> -			 w + 1, data.wb_fmt_count);
> +			 w + 1, wb_fmt_count);
>  
>  		stress_driver(&data);
>  	}
> 
> -- 
> 2.43.0
> 
