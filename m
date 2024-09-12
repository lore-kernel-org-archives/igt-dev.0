Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9934DEEB595
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 11:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5503410EAF8;
	Thu, 12 Sep 2024 11:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKvPM7Q8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1409110EAF8
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726140880; x=1757676880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rMlKbCZAEU1IdDGrVl4NoCbW0WZPQzgauXrvmXWHO6w=;
 b=YKvPM7Q8DdZU9A2xocSjIFRQbzsjMRbUbjXCm3GBwYZAjpsrjyFRkdNL
 F5XMOLQVRTqja4j2NftXRblA10grHyUaNnh5jbGJd6+8Idmj7FXLhLIr+
 lWyREDw1jgRasbVpoaO1v8YmWWKPTRPVEKI76P/PF2JvCc4yM5ct5OXfM
 3rJaweXS4Yx1b1rBeR2wK7xJ6XyWKL6WGbY+WTBK1Hw2lrRJcQzzvk+dt
 q9AnNj1Uhb4ms9BIfKap+Tc0XeIkU39tzu1qP2CTmQEjs6YMUYdadvpHN
 zZAo2j0bSORvKpnF0Y+aemXlhP/eNVAx/XnYuluFIxtxfdVsxifjaHPN7 w==;
X-CSE-ConnectionGUID: fy/C0714SneEYah+UcbkQQ==
X-CSE-MsgGUID: PUwSKLUORru10Xd9VzRCrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25135519"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25135519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:34:30 -0700
X-CSE-ConnectionGUID: uTe14wwfR/eb7W+Av1RqIQ==
X-CSE-MsgGUID: T4D5CFttRfK3HqBlkCjhig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67745105"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Sep 2024 04:34:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Sep 2024 14:34:21 +0300
Date: Thu, 12 Sep 2024 14:34:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/23] lib/rendercopy: Always setup clear color for
 TGL
Message-ID: <ZuLRvZl96X6S7qGP@intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
 <20240902143758.21036-6-ville.syrjala@linux.intel.com>
 <d08eeda6-a8e9-4ab9-8dc2-4860e97a2307@gmail.com>
 <ZtsHYjwtGwrNDU-E@intel.com>
 <033d025a-a6bb-441b-a0f2-b32854932344@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <033d025a-a6bb-441b-a0f2-b32854932344@gmail.com>
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

