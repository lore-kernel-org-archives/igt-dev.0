Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518B5C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F312010EAD2;
	Fri, 19 Apr 2024 14:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iw6JqyTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1210EAAD
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713537998; x=1745073998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LiW3tIfOxxkYrbJxgRukGe6rFK+oHlf8bASbc5G+Ad0=;
 b=iw6JqyTUNqip4pD1GV9O7OQSUBXiBepZB1obtfWh9xTa22SUufZq6wAx
 fG/wPYKGrXud5Wc/8nTUmn4qnKJYiCt/hqrDCGqfGP9nHYNk8i/UwnGAs
 l9fQXM/1ouBviX+5/rdN94AAS1OCYpj43ZOKdxQt+JVIcdZTETXp6X5H3
 2FnieJxjTKsPPROv1tLPC/qTxlB8CzOnkn3hF8D7I8EBg8h9sMtw9J7wE
 xa8ZZSiAocCwDmu1nVyxC7P2mgIy6Dniw5LTS7M8U7sjMP9WDu9NULmUP
 6HfC3kXqKFGsJm+3IoMIWwkgDKq9JkRV1LbqmomDQuwXfWkYl4qHe6/gh g==;
X-CSE-ConnectionGUID: XVQjrTRDQDqOInNCmla6Kg==
X-CSE-MsgGUID: BC0zmOT9Rva+l/ggmHFT7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9062446"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9062446"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:46:37 -0700
X-CSE-ConnectionGUID: CxR/l4fvSCOmzfJ7Wxk0bQ==
X-CSE-MsgGUID: LdWa+8nfSu+A5X8xus4tXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23420342"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:46:35 -0700
Date: Fri, 19 Apr 2024 16:46:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v4 3/7] benchmarks/kms_fb_stress: Separate the
 benchmark in a subtest
Message-ID: <20240419144632.bbyh3qwrf3oexect@kamilkon-DESK.igk.intel.com>
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
 <20240411-kms_fb_stress-dev-v4-3-7a8f3a419ebb@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411-kms_fb_stress-dev-v4-3-7a8f3a419ebb@riseup.net>
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
On 2024-04-11 at 15:51:13 -0300, Arthur Grillo wrote:
> In the future, we want to add more tests to this. So move the stress
> procedure to its own subtest.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 138 +++++++++++++++++++++++++--------------------
>  1 file changed, 78 insertions(+), 60 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 8d4707f5a8c0..bc548fae61f8 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -128,6 +128,51 @@ static void set_crtc_size(struct data_t *data)
>  	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
>  }
>  
> +static void stress_driver(struct data_t *data)
> +{
> +	struct timespec then, now;
> +	double elapsed;
> +
> +	igt_info("KMS structure:\n");
> +	igt_info("\tCRTC:\n");
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.crtc));
> +	igt_info("\tprimary:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.primary.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.primary.rect));
> +	igt_info("\toverlay A:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
> +	igt_info("\toverlay B:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
> +	igt_info("\twriteback:\n");
> +	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.writeback.format));
> +	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.writeback.rect));
> +
> +	gen_fbs(data);
> +
> +	igt_assert_eq(igt_gettime(&then), 0);
> +
> +	for (int i = 0; i < FRAME_COUNT; i++) {
> +		int fb_index = i % NUM_FBS;
> +
> +		plane_setup(&data->kms.primary, fb_index);
> +
> +		plane_setup(&data->kms.overlay_a, fb_index);
> +
> +		plane_setup(&data->kms.overlay_b, fb_index);
> +
> +		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
> +
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	igt_assert_eq(igt_gettime(&now), 0);
> +	elapsed = igt_time_elapsed(&then, &now);
> +
> +	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
> +}
> +
>  static struct kms_t default_kms = {
>  	.crtc = {
>  		.width = 4096, .height = 2160,
> @@ -162,82 +207,55 @@ static struct kms_t default_kms = {
>  	},
>  };
>  
> +static struct data_t data;

Why global here? You pass it as pointer. Rest looks good.

Regards,
Kamil

>  
> -igt_simple_main
> +igt_main
>  {
> -	struct data_t data = {0};
> -	struct timespec then, now;
> -	double elapsed;
> -
> -	data.kms = default_kms;
> -
> -	data.fd = drm_open_driver_master(DRIVER_ANY);
> -
> -	kmstest_set_vt_graphics_mode();
> +	igt_fixture {
> +		data.kms = default_kms;
>  
> -	igt_display_require(&data.display, data.fd);
> -	igt_require(data.display.is_atomic);
> +		data.fd = drm_open_driver_master(DRIVER_ANY);
>  
> -	igt_display_require_output(&data.display);
> +		igt_display_require(&data.display, data.fd);
>  
> -	igt_display_reset(&data.display);
> -
> -	data.wb_output = find_wb_output(&data);
> -	igt_require(data.wb_output);
> -	set_wb_pipe(&data);
> -
> -	set_crtc_size(&data);
> -
> -	gen_fbs(&data);
> -
> -	igt_info("KMS structure:\n");
> -	igt_info("\tCRTC:\n");
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.crtc));
> -	igt_info("\tprimary:\n");
> -	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.primary.format));
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.primary.rect));
> -	igt_info("\toverlay A:\n");
> -	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_a.format));
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_a.rect));
> -	igt_info("\toverlay B:\n");
> -	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_b.format));
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_b.rect));
> -	igt_info("\twriteback:\n");
> -	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.writeback.format));
> -	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.writeback.rect));
> +		kmstest_set_vt_graphics_mode();
>  
> -	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_assert(data.kms.primary.base != NULL);
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
>  
> -	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
> -								  DRM_PLANE_TYPE_OVERLAY, 0);
> -	igt_assert(data.kms.overlay_a.base != NULL);
> +		igt_display_require_output(&data.display);
>  
> -	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
> -								  DRM_PLANE_TYPE_OVERLAY, 1);
> -	igt_assert(data.kms.overlay_b.base != NULL);
> +		igt_display_reset(&data.display);
>  
> -	igt_assert_eq(igt_gettime(&then), 0);
> +		data.wb_output = find_wb_output(&data);
> +		igt_require(data.wb_output);
> +		set_wb_pipe(&data);
>  
> -	for (int i = 0; i < FRAME_COUNT; i++) {
> -		int fb_index = i % NUM_FBS;
> +		set_crtc_size(&data);
>  
> -		plane_setup(&data.kms.primary, fb_index);
> +		data.kms.primary.base = igt_output_get_plane_type(data.wb_output,
> +								  DRM_PLANE_TYPE_PRIMARY);
> +		igt_assert(data.kms.primary.base != NULL);
>  
> -		plane_setup(&data.kms.overlay_a, fb_index);
> +		data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
> +									  DRM_PLANE_TYPE_OVERLAY,
> +									  0);
> +		igt_assert(data.kms.overlay_a.base != NULL);
>  
> -		plane_setup(&data.kms.overlay_b, fb_index);
> +		data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
> +									  DRM_PLANE_TYPE_OVERLAY,
> +									  1);
> +		igt_assert(data.kms.overlay_b.base != NULL);
> +	}
>  
> -		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb_index]);
> +	igt_subtest("default-stress") {
> +		stress_driver(&data);
>  
> -		igt_display_commit2(&data.display, COMMIT_ATOMIC);
>  	}
>  
> -	igt_assert_eq(igt_gettime(&now), 0);
> -	elapsed = igt_time_elapsed(&then, &now);
> -
> -	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
>  
> -	igt_display_fini(&data.display);
> -	drm_close_driver(data.fd);
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
>  }
> 
> -- 
> 2.44.0
> 
