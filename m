Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E1C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 22:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E80C10E4A1;
	Tue,  2 Jul 2024 22:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTdZPMeq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D1410E4A1
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 22:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719960826; x=1751496826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=L2siD0Q3wSiB2laQXtIZiUvMVjrqdSYOVaN309ZXpP4=;
 b=gTdZPMeqRXg4DzDf9Q7vo3URAlrJdh3P/LMn7AgR+QLk5NZpafUIhpRc
 NRVbNAYreNtxt7Iz6wo7HhaEruDeW87oxxqO/S4gkSfBw1EuvOSicrYFF
 enhtfphnZwFn53E8S67EqaXptAJLlp54x5vpjEzIvi5cz9oc76OGXC3XP
 KsZLyiggYnNgBwF69UWsANx6by0/FAeMQVF2htNAzEnxhmKE4AL5tiD8I
 Tll26mhHb+QL9pEpLn9RlQ3CQFGf2IyNJgm2mN3kJHP622hZpNW5mZN6e
 3ACBXGL5oR1bIyXkrH7YGQfgdy4DOVwH67onX5PKmVxnoWl8AXvLmzpCq A==;
X-CSE-ConnectionGUID: GHpr6qY7QVyco02Z5nWgLQ==
X-CSE-MsgGUID: PN+a6XB4QwWP5hDiEihz7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21033943"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="21033943"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 15:53:46 -0700
X-CSE-ConnectionGUID: isqstuYCQYC+e1M4ueqeOg==
X-CSE-MsgGUID: vlsZGWD4TW+rpmLN/Snb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46039361"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 15:53:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 01:53:43 +0300
Date: Wed, 3 Jul 2024 01:53:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 1/6] lib/rendercopy: Add deltas to all surface
 relocs
Message-ID: <ZoSE95zvC2Skkp7W@intel.com>
References: <20240625174032.10398-2-ville.syrjala@linux.intel.com>
 <20240627112218.9839-1-ville.syrjala@linux.intel.com>
 <20240702054904.smncbrmvu2sw4o7y@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702054904.smncbrmvu2sw4o7y@zkempczy-mobl2>
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

On Tue, Jul 02, 2024 at 07:49:04AM +0200, Zbigniew Kempczyński wrote:
> On Thu, Jun 27, 2024 at 02:22:18PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > In order to copy stuff not at offset 0 in the BO we need
> > to include the delta in the relocs/etc.
> > 
> > v2: fix the address in the command packets
> > v3: Fix intel_bb_offset_reloc_with_delta() argument order on gen7
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/rendercopy_gen4.c | 11 ++++++-----
> >  lib/rendercopy_gen6.c | 11 ++++++-----
> >  lib/rendercopy_gen7.c | 11 ++++++-----
> >  lib/rendercopy_gen8.c | 13 +++++++------
> >  lib/rendercopy_gen9.c | 13 +++++++------
> >  lib/rendercopy_i830.c | 10 +++++++---
> >  lib/rendercopy_i915.c |  6 ++++--
> >  7 files changed, 43 insertions(+), 32 deletions(-)
> > 
> > diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
> > index 8536d6b632c5..8582e0efb886 100644
> > --- a/lib/rendercopy_gen4.c
> > +++ b/lib/rendercopy_gen4.c
> > @@ -148,11 +148,12 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
> >  	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
> >  	ss->ss0.color_blend = 1;
> >  
> > -	address = intel_bb_offset_reloc(ibb, buf->handle,
> > -					read_domain, write_domain,
> > -					intel_bb_offset(ibb) + 4,
> > -					buf->addr.offset);
> > -	ss->ss1.base_addr = (uint32_t) address;
> > +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > +						   read_domain, write_domain,
> > +						   buf->surface[0].offset,
> > +						   intel_bb_offset(ibb) + 4,
> > +						   buf->addr.offset);
> > +	ss->ss1.base_addr = address + buf->surface[0].offset;
> 
> LGTM. I haven't seen surface[0].offset differ than 0 in current IGTs
> so this won't break anything.

