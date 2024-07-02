Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A468C3064D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 05:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41B810E0EC;
	Tue,  2 Jul 2024 05:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt2KfYs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E6E10E0EC
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719899839; x=1751435839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rUDCZVaa6Fvzt/YuK/rIvL6ZKXcn20UjMp3wZjW5MPc=;
 b=Yt2KfYs8JMXgSzqh2t7GUz/xMhb6wSYneAoYBQ4v+AFf4YlLcj3UMug0
 UVWNvvi6se+Dadm5o7II/hziy9eKJ14EOxWBzbLOQRf990486iDpKWhC2
 uTmNIvcFJ+QKwyglBGJvmmJs8UgRNR43uOelpAgl+gCQoz3ot2RlBEBAj
 rI8PfUO7RYB/DV1XkoYUzy+VGYpppBjzw/oOQaEvLozvOnbO/u7+5Bw0T
 7GXhjo3tEUApW+L6U0K0ufoml3v+ORLYm/MrhlE2+Yipy6IXp0F+FJMog
 kXFacWhhgVRVDBcUV9Is/b5tFa/UQwT8Y2tFrOZDZXOcINHyUhaL9ZP5J g==;
X-CSE-ConnectionGUID: jEL3ioJnQLmaNOtce2yo2g==
X-CSE-MsgGUID: 5oda3y3PRVCA0kLqpWH/Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16778663"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="16778663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 22:57:18 -0700
X-CSE-ConnectionGUID: jvtWvHNmTJWviw21pibIPA==
X-CSE-MsgGUID: RpgrWQoeQOqzcAp4JDoyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50127940"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 22:57:17 -0700
Date: Tue, 2 Jul 2024 07:57:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/6] tests/kms_big_fb: Use igt_fb_create_intel_buf()
Message-ID: <20240702055713.gkn5xmqwt3deh3zl@zkempczy-mobl2>
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
 <20240625174032.10398-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625174032.10398-3-ville.syrjala@linux.intel.com>
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

On Tue, Jun 25, 2024 at 08:40:28PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Use igt_fb_create_intel_buf() instead of hand rolling something
> similar but less capable (igt_fb_create_intel_buf() handles
> planar and compressed formats, the hand rolled version does not).
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_big_fb.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 605813f7fd2e..1838ee6261ae 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -188,32 +188,7 @@ static struct intel_buf *init_buf(data_t *data,
>  				  const struct igt_fb *fb,
>  				  const char *buf_name)
>  {
> -	struct intel_buf *buf;
> -	enum intel_driver driver = buf_ops_get_driver(data->bops);
> -	uint32_t name, handle, tiling, width, height, bpp, size;
> -	uint64_t region = driver == INTEL_DRIVER_XE ?
> -				vram_if_possible(data->drm_fd, 0) : -1;
> -
> -	igt_assert_eq(fb->offsets[0], 0);
> -
> -	tiling = igt_fb_mod_to_tiling(fb->modifier);
> -	bpp = fb->plane_bpp[0];
> -	size = fb->size;
> -	width = fb->strides[0] / (bpp / 8);
> -	height = fb->height;
> -
> -	name = gem_flink(data->drm_fd, fb->gem_handle);
> -	handle = gem_open(data->drm_fd, name);
> -	buf = intel_buf_create_full(data->bops, handle, width, height,
> -				    bpp, 0, tiling, 0, size, 0,
> -				    region,
> -				    intel_get_pat_idx_uc(data->drm_fd),
> -				    DEFAULT_MOCS_INDEX);
> -
> -	intel_buf_set_name(buf, buf_name);
> -	intel_buf_set_ownership(buf, true);
> -
> -	return buf;
> +	return igt_fb_create_intel_buf(data->drm_fd, data->bops, fb, buf_name);

IMO this patch looks ok. Only doubt I've found is inside
igt_fb_create_intel_buf() function, which uses intel_get_pat_idx_uc()
what's incorrect for compressed buffers on Xe2+. I need to take a look
to kms_ccs where this function is used.

For this change:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  static void fini_buf(struct intel_buf *buf)
> -- 
> 2.44.2
> 