On Sat, Sep 07, 2024 at 11:26:52AM +0300, Juha-Pekka Heikkila wrote:
> On 6.9.2024 16.45, Ville Syrjälä wrote:
> > On Fri, Sep 06, 2024 at 04:09:19PM +0300, Juha-Pekka Heikkila wrote:
> >> On 2.9.2024 17.37, Ville Syrjala wrote:
> >>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>
> >>> TGL apparently automagically converts regular output to fast
> >>> clears when the output matches the configured clear color.
> >>> And if we don't enable the clear color packet at all then we
> >>> just get some rainbow gibberish on all black parts of the
> >>> output.
> >>>
> >>> To avoid always set up the clear color packet when using
> >>> using a non-clear color modifier. We'll just stick a bunch
> >>> of NaNs into the clear value so it'll never match any
> >>> legitimate output, and thus automagic fast clear should not
> >>> happen.
> >>>
> >>> TODO: Hide this better inside rendercopy_gen9.c without
> >>>         requring extra allocation in the FB BO
> >>> TODO: Figure out if other platforms need this sort stuff
> >>>
> >>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>> ---
> >>>    lib/igt_fb.c          | 24 ++++++++++++++++++++++++
> >>>    lib/intel_bufops.h    |  1 +
> >>>    lib/rendercopy_gen9.c | 14 +++++++++++---
> >>>    3 files changed, 36 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> >>> index 21c56a454c5a..0eb3897d0f8b 100644
> >>> --- a/lib/igt_fb.c
> >>> +++ b/lib/igt_fb.c
> >>> @@ -965,6 +965,16 @@ void igt_calc_fb_size(struct igt_fb *fb)
> >>>    		size += calc_plane_size(fb, plane);
> >>>    	}
> >>>    
> >>> +	/*
> >>> +	 * We always need a clear color on TGL, make some extra
> >>> +	 * room for one it if it's not explicit in the modifier.
> >>> +	 *
> >>> +	 * TODO: probably better to allocate this as part of the
> >>> +	 * batch instead so the fb size doesn't need to change...
> >>> +	 */
> >>> +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS)
> >>> +		size = ALIGN(size + 64, 64);
> >>> +
> >>>    	if (is_xe_device(fb->fd)) {
> >>>    		size = ALIGN(size, xe_get_default_alignment(fb->fd));
> >>>    		if (fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
> >>> @@ -2670,6 +2680,20 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> >>>    	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
> >>>    		buf->cc.offset = fb->offsets[1];
> >>>    
> >>> +	/*
> >>> +	 * TGL appears to do automagic fast clear when rendering
> >>> +	 * black and the clear color isn't specified, or when the
> >>> +	 * output matches the specified clear color. Force a
> >>> +	 * non-sensical clear color to prevent it from doing this
> >>> +	 * when using a non-clear color modifier.
> >>> +	 *
> >>> +	 * TODO: figure out if other platforms are affected...
> >>> +	 */
> >>> +	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS) {
> >>
> >> What about adlp on this? I believe it will now get same treatment as tgl
> >> and ci doesn't seem to have adlp on shards so there's no good results(?)
> > 
> > I *think* adl wasn't affected, but I'll need to double check that...
> > 
> > Although apart from allocating a bit of extra memory this should
> > be completely harmeless on unaffected platforms.
> 
> ah yes, true. At the worst this will reveal something that was not 
> handled for adlp.

Mesa has a wa 1607794140 for this stuff which they limit to
TGL:A0-C0 and DG1.

Digging a bit more based on that there is apparently a new
bit in 3DSTATE_3DMODE ("Fast clear optimization (FCV)" (what the
"V" stands for I have no idea). However that new bit only seems to
exist on DG2+ only, but not for TGL/DG1/ADL.

I re-ran the tests:
- My TGL is definitely affected (can't remember what stepping it is).
  This fake clear color thing seems to cure it 100%.
- Didn't test DG1 since I don't have a suitable machine to plug it into
- ADL never seems to do this optimization, so the fake clear color
  would be redundant.
- for DG2 I can enable this via 3DSTATE_3DMODE, after which it somewhat
  matches the TGL behaviour. Though using the fake clear color trick
  doesn't 100% cure it on DG2 for some unknown reason. Looks mostly
  good but there are a few blocks of incorrect pixels sprinkled here
  and there.

I'll update the comment a bit when pushing this, but based on that
I think we should be OK to do this unconditonally for
I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS.

> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> > 
> >>
> >> /Juha-Pekka
> >>
> >>> +		buf->cc.disable = true;
> >>> +		buf->cc.offset = fb->size - 64;
> >>> +	}
> >>> +
> >>>    	return buf;
> >>>    }
> >>>    
> >>> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> >>> index 84e71d41a2c2..06e72ba4ba93 100644
> >>> --- a/lib/intel_bufops.h
> >>> +++ b/lib/intel_bufops.h
> >>> @@ -38,6 +38,7 @@ struct intel_buf {
> >>>    	} ccs[2];
> >>>    	struct {
> >>>    		uint32_t offset;
> >>> +		bool disable;
> >>>    	} cc;
> >>>    	struct {
> >>>    		uint64_t offset;
> >>> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> >>> index 5ee4c89f5cdb..f0757a8e6b78 100644
> >>> --- a/lib/rendercopy_gen9.c
> >>> +++ b/lib/rendercopy_gen9.c
> >>> @@ -1133,15 +1133,23 @@ void _gen9_render_op(struct intel_bb *ibb,
> >>>    
> >>>    	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
> >>>    
> >>> -	if (fast_clear) {
> >>> +	if (fast_clear || dst->cc.disable) {
> >>>    		for (int i = 0; i < 4; i++) {
> >>>    			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
> >>>    			intel_bb_emit_reloc(ibb, dst->handle,
> >>>    					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
> >>>                                                dst->cc.offset + i*sizeof(float),
> >>>    					    dst->addr.offset);
> >>> -			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> >>> -               }
> >>> +			if (fast_clear) {
> >>> +				intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> >>> +			} else {
> >>> +				/*
> >>> +				 * Emit NaN so it'll match nothing and thus prevent
> >>> +				 * TGL from doing its automagic fast clear tricks.
> >>> +				 */
> >>> +				intel_bb_out(ibb, 0xffffffff);
> >>> +			}
> >>> +		}
> >>>           }
> >>>    
> >>>    
> > 

-- 
Ville Syrjälä
Intel
