Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C4C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363210EED0;
	Fri, 26 Apr 2024 11:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4fYfo43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D9010EB9A
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714130884; x=1745666884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CIcQQmmAoT/07BAf8bHDbP9FEEEYc2cBgEo1KPaoJZ4=;
 b=g4fYfo436jRKIDgp+mNUmE6pTjMypr2qT33LK+8Bm9gIZh27yL3FTfcT
 05AbkFFc1tc8a5AGCfXYYUKBJIiHuUqVW3mr6DS+JEWdcY1Qs49bb2mw8
 4KZXap1+KQZPKNH+QaMvR9EU5/+hi9NJSviC5/hJ1tC1fhhAJNBNMg29D
 LUuVHNE9Bw0Y7aIRrBFxI5bHJkcj3NSGMHycsZ4iFdLKrXWYfWLj3Lwqt
 hCQRGHimZY7zTUfOzxZCxUgHV3ubSlAxe2Q9VKnWox5dpbVG4xLvqn1xc
 d75Wbv1nDm8RoZtE/OLHLa0DiiIMT/8a6tJ4iOKZxmNAU7a7cV2oXRVOJ Q==;
X-CSE-ConnectionGUID: N7RvFPOeS5SIXTu2KE6Qbg==
X-CSE-MsgGUID: 7DkPHf88RA2QAhbuCk7LpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27317425"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="27317425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:28:03 -0700
X-CSE-ConnectionGUID: NE2ZtLyEREaER89pKyRXsQ==
X-CSE-MsgGUID: MEf9z/WjQ9OlmQOV77yJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="26021246"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:28:01 -0700
Date: Fri, 26 Apr 2024 13:27:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 02/10] lib/intel_blt: Rename confusing fb tile
 to i915 tile
Message-ID: <20240426112759.qtctoo2rwrsyjwpj@zkempczy-mobl2>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-3-zbigniew.kempczynski@intel.com>
 <0788391e-861e-4076-97e5-f32294cbdbb6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0788391e-861e-4076-97e5-f32294cbdbb6@intel.com>
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

On Fri, Apr 26, 2024 at 01:11:02PM +0200, Karolina Stolarek wrote:
> 
> On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> > Fb tile is defacto drm modifier, thus blt_tile_to_fb_tile() name
> > is confusing as it converts to I915_TILING*, not drm modifier.
> > Lets rename it.
> 
> I agree with the sentiment, but I wonder if we should have this function
> in intel_blt at all. It's only used in xe_render_copy test. Why not move
> it there?

At the moment it was used only in xe_render_copy, but I've another
candidate (xe_intel_bb@render) I should slightly adopt to avoid
hardcoded tilings.

--
Zbigniew

> 
> All the best,
> Karolina
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/intel_blt.c              | 4 ++--
> >   lib/intel_blt.h              | 2 +-
> >   tests/intel/xe_render_copy.c | 2 +-
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 4da5cc855e..5a281036c4 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -536,14 +536,14 @@ static int __block_tiling(enum blt_tiling_type tiling)
> >   }
> >   /**
> > - * blt_tile_to_fb_tile:
> > + * blt_tile_to_i915_tile:
> >    * @tiling: tiling id
> >    *
> >    * Returns:
> >    * id of tiling introduced in i915 like I915_TILING_* used for example
> >    * in render-copy code.
> >    */
> > -int blt_tile_to_fb_tile(enum blt_tiling_type tiling)
> > +int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
> >   {
> >   	switch (tiling) {
> >   	case T_LINEAR: return I915_TILING_NONE;
> > diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> > index cc59666862..fcfce69bee 100644
> > --- a/lib/intel_blt.h
> > +++ b/lib/intel_blt.h
> > @@ -213,7 +213,7 @@ bool blt_platform_has_flat_ccs_enabled(int fd);
> >   bool blt_uses_extended_block_copy(int fd);
> >   const char *blt_tiling_name(enum blt_tiling_type tiling);
> > -int blt_tile_to_fb_tile(enum blt_tiling_type tiling);
> > +int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
> >   uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
> >   			    enum blt_tiling_type tiling);
> > diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> > index 4f98cb7dfa..ef75c4ce6d 100644
> > --- a/tests/intel/xe_render_copy.c
> > +++ b/tests/intel/xe_render_copy.c
> > @@ -407,7 +407,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
> >   					continue;
> >   				tiling_name = blt_tiling_name(tiling);
> > -				tiling = blt_tile_to_fb_tile(tiling);
> > +				tiling = blt_tile_to_i915_tile(tiling);
> >   				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
> >   					render(bops, tiling, surfwidth, surfheight, id);
> >   			}
