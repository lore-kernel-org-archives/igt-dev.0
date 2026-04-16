Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD899F8D746
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 13:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E89E10E1B1;
	Thu, 16 Apr 2026 13:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsSSAjk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C4A10E1B1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776347648; x=1807883648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SUkQ3LzoEBSbtTm82qpF3m+NJ70pvoXa7rUJe4dqx8w=;
 b=HsSSAjk5shmNlEhhPE1ayPSyaUJUluVL+/UZBHjHlOgCcHbTpRJyh/4x
 l/JW1VVMLawZq95PtML68a925+Z9LMnH32zHBieWYSIl/Rd4OQ9pBGwwe
 8ZhqhrT2p6EZ5FNqb7X70fnGYP1zbRmUM76uvAlV8s9+3lwasAqVFQOpC
 MnhUmnRw1ytZEDIcsBsCI33oC9XcH60mgWOGM9o3owqCSkoQt3thKei7O
 VeqUwH+FXJNYB+hyU4oEfV4gLV7ovpXhICZT0ckPU4ZlQt0eSu7/7kTsM
 diarFI3onnoHaaZprYRFiIIr5szJE6TfGW+7p3KqV3mWtNEtIGMjl54vH g==;
X-CSE-ConnectionGUID: nlv8HW27QVaVgkYvU1rznw==
X-CSE-MsgGUID: Tcm0zw1aRVua9OV9FlrSPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77529819"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77529819"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 06:54:07 -0700
X-CSE-ConnectionGUID: Q3ECFIzUQiG5+/RGDCm7sQ==
X-CSE-MsgGUID: ZQDSL5B9SCC1luPQDcN1FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235712376"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 06:54:05 -0700
Date: Thu, 16 Apr 2026 16:54:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 ramanaidu.naladala@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/igt_fb: Add IGT_FORMAT_MOD_PREFERRED
 helper modifier
Message-ID: <aeDp-rDyJOSwAQmz@intel.com>
References: <20260413165006.46987-1-jeevan.b@intel.com>
 <20260413165006.46987-2-jeevan.b@intel.com>
 <ad0wr0skJmvyL70E@intel.com>
 <2921c1ac-4683-40c2-ab8a-b94eec34520d@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2921c1ac-4683-40c2-ab8a-b94eec34520d@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Apr 16, 2026 at 03:37:20PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2026-04-13 kl. 20:06, skrev Ville Syrjälä:
> > On Mon, Apr 13, 2026 at 10:20:05PM +0530, Jeevan B wrote:
> >> Add a new IGT‑internal framebuffer modifier,
> >> IGT_FORMAT_MOD_PREFERRED, allowing tests to request the preferred
> >> non‑linear tiling for a platform without hardcoding
> >> driver‑specific modifiers.
> >>
> >> The modifier is resolved in igt_fb_resolve_modifier() using simple
> >> platform rules (Intel, VC4, fallback to linear) and is never passed to
> >> the kernel. It is defined outside the valid DRM modifier range and used
> >> only as an internal sentinel.
> >>
> >> This provides a driver‑agnostic way for tests to pick an optimal
> >> modifier, avoiding per‑test hacks.
> >>
> >> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> >> ---
> >>  lib/igt_fb.c | 27 ++++++++++++++++++++++++++-
> >>  lib/igt_fb.h | 21 +++++++++++++++++++++
> >>  2 files changed, 47 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> >> index fa9220953..9c3d0338b 100644
> >> --- a/lib/igt_fb.c
> >> +++ b/lib/igt_fb.c
> >> @@ -790,6 +790,29 @@ static int fb_num_planes(const struct igt_fb *fb)
> >>  	return num_planes;
> >>  }
> >>  
> >> +static uint64_t igt_fb_resolve_modifier(int fd, uint64_t modifier)
> >> +{
> >> +	if (modifier != IGT_FORMAT_MOD_PREFERRED)
> >> +		return modifier;
> >> +
> >> +	if (is_xe_device(fd)) {
> >> +		return I915_FORMAT_MOD_4_TILED;
> >> +	} else if (is_i915_device(fd)) {
> > 
> > That is wrong for tgl/adl. I think i915 and xe need to use
> > the same logic here.
> > 
> >> +		int ver = intel_display_ver(intel_get_drm_devid(fd));
> >> +
> >> +		if (ver >= 13)
> >> +			return I915_FORMAT_MOD_4_TILED;
> > 
> > Still borked for adl.
> > 
> >> +		else if (ver >= 9)
> >> +			return I915_FORMAT_MOD_Y_TILED;
> > 
> > I don't think we want Y tile, at least on skl class hardware.
> > It has much higher watermark requirements and could therefore
> > prevent some tests from working.
> > 
> >> +		else
> >> +			return I915_FORMAT_MOD_X_TILED;
> > 
> > I'm thinking we may want to prefer X tile on all the hardware
> > that still has it. Though I suppose anything that has tile4 also
> > has pretty large DDBs, so tile4 might be fine. Shrug.
> > 
> > 
> > Anyways, this should perhaps just be something simple like
> > 
> > if (display_has_format_mod(XRGB8888, X_TILE))
> > 	return X_TILE;
> > if (display_has_format_mod(XRGB8888, 4_TILE))
> > 	return 4_TILE;
> > return LINEAR;
> > 
> > Doesn't even need any driver checks.
> > 
> > 
> > Hmm. We might still prefer fenced GGTT access for X tile, so
> > it might actually end up slowing down some things. We may
> > need to change the policy to prefer a different method for
> > tiled<->linear conversion even for X tile. It would be good
> > get actual numbers on the overall execution time for whatever
> > we choose here vs. LINEAR...
> > 
> >> +	} else if (is_vc4_device(fd))
> >> +		return DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED;
> >> +
> >> +	/* For AMD, nouveau, and any other driver, fall back to linear. */
> >> +	return DRM_FORMAT_MOD_LINEAR;
> >> +}
> >> +
> >>  void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
> >>  		 uint32_t drm_format, uint64_t modifier,
> >>  		 enum igt_color_encoding color_encoding,
> >> @@ -803,7 +826,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
> >>  
> >>  	fb->width = width;
> >>  	fb->height = height;
> >> -	fb->modifier = modifier;
> >> +	fb->modifier = igt_fb_resolve_modifier(fd, modifier);
> > 
> > I think it should have been resolved long before that.
> > 
> > AFAICS you could just add a display->preferred_modifier, figure out
> > what that is during display init, and then switch tests to use that.
> > No need for this magic IGT_FORMAT_MOD_PREFERRED at all then I think.
> > 
> > And I'm thinking we might also want to print it out in the debug logs.
> > 
> > And for some extra fun we could add a debug knob (maybe env variable,
> > or a standard igt command line parameter) to force a specific modifier.
> > This would allow running the test with a specific modifier, even if
> > the test doesn't have explicit support for it.
> > 
> > The downside of using !LINEAR is that we will now depend even
> > more on all the magic stuff to convert between linear and tiled
> > for software rendering. So we may end up running more code under
> > the hood in most tests. I suppose we just have to hope that code
> > doesn't have too many bugs.
> 
> The reason I chose IGT_FORMAT_MOD_PREFERRED is that is's a simple change
> showing intention in the test, you don't care what the modifier is, just
> that it's reasonably fast
> 
> On some drivers like nouveau, and maybe AMD the preferred modifier may
> change depending on width/height/format, so there's no such thing as a
> single display->preferred_modifier.
> 
> See #DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D.
> 
> The only place to resolve it, is during FB creation, hence the extra parameter.

