Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F604606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OdSxW84U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38A810E402;
	Mon, 23 Nov 2026 09:34:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9940B10E402
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426393; x=1826962393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xjXcgR848OHMYIly1uFQj27TFd/Q6U2KQnoK7BEg19k=;
 b=OdSxW84UzGLLFJdfYguak1Tzsfemr6/vjVYiLsZg9vUpJpL5SE10HX7Y
 Jq9e7FmeI5thrBa7Il9LZ54IgsyoQ1hAz2B+TYWAfLfiUEJa7L4yNoESM
 grByuny++FhaXUWO2pHov+g/XeMJYlnY5KBYwySNfKfpGUY8XRZPeRpo0
 zN0EQxRuweGE7LFS+ZdysUprwXykgtRf4x/Vl1XJUwMxz+LQUe1RTG4XN
 lsOTysg72eFnxKLy86DQCKm9y64Fer7dOtf+tTtOOAhs06exTpWq/+1AT
 rWCX9lVkwW+WteswrKWYbYcfjotQxgIiW91eBilJKaxvIvTdnw70056bC g==;
X-CSE-ConnectionGUID: XqqDYmMJTMWJKGTAo8UitQ==
X-CSE-MsgGUID: aBea9HZpQqKdMVE4Iubchg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4215174"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4215174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:33:12 -0800
X-CSE-ConnectionGUID: mzxpis8nSsuPIABzsH3VPw==
X-CSE-MsgGUID: R2ylTC6gTO68A5c7je8a5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11614867"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:33:11 -0800
Date: Mon, 23 Nov 2026 10:33:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/intel_bufops: Add support for Tile64 in
 software.
Message-ID: <cjcjjiak5zt4ju75ebs7gsqcatptfsviia7tgtho4lvnxapk35@hygai6ivnzd4>
References: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
 <20261118122619.206753-5-zbigniew.kempczynski@intel.com>
 <6c8f3b7f-1885-470a-8893-0cf60148f8f8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c8f3b7f-1885-470a-8893-0cf60148f8f8@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 03:34:40PM +0200, Juha-Pekka Heikkilä wrote:
> I did sometime ago write much of the same patch but it didn't go anywhere as
> it got overrun by other stuff, I had planned to enable tile64 framebuffers
> on xe. This look all good to me.
> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Thank you for the review, I've merged series today.

--
Zbigniew

