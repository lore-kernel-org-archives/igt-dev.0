Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18F1C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 08:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEBC10EE27;
	Wed, 22 May 2024 08:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="diMVXB0S";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FFB10EE27
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 08:39:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9A43BC5702
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 08:39:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E37F420002;
 Wed, 22 May 2024 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716367159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHRnOamMzEj4128dr3Clbt4KE+anRf7/LAGr8HkuWW8=;
 b=diMVXB0SOPFwYKfGcITJIZ1pphNywDHN++WKa+BhXeU9oNIsu9YpaLgSXEdwaWPjKa8lLR
 JU5ekG1lWQ6lprPAVv6Mr3B+PQkFg7IZLbZpcVA7aY5cjGu/pbQvZU8FEJMdG6WviZqW5V
 5HQ43WESj3AsHGbVYz0+nP2kuil9jUlPUZV6o1krWWRQjKNcRR/ih8gONmch2WQGa7GVh7
 zohSJqDH7lZW/xibSlHBFIwAxBwJjoRdzLI3tzC7biIKSZcbgaClCRZJ4zrV/igorUdxvA
 EmkACA8eQN8VADeur0hRCgMdx8c3t50Xlkwn9dS++A6DmXxZb6Yv5KReyBOgAQ==
Date: Wed, 22 May 2024 10:39:17 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 6/8] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is not supported by Pixman
Message-ID: <Zk2vNa7nhjEy1Vw7@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-6-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-6-0c577163dc88@riseup.net>
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

Le 22/04/24 - 19:18, Arthur Grillo a écrit :
> Pixman requires strides to be divisible by sizeof(uint32_t).
> So, don't paint the FB's if the stride is not.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index e028424bb3e4..8775fabdd164 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -48,10 +48,24 @@ static void plane_setup(struct plane_t *plane, int index)
>  
>  static void create_fb(int fd, struct plane_t *plane, int fb_index, double r, double g, double b)
>  {
> -	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
> -			    plane->format, DRM_FORMAT_MOD_LINEAR,
> -			    r, g, b,
> -			    &plane->fbs[fb_index]);
> +	unsigned int stride;
> +
> +	igt_calc_fb_size(fd, plane->rect.width, plane->rect.height,
> +			 plane->format, DRM_FORMAT_MOD_LINEAR,
> +			 NULL, &stride);
> +
> +	if (stride % sizeof(uint32_t) == 0) {
> +		igt_create_color_fb(fd,
> +				    plane->rect.width, plane->rect.height,
> +				    plane->format, DRM_FORMAT_MOD_LINEAR,
> +				    r, g, b,
> +				    &plane->fbs[fb_index]);
> +	} else {
> +		igt_create_fb(fd,
> +			      plane->rect.width, plane->rect.height,
> +			      plane->format, DRM_FORMAT_MOD_LINEAR,
> +			      &plane->fbs[fb_index]);
> +	}
>  }

Can you also add a check for YUV formats with subsampling? The DRM core 
expects a YUV format with subsampling to have an odd number of pixels, so 
the benchmark was failing on vkms.

Sorry for the late review,
Louis Chauvet
  
>  static void gen_fbs(struct data_t *data)
> 
> -- 
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
