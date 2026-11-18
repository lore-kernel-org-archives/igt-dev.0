Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FA606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mn8zBry4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8608510FE97;
	Wed, 18 Nov 2026 17:00:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFB210FE97
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795021151; x=1826557151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xHmQAIy8Z6UKDCI9hItUiU4szI+nThFoRr9X5/cnUpE=;
 b=Mn8zBry4+t7d8puGjF4wHrI9xvoxf5WN1x2BlEDFB3NjPHZ6hoecVYI7
 es0R3irwn1n27M7DpiOqllQDylYVDFlYN6RSYgNE1131z3UTynYtBmRN6
 JO+U1rUKMu29Ja9wLcMCBIApPXWhNz499uweH36H4Nq1/9xRPez4CiMND
 J20/3nHEFyFb1ADPYKHkTMDgQio12G3m92JxEB0GvG9p9LEnh8zHybseV
 LRBbQPqSy1aRHBZHa/WLvwt3GsqfH8f4hJKQRoxucL6FLFBHhCQBTG4tr
 ewuajF99AgwxPE2bN+/WU/Oq9Yb/xnwPC5cmZ8sdKtwxI408n+bIToh9z w==;
X-CSE-ConnectionGUID: gPRdE4UaT+2nIPKUS8UHmA==
X-CSE-MsgGUID: nG1C025FRnKgUJ1ufZX+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3701233"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3701233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:58:38 -0800
X-CSE-ConnectionGUID: yNzy8MmcRH+MhvdZXdHn/A==
X-CSE-MsgGUID: TESIhzcnQy60ZlMpLXWG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10463372"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:58:37 -0800
Date: Wed, 18 Nov 2026 17:58:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t 1/2] lib/intel_bufops: Add support for Tile64 in
 software.
Message-ID: <aqswjet35bbvidizdsmjwq45sdiloaljo7vvnghtpns47eodfe@rbd43vyx4ya7>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
 <20261118122619.206753-5-zbigniew.kempczynski@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118122619.206753-5-zbigniew.kempczynski@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zbigniew,
On 2026-11-18 at 13:26:21 +0100, Zbigniew Kempczyński wrote:

Remove dot from end of subject:

[PATCH i-g-t 1/2] lib/intel_bufops: Add support for Tile64 in software

No need for resend, can be done at merge time.

> Bufops missed Tile64 so extend it and add this feature in software.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

