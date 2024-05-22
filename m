Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D66C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 08:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3563C10E0DF;
	Wed, 22 May 2024 08:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FRrRuaD4";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D646F10E0DF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 08:51:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EA00E0009;
 Wed, 22 May 2024 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716367912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jF0u85u46n7ERcIm0i15R9gk2ziT13IckNtC+yDTsQg=;
 b=FRrRuaD43d/zcIw+/WXZBNCJFQyXg5rtVjyc6dsMVNay+bquXDbZuAF6KLc+ahrcap6xFt
 D8N01zju+cswWaM/H5AC4pL6h2w9daiWETlKOCM1mIgb7qJDSFvx4fAYZ3um1WsHIqmMne
 QdvENpfkKwqu6vc7qHWmkO/yc/6CnCa0e4Hw+0mhcUd2x+UKmZu05nFECvZGpRZ0FCeJqJ
 QclUV4TpZPE6eEF/2XGvNnrCHtRJPSo5gB6Da53CbnhOd4M5L6o6QjjzggEZAQcBM5lrPm
 ty13iyxOW68IvNcFc9IdVXHfPYceNguEaQQjVCtyxgNWn4daTa4znxGOl4Jc/w==
Date: Wed, 22 May 2024 10:51:50 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 2/8] benchmarks/kms_fb_stress: Log the KMS
 structure
Message-ID: <Zk2yJu0ow22TR0Gb@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-2-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-2-0c577163dc88@riseup.net>
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
> In the future, the KMS structure could be dynamically changed. So, log
> the KMS structure to the user.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index e9c051318ed6..8d4707f5a8c0 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -8,6 +8,9 @@
>  #define FRAME_COUNT 100
>  #define NUM_FBS 2
>  
> +#define RECT_FMT "%dx%d%+d%+d"
> +#define RECT_ARG(r) (r)->width, (r)->height, (r)->x, (r)->y
> +
>  struct rect_t {
>  	int x, y;
>  	int width, height;
> @@ -187,6 +190,22 @@ igt_simple_main
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
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
