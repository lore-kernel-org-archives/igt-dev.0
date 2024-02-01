Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87446C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 19:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAC210E3B7;
	Thu,  1 Feb 2024 19:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3eOkuqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2EA10E3B7
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706815662; x=1738351662;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7YeTW67jXm/yoNHZb9KTzSXTgNxVzhJaHnqvOqhtKWE=;
 b=j3eOkuqzoHWvwRrI728p4ESQlFHLleIcHaF4bLuLQGxOpp/1xmrUacTD
 c4mCjXx4L+6tDISGrS4SJIlT14/Rs3chEQQMVI1K8aLegqv5uE0lp1VDC
 8jL6VeksWwu3khYyqfWcMCbi/sGGyIYxHSZ06Vw6iiuAzfevZko0ZCF5C
 1ojxNI38hKkPJPs32YeodQxmG+IiKPU4/sx5TKelrGCVra+5yEXhtpmGW
 GJqroNO2Y3ksnK4kzQQNxg6BL+oNze7XQxHI5M/Oy74samKYdcfOtxaoT
 IGcR76XtdI6Tzrs1Fv4ZCtc91sV6AzAfEBYwZ4K9RWoazEQ+F1trYFYvm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11353328"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="11353328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4488901"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:27:40 -0800
Date: Thu, 1 Feb 2024 20:27:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>
Subject: Re: [PATCH i-g-t v4 2/5] lib/intel_blt: Change surface size
 calculation
Message-ID: <20240201192737.h6bjms5mvafldgpf@zkempczy-mobl2>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-3-zbigniew.kempczynski@intel.com>
 <4fcf8c7a-5e30-4274-9565-2973b30f154b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fcf8c7a-5e30-4274-9565-2973b30f154b@intel.com>
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

On Thu, Feb 01, 2024 at 02:44:56PM +0100, Karolina Stolarek wrote:
> 
> On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> > For tiled surfaces we need to ensure stride and height are valid
> > from the blit operation perspective. Calculate required surface
> > size according to tiling constraints.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> 
> I'm looking at blt_set_geom() function. We still pass normal height and
> width to it. Is this correct? Or should we change height to
> aligned_height? Because if we should, this patch should be updated to
> reflect that.

Function creates an object, which should be correct from stride/aligned
height perspective. I mean you need to allocate enough memory to handle
all pixels which will be touched during blit. So the best is to allocate
whole tile (x/y/4/64). Then you'll be sure hw won't touch addresses
outside your object and you don't hang the engine.

For example you want to blit 1x128x32bpp between two surfaces for
Tile64. Even you're using single pixel in x (one dword) you need to
provide stride 128 (in dwords). That's hardware requirement and even
if this looks like waste of memory (127 pixels in x won't be used at
all) hardware expects that. I learned this hard way during extending
block-copy from small to large buffers.

I wondered to refactor blt_copy_object to contain bpp (this way we
may warn if user passes invalid stride during object setup) but at
the moment I resisted as my primary goal is to fill the test gap
in blit/render-copy from small to large buffers.


> 
> If that's not a problem, then:
> 
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

Thanks for the review.

--
Zbigniew

> 
> > ---
> >   lib/intel_blt.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 13b1dbba4f..00208fc243 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1858,13 +1858,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> >   		  bool create_mapping)
> >   {
> >   	struct blt_copy_object *obj;
> > -	uint64_t size = width * height * bpp / 8;
> > -	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> > +	uint32_t stride, aligned_height;
> > +	uint64_t size;
> >   	uint32_t handle;
> >   	uint8_t pat_index = DEFAULT_PAT_INDEX;
> >   	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
> > +	stride = blt_get_min_stride(width, bpp, tiling);
> > +	aligned_height = blt_get_aligned_height(height, bpp, tiling);
> > +	size = stride * aligned_height;
> > +
> > +	/* blitter command expects stride in dwords on tiled surfaces */
> > +	if (tiling)
> > +		stride /= 4;
> > +
> >   	obj = calloc(1, sizeof(*obj));
> >   	obj->size = size;
