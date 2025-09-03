Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24748CA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 16:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B5910E8F4;
	Wed,  3 Sep 2025 16:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfujuxo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDB810E8F4
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756917897; x=1788453897;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NLgtRO6T1vKBsLu9K/ch7F31M69q47q2hvnZytQ4SHc=;
 b=jfujuxo6QQpWm4R1Y2vmLhALgB/kjByfNO+A8u6FCZy2mk1NxT6H3KKw
 abedP9nm+CEm8ldBLlCWK47kgVXqoq4WI5HhdyhaRt9HE2D5qwh0RAhDN
 OjowS3Hi3jAvxoiL9fYfcKy/UK88Bj9jlFpHA6gK8gwe3XaLmWxo+sIq9
 G6VoB5OT5zv9dAlL+xmkVeV8Ce+HPqJuFNhQpQ0rzIuqUGKhXm27mv24F
 HVYQnmBmy5TeMeBkWTE14n2FYHyNWQ8S/LqDdpkI7BsUir9lcn8A7J7Sk
 iM1yAv7dRJw1tH24i3XWfpXfLGTp3x/zHOw94aYduDvskQwXNWjNxzxt8 g==;
X-CSE-ConnectionGUID: elMA16gRR7uitmnUKzd1rQ==
X-CSE-MsgGUID: 1ehsvAObTqKjDEvhFaMBXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59307443"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59307443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 09:44:56 -0700
X-CSE-ConnectionGUID: d8bUtp2mS1S42FRS93lYBA==
X-CSE-MsgGUID: ScKJ040WTs6zR8w4fqyHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171579297"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 09:44:55 -0700
Date: Wed, 3 Sep 2025 18:44:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH V10 07/30] lib/igt_fb: Add igt_copy_fb function
Message-ID: <20250903164452.4tmvalxbk6rgui4i@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-8-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815040659.3321102-8-alex.hung@amd.com>
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

Hi Alex,
On 2025-08-14 at 22:06:36 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Add a function to copy fb of DRM_FORMAT_XRGB8888.
> 

+cc Karthik and Juha-Pekka
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>

> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_fb.c | 33 +++++++++++++++++++++++++++++++++
>  lib/igt_fb.h |  1 +
>  2 files changed, 34 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 45692b170..8c8436e94 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2170,6 +2170,39 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>  					  fb, 0, 0);
>  }
>  
> +unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
> +{
> +	char *in_ptr, *out_ptr;
> +	int cpp = igt_drm_format_to_bpp(src->drm_format) / 8;

Why setup it here?

> +	int fb_id = 0;
> +
> +	igt_assert(src);

cpp setup above whould trigger before this assert if src==NULL

> +
> +	/* TODO allow multiple planes */
> +	if (src->num_planes != 1)
> +		return -EINVAL;

return type is unsigned, maybe use bool instead?

> +
> +	/* TODO expand for other formats */
> +	if (src->drm_format != DRM_FORMAT_XRGB8888)
> +		return -EINVAL;

Same here.

Regards,
Kamil

> +
> +	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
> +			      src->modifier, fb);
> +
> +	/* copy buffer contents */
> +	in_ptr = igt_fb_map_buffer(fb->fd, src);
> +	igt_assert(in_ptr);
> +	out_ptr = igt_fb_map_buffer(fb->fd, fb);
> +	igt_assert(out_ptr);
> +
> +	igt_memcpy_from_wc(out_ptr, in_ptr, fb->width * fb->height * cpp);
> +
> +	igt_fb_unmap_buffer(fb, out_ptr);
> +	igt_fb_unmap_buffer(src, in_ptr);
> +
> +	return fb_id;
> +}
> +
>  /**
>   * igt_create_color_fb:
>   * @fd: open drm file descriptor
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index fe0bb580c..b2176558b 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -141,6 +141,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>  					  const struct igt_fb *fb, const char *name);
>  unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>  			   uint64_t modifier, struct igt_fb *fb);
> +unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
>  unsigned int igt_create_color_fb(int fd, int width, int height,
>  				 uint32_t format, uint64_t modifier,
>  				 double r, double g, double b,
> -- 
> 2.43.0
> 
