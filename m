Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827B7C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 19:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315C710F2DA;
	Thu,  1 Feb 2024 19:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NdNRTaiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7044C10F2C2
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 19:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814467; x=1738350467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oG6tKK2q0rHCpS50py9Jd7ZAAxVgaOWBjFQi1A2EcjA=;
 b=NdNRTaiW1FUMA1S2DITOBxfLp1JfA5DHcoOiqZUxnipf99mS8e3oWYly
 d3t5hyWMdyeaCp6yEV91JBXuA90XgChuJOxMSNyg2vjKqLrDR/ScVut70
 Wi7gzUcXuL9HlBgvQmrNWW0oBFe7YgPZBLwgPad9MIwBOw53DLcu0RJYr
 k6y3xNMJdu1VkqGEsztakFg2aoaEN4jsFeNcFsi8dKwpF65O9a3OGgWzc
 +kj7hz7UFOp+W/BFfmtJw882K9F/EKc0HLZMKmm0cLbc7vY3lxzlghNm0
 buegVGenZ1YJvVcjC5vR+kqfp0X9yBoIGjEix8CbB1rALxJmLBYMBd7rT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="401105374"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="401105374"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="1120032494"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="1120032494"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:07:45 -0800
Date: Thu, 1 Feb 2024 20:07:43 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>
Subject: Re: [PATCH i-g-t v4 1/5] lib/intel_blt: Add helpers for calculating
 stride and aligned height
Message-ID: <20240201190743.wibcwwv6gfo346ub@zkempczy-mobl2>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-2-zbigniew.kempczynski@intel.com>
 <6243f689-5697-434b-bfb7-b1f3689d6ab8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6243f689-5697-434b-bfb7-b1f3689d6ab8@intel.com>
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

On Thu, Feb 01, 2024 at 01:05:20PM +0100, Karolina Stolarek wrote:
> On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> > Tiled surfaces have stride / aligned height constraints. Currently
> > blt library has limitation and doesn't work properly when surface
> > stride is not valid for specific tiling.
> > 
> > As an example lets say we want to copy from linear to xmajor
> > 33 x 33 x 32bpp surface. Xmajor surface expects stride aligned to
> > 512 bytes and height to 8 rows so this surface will occupy 512B x 40
> > (128 x 40 x 32 bpp).
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> 
> Just a bunch of nits, nothing major.
> 
> > ---
> > v2: Fix stride/aligned height calculation for Tile64
> > v3: Fix stride calculation for xmajor
> >      Make helpers public (fixes compilation warning due to lack
> >      or static function users)
> > ---
> >   lib/intel_blt.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
> >   lib/intel_blt.h |  4 ++++
> >   2 files changed, 68 insertions(+)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 25d251c4f8..13b1dbba4f 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -521,6 +521,70 @@ static int __block_tiling(enum blt_tiling_type tiling)
> >   	return 0;
> >   }
> > +/**
> > + * blt_get_min_stride
> > + * @width: width in pixels
> > + * @bpp: bits per pixel
> > + * @tiling: tiling
> > + *
> > + * Function returns minimum posibble stride in bytes for width, bpp and tiling.
> 
> "return" is already described, we could say "calculates minimum possible
> stride..."

Agree, repeating same looks odd.

> 
> > + *
> > + * Returns:
> > + * minimum possible stride in bytes.
> > + */
> > +uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
> > +			    enum blt_tiling_type tiling)
> > +{
> > +	switch (tiling) {
> > +	case T_LINEAR:
> > +		return width * bpp / 8;
> > +	case T_XMAJOR:
> > +		return ALIGN(width * bpp / 8, 512);
> > +	case T_TILE64:
> > +		if (bpp == 8)
> > +			return ALIGN(width, 256);
> > +		else if (bpp == 16 || bpp == 32)
> > +			return ALIGN(width * bpp / 8, 512);
> > +		return ALIGN(width * bpp / 8, 1024);
> > +
> > +	default:
> > +		return ALIGN(width * bpp / 8, 128);
> > +	}
> > +}
> > +
> > +/**
> > + * blt_get_aligned_height
> > + * @height: height in pixels
> > + * @bpp: bits per pixel (used for Tile64 due to different tile organization
> > + * in pixels)
> > + * @tiling: tiling
> > + *
> > + * Function returns aligned height for specific tiling. Height returned is
> > + * important from memory allocation perspective, because each tiling has
> > + * specific memory constraints.
> 
> I'd move the comment on Tile64 to the description body and integrate it
> with the last sentence. You could say that each tiling has constrains
> dependent on bpp and mention a different pixel order for Tile64 as an
> example.

I've added some note about Tile64 to commit message to explain why
we need to pass bpp either.

Thanks for the review.

> 
> Apart from that, it's looking good to me:
> 
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

R-b taken.

--
Zbigniew
> 
> > + *
> > + * Returns:
> > + * height (rows) expected for specific tiling
> > + */
> > +uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
> > +				enum blt_tiling_type tiling)
> > +{
> > +	switch (tiling) {
> > +	case T_LINEAR:
> > +		return height;
> > +	case T_XMAJOR:
> > +		return ALIGN(height, 8);
> > +	case T_TILE64:
> > +		if (bpp == 8)
> > +			return ALIGN(height, 256);
> > +		else if (bpp == 16 || bpp == 32)
> > +			return ALIGN(height, 128);
> > +		return ALIGN(height, 64);
> > +	default:
> > +		return ALIGN(height, 32);
> > +	}
> > +}
> > +
> >   static int __special_mode(const struct blt_copy_data *blt)
> >   {
> >   	if (blt->src.handle == blt->dst.handle &&
> > diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> > index d9be22fdf4..e3084dc0cd 100644
> > --- a/lib/intel_blt.h
> > +++ b/lib/intel_blt.h
> > @@ -212,6 +212,10 @@ bool blt_block_copy_supports_compression(int fd);
> >   bool blt_uses_extended_block_copy(int fd);
> >   const char *blt_tiling_name(enum blt_tiling_type tiling);
> > +uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
> > +			    enum blt_tiling_type tiling);
> > +uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
> > +				enum blt_tiling_type tiling);
> >   void blt_copy_init(int fd, struct blt_copy_data *blt);
