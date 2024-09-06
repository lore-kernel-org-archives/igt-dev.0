Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8DBCE7B14
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 13:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9CF10EA5E;
	Fri,  6 Sep 2024 13:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDqB1UmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3810EA5E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725630311; x=1757166311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OneeNCcioCEw42bsq00J7nx05EYPFpN+F4jSG1gQuCo=;
 b=nDqB1UmT/OfwofznnNt92oGeFvQ2rKJSthdwPMbiLAIK9DT/FhcxaOSK
 H8Na/3UEvzV/jn2HAZvNDaJrTf5t49t7CPbBlQQou/t5ajmJpi9mEVq5Y
 eSmT0cphaKSBm2ov6etXG+ZCK2wgFcFtF1OSNOpmgL5Fhqlz/MI0P5nbV
 4al8z9fBz2U5Jj8BmaoGAA1G2W8lOk9Gcmn2Xa5gtjUWtEN7NA/vNhFe5
 9sobVU9eOqN+ZfESwWwM4CPbx102SZ4hlOFZCZiPFxgvU7lWzLIrZlX0Z
 bg0GKhEZqIlHz6nLxH0ANJUn6ySVAp4UHZHu/cxfGOJO1ltMDXBMoHuIP A==;
X-CSE-ConnectionGUID: Jeceyi78TemxKJpA4s8A4g==
X-CSE-MsgGUID: ZO2COU5zSd6tGq31CKN9Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35534154"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="35534154"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:45:10 -0700
X-CSE-ConnectionGUID: 6oHPO3/FRT2hPRm2Uw/oFQ==
X-CSE-MsgGUID: 3HxYhdiITLGMIXRN5zS8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65996231"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Sep 2024 06:45:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 Sep 2024 16:45:06 +0300
Date: Fri, 6 Sep 2024 16:45:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/23] lib/rendercopy: Always setup clear color for
 TGL
Message-ID: <ZtsHYjwtGwrNDU-E@intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
 <20240902143758.21036-6-ville.syrjala@linux.intel.com>
 <d08eeda6-a8e9-4ab9-8dc2-4860e97a2307@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d08eeda6-a8e9-4ab9-8dc2-4860e97a2307@gmail.com>
X-Patchwork-Hint: comment
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

On Fri, Sep 06, 2024 at 04:09:19PM +0300, Juha-Pekka Heikkila wrote:
> On 2.9.2024 17.37, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > TGL apparently automagically converts regular output to fast
> > clears when the output matches the configured clear color.
> > And if we don't enable the clear color packet at all then we
> > just get some rainbow gibberish on all black parts of the
> > output.
> > 
> > To avoid always set up the clear color packet when using
> > using a non-clear color modifier. We'll just stick a bunch
> > of NaNs into the clear value so it'll never match any
> > legitimate output, and thus automagic fast clear should not
> > happen.
> > 
> > TODO: Hide this better inside rendercopy_gen9.c without
> >        requring extra allocation in the FB BO
> > TODO: Figure out if other platforms need this sort stuff
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   lib/igt_fb.c          | 24 ++++++++++++++++++++++++
> >   lib/intel_bufops.h    |  1 +
> >   lib/rendercopy_gen9.c | 14 +++++++++++---
> >   3 files changed, 36 insertions(+), 3 deletions(-)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 21c56a454c5a..0eb3897d0f8b 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -965,6 +965,16 @@ void igt_calc_fb_size(struct igt_fb *fb)
> >   		size += calc_plane_size(fb, plane);
> >   	}
> >   
> > +	/*
> > +	 * We always need a clear color on TGL, make some extra
> > +	 * room for one it if it's not explicit in the modifier.
> > +	 *
> > +	 * TODO: probably better to allocate this as part of the
> > +	 * batch instead so the fb size doesn't need to change...
> > +	 */
> > +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS)
> > +		size = ALIGN(size + 64, 64);
> > +
> >   	if (is_xe_device(fb->fd)) {
> >   		size = ALIGN(size, xe_get_default_alignment(fb->fd));
> >   		if (fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
> > @@ -2670,6 +2680,20 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> >   	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
> >   		buf->cc.offset = fb->offsets[1];
> >   
> > +	/*
> > +	 * TGL appears to do automagic fast clear when rendering
> > +	 * black and the clear color isn't specified, or when the
> > +	 * output matches the specified clear color. Force a
> > +	 * non-sensical clear color to prevent it from doing this
> > +	 * when using a non-clear color modifier.
> > +	 *
> > +	 * TODO: figure out if other platforms are affected...
> > +	 */
> > +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS) {
> 
> What about adlp on this? I believe it will now get same treatment as tgl 
> and ci doesn't seem to have adlp on shards so there's no good results(?)

I *think* adl wasn't affected, but I'll need to double check that...

Although apart from allocating a bit of extra memory this should
be completely harmeless on unaffected platforms.

> 
> /Juha-Pekka
> 
> > +		buf->cc.disable = true;
> > +		buf->cc.offset = fb->size - 64;
> > +	}
> > +
> >   	return buf;
> >   }
> >   
> > diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> > index 84e71d41a2c2..06e72ba4ba93 100644
> > --- a/lib/intel_bufops.h
> > +++ b/lib/intel_bufops.h
> > @@ -38,6 +38,7 @@ struct intel_buf {
> >   	} ccs[2];
> >   	struct {
> >   		uint32_t offset;
> > +		bool disable;
> >   	} cc;
> >   	struct {
> >   		uint64_t offset;
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index 5ee4c89f5cdb..f0757a8e6b78 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -1133,15 +1133,23 @@ void _gen9_render_op(struct intel_bb *ibb,
> >   
> >   	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
> >   
> > -	if (fast_clear) {
> > +	if (fast_clear || dst->cc.disable) {
> >   		for (int i = 0; i < 4; i++) {
> >   			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
> >   			intel_bb_emit_reloc(ibb, dst->handle,
> >   					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> >                                               dst->cc.offset + i*sizeof(float),
> >   					    dst->addr.offset);
> > -			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> > -               }
> > +			if (fast_clear) {
> > +				intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> > +			} else {
> > +				/*
> > +				 * Emit NaN so it'll match nothing and thus prevent
> > +				 * TGL from doing its automagic fast clear tricks.
> > +				 */
> > +				intel_bb_out(ibb, 0xffffffff);
> > +			}
> > +		}
> >          }
> >   
> >   

-- 
Ville Syrjälä
Intel