> 
> Ville had somewhere branch that was enabling tile64 framebuffers on i915 as
> well as xe if it's interesting thing to try experiment with this.
> 
> /Juha-Pekka
> 
> On 18/11/2026 14.26, Zbigniew Kempczyński wrote:
> > Bufops missed Tile64 so extend it and add this feature in software.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > ---
> >   lib/intel_bufops.c | 113 ++++++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 111 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > index 1196069a500..2d013ca6547 100644
> > --- a/lib/intel_bufops.c
> > +++ b/lib/intel_bufops.c
> > @@ -127,12 +127,14 @@ struct buf_ops {
> >   	bo_copy linear_to_yf;
> >   	bo_copy linear_to_ys;
> >   	bo_copy linear_to_tile4;
> > +	bo_copy linear_to_tile64;
> >   	bo_copy to_linear;
> >   	bo_copy x_to_linear;
> >   	bo_copy y_to_linear;
> >   	bo_copy yf_to_linear;
> >   	bo_copy ys_to_linear;
> >   	bo_copy tile4_to_linear;
> > +	bo_copy tile64_to_linear;
> >   };
> >   static const char *tiling_str(uint32_t tiling)
> > @@ -428,6 +430,78 @@ static void *tile4_ptr(void *ptr,
> >   	return ptr + pos;
> >   }
> > +/*
> > + * (x,y) to memory location in tile-64 surface.
> > + */
> > +static void *tile64_ptr(void *ptr,
> > +			unsigned int x, unsigned int y,
> > +			unsigned int stride, unsigned int cpp)
> > +{
> > +	const int tile_size = 64 * 1024;
> > +	int tile_width, tile_height;
> > +	int tile_x, tile_y, _x, _y;
> > +	int base, vaddr, pos;
> > +
> > +	switch (cpp) {
> > +	case 1:
> > +		tile_width = 256;
> > +		tile_height = 256;
> > +		break;
> > +	case 2:
> > +		tile_width = 256;
> > +		tile_height = 128;
> > +		break;
> > +	case 4:
> > +		tile_width = 128;
> > +		tile_height = 128;
> > +		break;
> > +	case 8:
> > +	default:
> > +		tile_width = 128;
> > +		tile_height = 64;
> > +		break;
> > +	}
> > +
> > +	tile_x = x / tile_width;
> > +	tile_y = y / tile_height;
> > +	_x = x % tile_width;
> > +	_y = y % tile_height;
> > +
> > +	switch (cpp) {
> > +	case 1:
> > +		vaddr = (_x & 0xf) | ((_y & 0x3) << 4) |
> > +			((_x & 0x30) << 2) | ((_y & 0x4) << 6) |
> > +			((_x & 0x40) << 3) | ((_y & 0x18) << 7) |
> > +			((_x & 0x80) << 5) | ((_y & 0xe0) << 8);
> > +		break;
> > +	case 2:
> > +		vaddr = ((_x & 0x7) << 1) | ((_y & 0x3) << 4) |
> > +			((_x & 0x18) << 3) | ((_y & 0x4) << 6) |
> > +			((_x & 0x20) << 4) | ((_y & 0x18) << 7) |
> > +			((_x & 0xc0) << 6) | ((_y & 0x60) << 9);
> > +		break;
> > +	case 4:
> > +		vaddr = ((_x & 0x3) << 2) | ((_y & 0x3) << 4) |
> > +			((_x & 0xc) << 4) | ((_y & 0x4) << 6) |
> > +			((_x & 0x10) << 5) | ((_y & 0x18) << 7) |
> > +			((_x & 0x60) << 7) | ((_y & 0x60) << 9);
> > +		break;
> > +	case 8:
> > +	default:
> > +		vaddr = ((_x & 0x1) << 3) | ((_y & 0x3) << 4) |
> > +			((_x & 0x6) << 5) | ((_y & 0x4) << 6) |
> > +			((_x & 0x8) << 6) | ((_y & 0x18) << 7) |
> > +			((_x & 0x70) << 8) | ((_y & 0x20) << 10);
> > +		break;
> > +	}
> > +
> > +	/* memory location */
> > +	base = tile_y * (stride * tile_height) + tile_x * tile_size;
> > +	pos = base + vaddr;
> > +	igt_assert((pos & (cpp - 1)) == 0);
> > +
> > +	return ptr + pos;
> > +}
> >   static void *yf_ptr(void *ptr,
> >   		    unsigned int x, unsigned int y,
> > @@ -489,6 +563,10 @@ static tile_fn __get_tile_fn_ptr(int fd, int tiling)
> >   		break;
> >   	case I915_TILING_4:
> >   		fn = tile4_ptr;
> > +		break;
> > +	case I915_TILING_64:
> > +		fn = tile64_ptr;
> > +		break;
> >   	case I915_TILING_Ys:
> >   		/* To be implemented */
> >   		break;
> > @@ -739,6 +817,13 @@ static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
> >   	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, 0);
> >   }
> > +static void copy_linear_to_tile64(struct buf_ops *bops, struct intel_buf *buf,
> > +				  uint32_t *linear)
> > +{
> > +	DEBUGFN();
> > +	__copy_linear_to(bops->fd, buf, linear, I915_TILING_64, 0);
> > +}
> > +
> >   static void __copy_to_linear(int fd, struct intel_buf *buf,
> >   			     uint32_t *linear, int tiling, uint32_t swizzle)
> >   {
> > @@ -806,6 +891,13 @@ static void copy_tile4_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> >   	__copy_to_linear(bops->fd, buf, linear, I915_TILING_4, 0);
> >   }
> > +static void copy_tile64_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> > +				  uint32_t *linear)
> > +{
> > +	DEBUGFN();
> > +	__copy_to_linear(bops->fd, buf, linear, I915_TILING_64, 0);
> > +}
> > +
> >   static void copy_linear_to_gtt(struct buf_ops *bops, struct intel_buf *buf,
> >   			       uint32_t *linear)
> >   {
> > @@ -898,6 +990,10 @@ void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> >   		igt_assert(bops->tile4_to_linear);
> >   		bops->tile4_to_linear(bops, buf, linear);
> >   		break;
> > +	case I915_TILING_64:
> > +		igt_assert(bops->tile64_to_linear);
> > +		bops->tile64_to_linear(bops, buf, linear);
> > +		break;
> >   	}
> >   	if (buf->compression)
> > @@ -934,6 +1030,10 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
> >   		igt_assert(bops->linear_to_tile4);
> >   		bops->linear_to_tile4(bops, buf, linear);
> >   		break;
> > +	case I915_TILING_64:
> > +		igt_assert(bops->linear_to_tile64);
> > +		bops->linear_to_tile64(bops, buf, linear);
> > +		break;
> >   	}
> >   	if (buf->compression)
> > @@ -1628,12 +1728,14 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
> >   	.linear_to_yf       = copy_linear_to_yf, \
> >   	.linear_to_ys       = copy_linear_to_ys, \
> >   	.linear_to_tile4    = copy_linear_to_tile4, \
> > +	.linear_to_tile64   = copy_linear_to_tile64, \
> >   	.to_linear          = copy_wc_to_linear, \
> >   	.x_to_linear        = copy_gtt_to_linear, \
> >   	.y_to_linear        = copy_gtt_to_linear, \
> >   	.yf_to_linear       = copy_yf_to_linear, \
> >   	.ys_to_linear       = copy_ys_to_linear, \
> > -	.tile4_to_linear    = copy_tile4_to_linear
> > +	.tile4_to_linear    = copy_tile4_to_linear, \
> > +	.tile64_to_linear   = copy_tile64_to_linear
> >   static const struct buf_ops buf_ops_arr[] = {
> >   	{
> > @@ -1648,7 +1750,7 @@ static const struct buf_ops buf_ops_arr[] = {
> >   	{
> >   		DEFAULT_BUFOPS(12, ~0U),
> > -		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4,
> > +		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4 | TILE_64,
> >   	},
> >   };
> > @@ -1837,6 +1939,9 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
> >   	if (!is_tiling_supported(bops, I915_TILING_4))
> >   		igt_debug("Tile4 format not supported\n");
> > +	if (!is_tiling_supported(bops, I915_TILING_64))
> > +		igt_debug("Tile64 format not supported\n");
> > +
> >   	if (check_idempotency) {
> >   		idempotency_selftest(bops, I915_TILING_X);
> >   		idempotency_selftest(bops, I915_TILING_Y);
> > @@ -2003,6 +2108,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
> >   		igt_debug("-> use SW on tiling 4\n");
> >   		break;
> > +	case I915_TILING_64:
> > +		igt_debug("-> use SW on tiling 64\n");
> > +		break;
> > +
> >   	case I915_TILING_Yf:
> >   		igt_debug("-> use SW on tiling Yf\n");
> >   		break;
> 