imho Cc should be above, but that is not strong opinion.

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/intel_bufops.c | 113 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 1196069a500..2d013ca6547 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -127,12 +127,14 @@ struct buf_ops {
>  	bo_copy linear_to_yf;
>  	bo_copy linear_to_ys;
>  	bo_copy linear_to_tile4;
> +	bo_copy linear_to_tile64;
>  	bo_copy to_linear;
>  	bo_copy x_to_linear;
>  	bo_copy y_to_linear;
>  	bo_copy yf_to_linear;
>  	bo_copy ys_to_linear;
>  	bo_copy tile4_to_linear;
> +	bo_copy tile64_to_linear;
>  };
>  
>  static const char *tiling_str(uint32_t tiling)
> @@ -428,6 +430,78 @@ static void *tile4_ptr(void *ptr,
>  	return ptr + pos;
>  }
>  
> +/*
> + * (x,y) to memory location in tile-64 surface.
> + */
> +static void *tile64_ptr(void *ptr,
> +			unsigned int x, unsigned int y,
> +			unsigned int stride, unsigned int cpp)
> +{
> +	const int tile_size = 64 * 1024;
> +	int tile_width, tile_height;
> +	int tile_x, tile_y, _x, _y;
> +	int base, vaddr, pos;
> +
> +	switch (cpp) {
> +	case 1:
> +		tile_width = 256;
> +		tile_height = 256;
> +		break;
> +	case 2:
> +		tile_width = 256;
> +		tile_height = 128;
> +		break;
> +	case 4:
> +		tile_width = 128;
> +		tile_height = 128;
> +		break;
> +	case 8:
> +	default:
> +		tile_width = 128;
> +		tile_height = 64;
> +		break;
> +	}
> +
> +	tile_x = x / tile_width;
> +	tile_y = y / tile_height;
> +	_x = x % tile_width;
> +	_y = y % tile_height;
> +
> +	switch (cpp) {
> +	case 1:
> +		vaddr = (_x & 0xf) | ((_y & 0x3) << 4) |
> +			((_x & 0x30) << 2) | ((_y & 0x4) << 6) |
> +			((_x & 0x40) << 3) | ((_y & 0x18) << 7) |
> +			((_x & 0x80) << 5) | ((_y & 0xe0) << 8);
> +		break;
> +	case 2:
> +		vaddr = ((_x & 0x7) << 1) | ((_y & 0x3) << 4) |
> +			((_x & 0x18) << 3) | ((_y & 0x4) << 6) |
> +			((_x & 0x20) << 4) | ((_y & 0x18) << 7) |
> +			((_x & 0xc0) << 6) | ((_y & 0x60) << 9);
> +		break;
> +	case 4:
> +		vaddr = ((_x & 0x3) << 2) | ((_y & 0x3) << 4) |
> +			((_x & 0xc) << 4) | ((_y & 0x4) << 6) |
> +			((_x & 0x10) << 5) | ((_y & 0x18) << 7) |
> +			((_x & 0x60) << 7) | ((_y & 0x60) << 9);
> +		break;
> +	case 8:
> +	default:
> +		vaddr = ((_x & 0x1) << 3) | ((_y & 0x3) << 4) |
> +			((_x & 0x6) << 5) | ((_y & 0x4) << 6) |
> +			((_x & 0x8) << 6) | ((_y & 0x18) << 7) |
> +			((_x & 0x70) << 8) | ((_y & 0x20) << 10);
> +		break;
> +	}
> +
> +	/* memory location */
> +	base = tile_y * (stride * tile_height) + tile_x * tile_size;
> +	pos = base + vaddr;
> +	igt_assert((pos & (cpp - 1)) == 0);
> +
> +	return ptr + pos;
> +}
>  
>  static void *yf_ptr(void *ptr,
>  		    unsigned int x, unsigned int y,
> @@ -489,6 +563,10 @@ static tile_fn __get_tile_fn_ptr(int fd, int tiling)
>  		break;
>  	case I915_TILING_4:
>  		fn = tile4_ptr;
> +		break;
> +	case I915_TILING_64:
> +		fn = tile64_ptr;
> +		break;
>  	case I915_TILING_Ys:
>  		/* To be implemented */
>  		break;
> @@ -739,6 +817,13 @@ static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
>  	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, 0);
>  }
>  
> +static void copy_linear_to_tile64(struct buf_ops *bops, struct intel_buf *buf,
> +				  uint32_t *linear)
> +{
> +	DEBUGFN();
> +	__copy_linear_to(bops->fd, buf, linear, I915_TILING_64, 0);
> +}
> +
>  static void __copy_to_linear(int fd, struct intel_buf *buf,
>  			     uint32_t *linear, int tiling, uint32_t swizzle)
>  {
> @@ -806,6 +891,13 @@ static void copy_tile4_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>  	__copy_to_linear(bops->fd, buf, linear, I915_TILING_4, 0);
>  }
>  
> +static void copy_tile64_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> +				  uint32_t *linear)
> +{
> +	DEBUGFN();
> +	__copy_to_linear(bops->fd, buf, linear, I915_TILING_64, 0);
> +}
> +
>  static void copy_linear_to_gtt(struct buf_ops *bops, struct intel_buf *buf,
>  			       uint32_t *linear)
>  {
> @@ -898,6 +990,10 @@ void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>  		igt_assert(bops->tile4_to_linear);
>  		bops->tile4_to_linear(bops, buf, linear);
>  		break;
> +	case I915_TILING_64:
> +		igt_assert(bops->tile64_to_linear);
> +		bops->tile64_to_linear(bops, buf, linear);
> +		break;
>  	}
>  
>  	if (buf->compression)
> @@ -934,6 +1030,10 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
>  		igt_assert(bops->linear_to_tile4);
>  		bops->linear_to_tile4(bops, buf, linear);
>  		break;
> +	case I915_TILING_64:
> +		igt_assert(bops->linear_to_tile64);
> +		bops->linear_to_tile64(bops, buf, linear);
> +		break;
>  	}
>  
>  	if (buf->compression)
> @@ -1628,12 +1728,14 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
>  	.linear_to_yf       = copy_linear_to_yf, \
>  	.linear_to_ys       = copy_linear_to_ys, \
>  	.linear_to_tile4    = copy_linear_to_tile4, \
> +	.linear_to_tile64   = copy_linear_to_tile64, \
>  	.to_linear          = copy_wc_to_linear, \
>  	.x_to_linear        = copy_gtt_to_linear, \
>  	.y_to_linear        = copy_gtt_to_linear, \
>  	.yf_to_linear       = copy_yf_to_linear, \
>  	.ys_to_linear       = copy_ys_to_linear, \
> -	.tile4_to_linear    = copy_tile4_to_linear
> +	.tile4_to_linear    = copy_tile4_to_linear, \
> +	.tile64_to_linear   = copy_tile64_to_linear
>  
>  static const struct buf_ops buf_ops_arr[] = {
>  	{
> @@ -1648,7 +1750,7 @@ static const struct buf_ops buf_ops_arr[] = {
>  
>  	{
>  		DEFAULT_BUFOPS(12, ~0U),
> -		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4,
> +		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4 | TILE_64,
>  	},
>  };
>  
> @@ -1837,6 +1939,9 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>  	if (!is_tiling_supported(bops, I915_TILING_4))
>  		igt_debug("Tile4 format not supported\n");
>  
> +	if (!is_tiling_supported(bops, I915_TILING_64))
> +		igt_debug("Tile64 format not supported\n");
> +
>  	if (check_idempotency) {
>  		idempotency_selftest(bops, I915_TILING_X);
>  		idempotency_selftest(bops, I915_TILING_Y);
> @@ -2003,6 +2108,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
>  		igt_debug("-> use SW on tiling 4\n");
>  		break;
>  
> +	case I915_TILING_64:
> +		igt_debug("-> use SW on tiling 64\n");
> +		break;
> +
>  	case I915_TILING_Yf:
>  		igt_debug("-> use SW on tiling Yf\n");
>  		break;
> -- 
> 2.43.0
> 