display->preferred_modifier wouldn't prevent that approach.

> 
> >>  	fb->drm_format = drm_format;
> >>  	fb->fd = fd;
> >>  	fb->num_planes = fb_num_planes(fb);
> >> @@ -5266,6 +5289,8 @@ void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
> >>  const char *igt_fb_modifier_name(uint64_t modifier)
> >>  {
> >>  	switch (modifier) {
> >> +	case IGT_FORMAT_MOD_PREFERRED:
> >> +		return "preferred";
> >>  	case DRM_FORMAT_MOD_LINEAR:
> >>  		return "linear";
> >>  	case I915_FORMAT_MOD_X_TILED:
> >> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> >> index 8e5907dab..5380b3dfa 100644
> >> --- a/lib/igt_fb.h
> >> +++ b/lib/igt_fb.h
> >> @@ -50,6 +50,27 @@ typedef struct _igt_crc igt_crc_t;
> >>   */
> >>  #define IGT_FORMAT_FLOAT fourcc_code('I', 'G', 'F', 'x')
> >>  
> >> +/**
> >> + * IGT_FORMAT_MOD_PREFERRED:
> >> + *
> >> + * Modifier used by tests to request the best tiling format for the
> >> + * current device. The actual modifier is selected inside igt_init_fb(),
> >> + * so tests don’t need to handle driver-specific details.
> >> + *
> >> + * Selection rules:
> >> + *  - Intel Xe:              4_TILED
> >> + *  - Intel i915 (gen ≥13):  4_TILED
> >> + *  - Intel i915 (gen 9–12): Y_TILED
> >> + *  - Intel i915 (gen <9):   X_TILED
> >> + *  - Broadcom VC4:          T_TILED
> >> + *  - Others:                LINEAR (fallback)
> >> + *
> >> + * Note: This is a special placeholder value and must never be sent to
> >> + * the kernel.
> >> + */
> >> +#define IGT_FORMAT_MOD_PREFERRED  UINT64_C(0xfffffffffffffffe)
> >> +
> >> +
> >>  #define IGT_FORMAT_FMT "%c%c%c%c(0x%08x)"
> >>  #define IGT_FORMAT_ARGS(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
> >>  		((f) >> 16) & 0xff, ((f) >> 24) & 0xff, (f)
> >> -- 
> >> 2.43.0
> > 
> 
> Kind regards,
> ~Maarten Lankhorst

-- 
Ville Syrjälä
Intel
