Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB8CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 11:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCC110E102;
	Tue,  4 Nov 2025 11:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwfZBXkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ACD10E5D7
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762256063; x=1793792063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o9i6QqOMi9FblT+pDiCRzC6PUjnV4ebs3pqdmdLg5jA=;
 b=iwfZBXkTEXq48VxG8/OkaUc/T7YNA0XqPKSSa9Zr2OUdEvJuWVwMUqad
 IRqjxLEZQd1k83EjXwKv5GjOeXf6SnN9Fvsjp1VIFYgVAvZ7164B35b2x
 ve/nSQr225EZuN2u1fFr51LPjCHQ8IWEidYeTx0kH34S/gXhkNZfv6WxP
 bzSDiDehZPVxK7qexrFSBOoda98rKpxD1G8XmGP0dhgPG7JA7qFSFiEtj
 gJpNz4Grkty0zrO/VSsFAnc97pRG0PXnFhqwqVOtFS+bsBWn3touXZq8+
 5+LRtNtgKgd7gR+4ygrTego4ToqgtUCllzgL9qGA9V40pUqQhfReJiyFr A==;
X-CSE-ConnectionGUID: q5q9QYHpQqOleP0Wzsaa6w==
X-CSE-MsgGUID: 0VLnsaZNTh+tByyUxGT2kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64498600"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64498600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:34:23 -0800
X-CSE-ConnectionGUID: 8RU8/r5QR4W8cB2lAgqVKQ==
X-CSE-MsgGUID: rIVLbOAyQ46gdkVOX7qPJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187085134"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 03:34:21 -0800
Date: Tue, 4 Nov 2025 12:34:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sowmiya S <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v1 2/8] tests/kms_writeback: Validate supported
 formats lib/igt_fb: Validate supported formats for crc calculation
Message-ID: <20251104113419.4jiu2ptcrxss4lqy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org,
 karthik.b.s@intel.com, swati2.sharma@intel.com
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251103103842.3025204-3-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103103842.3025204-3-sowmiya.s@intel.com>
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

Hi Sowmiya,
On 2025-11-03 at 16:08:36 +0530, Sowmiya S wrote:

you repeated twice subject:

[PATCH i-g-t v1 2/8] tests/kms_writeback: Validate supported
 formats lib/igt_fb: Validate supported formats for crc calculation

> Add logic to verify that provided formats
> are supported before proceeding with test execution

It could help here if you will write down which additional
format(s) you actually excluded.

Regards,
Kamil

> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_fb.c          |  6 ++++--
>  tests/kms_writeback.c | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 60853b0af..e97b31889 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4960,7 +4960,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
>  	if (fb->num_planes != 1)
>  		return -EINVAL;
>  
> -	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
> +	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
> +	    fb->drm_format != DRM_FORMAT_XBGR8888)
>  		return -EINVAL;
>  
>  	ptr = igt_fb_map_buffer(fb->fd, fb);
> @@ -4987,7 +4988,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
>  		for (x = 0; x < fb->width; x++) {
>  			uint32_t pixel = le32_to_cpu(line[x]);
>  
> -			if (fb->drm_format == DRM_FORMAT_XRGB8888)
> +			if (fb->drm_format == DRM_FORMAT_XRGB8888 ||
> +			    fb->drm_format == DRM_FORMAT_XBGR8888)
>  				pixel &= 0x00ffffff;
>  			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
>  				pixel &= 0x3fffffff;
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index de0f67a58..9523c24b8 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -299,7 +299,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
>  	uint32_t *ptr;
>  	int64_t pixel_count, i;
>  
> -	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
> +	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 ||
> +		   fb->drm_format == DRM_FORMAT_XRGB2101010 ||
> +		   fb->drm_format == DRM_FORMAT_XBGR8888 ||
> +		   fb->drm_format == DRM_FORMAT_XBGR2101010);
>  
>  	ptr = igt_fb_map_buffer(fb->fd, fb);
>  	igt_assert(ptr);
> @@ -420,7 +423,12 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
>  static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t *in_fb,
>  			      igt_fb_t *out_fb)
>  {
> -	uint32_t in_fb_color = 0xffff0000;
> +	uint32_t in_fb_color;
> +
> +	if (data.format == DRM_FORMAT_XRGB8888 || data.format == DRM_FORMAT_XBGR8888)
> +		in_fb_color = 0xffff0000;
> +	else
> +		in_fb_color = 0x3ff00000;
>  
>  	fill_fb(in_fb, in_fb_color);
>  
> -- 
> 2.43.0
> 