Yeah, I need it for rendercopy with planar formats. Though
thew way I'm doing it is by stuffing the luma and chroma into
surface[0] in turn. I'm not totally convinced we should even
have this surface[] array in intel_buf. Might be nicer if
intel_buf would represent just one color planea (+ its aux/cc
where appropriate). But that would require changes to the
vebox code at least since it handles planar formats in one
pass...

> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
> >  
> >  	ss->ss2.height = intel_buf_height(buf) - 1;
> >  	ss->ss2.width  = intel_buf_width(buf) - 1;
> > diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
> > index e941257eb606..ec197661702f 100644
> > --- a/lib/rendercopy_gen6.c
> > +++ b/lib/rendercopy_gen6.c
> > @@ -91,11 +91,12 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
> >  	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
> >  	ss->ss0.color_blend = 1;
> >  
> > -	address = intel_bb_offset_reloc(ibb, buf->handle,
> > -					read_domain, write_domain,
> > -					intel_bb_offset(ibb) + 4,
> > -					buf->addr.offset);
> > -	ss->ss1.base_addr = (uint32_t) address;
> > +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > +						   read_domain, write_domain,
> > +						   buf->surface[0].offset,
> > +						   intel_bb_offset(ibb) + 4,
> > +						   buf->addr.offset);
> > +	ss->ss1.base_addr = address + buf->surface[0].offset;
> >  
> >  	ss->ss2.height = intel_buf_height(buf) - 1;
> >  	ss->ss2.width  = intel_buf_width(buf) - 1;
> > diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
> > index 9fadb0772e9e..e3657b5d1035 100644
> > --- a/lib/rendercopy_gen7.c
> > +++ b/lib/rendercopy_gen7.c
> > @@ -86,11 +86,12 @@ gen7_bind_buf(struct intel_bb *ibb,
> >  		 gen7_tiling_bits(buf->tiling) |
> >  		format << GEN7_SURFACE_FORMAT_SHIFT);
> >  
> > -	address = intel_bb_offset_reloc(ibb, buf->handle,
> > -					read_domain, write_domain,
> > -					intel_bb_offset(ibb) + 4,
> > -					buf->addr.offset);
> > -	ss[1] = address;
> > +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > +						   read_domain, write_domain,
> > +						   buf->surface[0].offset,
> > +						   intel_bb_offset(ibb) + 4,
> > +						   buf->addr.offset);
> > +	ss[1] = address + buf->surface[0].offset;
> >  	ss[2] = ((intel_buf_width(buf) - 1)  << GEN7_SURFACE_WIDTH_SHIFT |
> >  		 (intel_buf_height(buf) - 1) << GEN7_SURFACE_HEIGHT_SHIFT);
> >  	ss[3] = (buf->surface[0].stride - 1) << GEN7_SURFACE_PITCH_SHIFT;
> > diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
> > index bbfa6d28f525..23bea56ad1ba 100644
> > --- a/lib/rendercopy_gen8.c
> > +++ b/lib/rendercopy_gen8.c
> > @@ -109,12 +109,13 @@ gen8_bind_buf(struct intel_bb *ibb,
> >  		ss->ss1.memory_object_control = BDW_MOCS_PTE |
> >  			BDW_MOCS_TC_L3_PTE | BDW_MOCS_AGE(0);
> >  
> > -	address = intel_bb_offset_reloc(ibb, buf->handle,
> > -					read_domain, write_domain,
> > -					intel_bb_offset(ibb) + 4 * 8,
> > -					buf->addr.offset);
> > -	ss->ss8.base_addr = address;
> > -	ss->ss9.base_addr_hi = address >> 32;
> > +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > +						   read_domain, write_domain,
> > +						   buf->surface[0].offset,
> > +						   intel_bb_offset(ibb) + 4 * 8,
> > +						   buf->addr.offset);
> > +	ss->ss8.base_addr = (address + buf->surface[0].offset);
> > +	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
> >  
> >  	ss->ss2.height = intel_buf_height(buf) - 1;
> >  	ss->ss2.width  = intel_buf_width(buf) - 1;
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index 726f1a087bd2..9b2d1ff688de 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -210,12 +210,13 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> >  	if (intel_buf_pxp(buf))
> >  		ss->ss1.pxp = 1;
> >  
> > -	address = intel_bb_offset_reloc(ibb, buf->handle,
> > -					read_domain, write_domain,
> > -					intel_bb_offset(ibb) + 4 * 8,
> > -					buf->addr.offset);
> > -	ss->ss8.base_addr = address;
> > -	ss->ss9.base_addr_hi = address >> 32;
> > +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > +						   read_domain, write_domain,
> > +						   buf->surface[0].offset,
> > +						   intel_bb_offset(ibb) + 4 * 8,
> > +						   buf->addr.offset);
> > +	ss->ss8.base_addr = (address + buf->surface[0].offset);
> > +	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
> >  
> >  	ss->ss2.height = intel_buf_height(buf) - 1;
> >  	ss->ss2.width  = intel_buf_width(buf) - 1;
> > diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
> > index 4c4271493b4b..4b0ea3b859e2 100644
> > --- a/lib/rendercopy_i830.c
> > +++ b/lib/rendercopy_i830.c
> > @@ -158,8 +158,10 @@ static void gen2_emit_target(struct intel_bb *ibb,
> >  	intel_bb_out(ibb, _3DSTATE_BUF_INFO_CMD);
> >  	intel_bb_out(ibb, BUF_3D_ID_COLOR_BACK | tiling |
> >  		     BUF_3D_PITCH(dst->surface[0].stride));
> > -	intel_bb_emit_reloc(ibb, dst->handle, I915_GEM_DOMAIN_RENDER,
> > -			    I915_GEM_DOMAIN_RENDER, 0, dst->addr.offset);
> > +	intel_bb_emit_reloc(ibb, dst->handle,
> > +			    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> > +			    dst->surface[0].offset,
> > +			    dst->addr.offset);
> >  
> >  	intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
> >  	intel_bb_out(ibb, format |
> > @@ -199,7 +201,9 @@ static void gen2_emit_texture(struct intel_bb *ibb,
> >  		tiling |= TM0S1_TILE_WALK;
> >  
> >  	intel_bb_out(ibb, _3DSTATE_LOAD_STATE_IMMEDIATE_2 | LOAD_TEXTURE_MAP(unit) | 4);
> > -	intel_bb_emit_reloc(ibb, src->handle, I915_GEM_DOMAIN_SAMPLER, 0, 0,
> > +	intel_bb_emit_reloc(ibb, src->handle,
> > +			    I915_GEM_DOMAIN_SAMPLER, 0,
> > +			    src->surface[0].offset,
> >  			    src->addr.offset);
> >  	intel_bb_out(ibb, (intel_buf_height(src) - 1) << TM0S1_HEIGHT_SHIFT |
> >  		     (intel_buf_width(src) - 1) << TM0S1_WIDTH_SHIFT |
> > diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
> > index 3e421301e6a6..94cdfb99af9a 100644
> > --- a/lib/rendercopy_i915.c
> > +++ b/lib/rendercopy_i915.c
> > @@ -112,7 +112,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
> >  		intel_bb_out(ibb, (1 << TEX_COUNT) - 1);
> >  		intel_bb_emit_reloc(ibb, src->handle,
> >  				    I915_GEM_DOMAIN_SAMPLER, 0,
> > -				    0, src->addr.offset);
> > +				    src->surface[0].offset,
> > +				    src->addr.offset);
> >  		intel_bb_out(ibb, format_bits | tiling_bits |
> >  			     (intel_buf_height(src) - 1) << MS3_HEIGHT_SHIFT |
> >  			     (intel_buf_width(src) - 1) << MS3_WIDTH_SHIFT);
> > @@ -155,7 +156,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
> >  			     BUF_3D_PITCH(dst->surface[0].stride));
> >  		intel_bb_emit_reloc(ibb, dst->handle,
> >  				    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> > -				    0, dst->addr.offset);
> > +				    dst->surface[0].offset,
> > +				    dst->addr.offset);
> >  
> >  		intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
> >  		intel_bb_out(ibb, format_bits |
> > -- 
> > 2.44.2
> > 

-- 
Ville Syrjälä
Intel
