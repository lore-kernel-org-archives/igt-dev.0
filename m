Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D2CFA76E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 10:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD5410E84D;
	Fri, 21 Nov 2025 10:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XD0KfOFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87B110E84D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763721508; x=1795257508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OVhbhjoAVgUcH6xJVzzCNkZ3pcPhWj9TBDQArFL3vwY=;
 b=XD0KfOFuZFBCrZBcnRgpDwWiMyBoRqzqpu78DgW+XzkwSJtCU1bSu5Sw
 iqr3gbwOzFHJgltsgQL5Y9FqwLRcx75F1ynsxHutnD18+9lsQjiRl15uq
 Up4CAl5uaS8xpRa/TGo9ey/BNZ70XmkK/Fqk9WLnMyyaNlVaaMyX2DO1q
 1kS9+HcSx2Kh4d2TjmJmOxRHmP8R90fVOjZbrcIlJGIyQxGsC0o7TAWCO
 BqYTRqjz2EoTI0z1CuywNjrHSwl2LxmwAg9XBw90UjoaUHV+Umo9xPx0I
 aR4iKhVzsaV9drb2cV9d0kUe1RbsWpIftbp+43uwZZiHSZYG2EV71vpia Q==;
X-CSE-ConnectionGUID: R1EZHmdhRnSkRGG2EyaFQg==
X-CSE-MsgGUID: fnRcIc21R0y+AdRitl+g2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91292927"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="91292927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 02:38:27 -0800
X-CSE-ConnectionGUID: l8dkLkmHSXWNqPnTkXq95g==
X-CSE-MsgGUID: FqYlukMuQEW366HtUQNb9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191451611"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 02:38:23 -0800
Date: Fri, 21 Nov 2025 12:38:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Message-ID: <aSBBG2n64m65CWLR@intel.com>
References: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
 <aSApNt1PwpgrX5E9@intel.com>
 <0a2d25af2c0ba3c5bc26e445a46413c90a77a19e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2d25af2c0ba3c5bc26e445a46413c90a77a19e.camel@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Nov 21, 2025 at 09:47:52AM +0000, Jason-JH Lin (林睿祥) wrote:
> Hi Ville,
> 
> Thanks for your rapid reply.
> 
> On Fri, 2025-11-21 at 10:56 +0200, Ville Syrjälä wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Fri, Nov 21, 2025 at 03:53:54PM +0800, Jason-JH Lin wrote:
> > > When a driver makes use of gamma_lut, degamma_lut, or ctm
> > > properties
> > > from crtc state, these properties are applied only via atomic
> > > commit.
> > > This change ensures all relevant properties are properly
> > > synchronized
> > > to crtc state during testing.
> > > 
> > > All upstream drivers that support color management properties also
> > > support atomic commits, so legacy commit handling in kms_color is
> > > no
> > > longer needed.
> > 
> > Incorrect.
> 
> The conclusion is refer from:
> https://patchwork.freedesktop.org/patch/254752/?series=50539&rev=1
> 
> I'll remove it because I'm not sure for this.
> 
> > 
> > But rather than spreading the current mess even further, I think
> > what we want is a igt_display_commit() variant that takes care of
> > the is_atomic check. So add that, blast it over all the existing
> > places that do the check by hand (with cocci/sed/etc), and
> > and then look at using it for new stuff like this where it
> > probably makes sense to use atomic when available.
> > 
> 
> Sorry for missing you in the cc loop.
> Does my previous version of this patch satisfy this?
> https://patchwork.freedesktop.org/patch/687863/

I meant that you should add some kind of
 igt_display_commit_something()
 {
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
wrapper thingy, and deploy it everwhere that currently
has that is_atomic check open coded. I guess the real problem
is coming up with a name... igt_display_commit_auto() maybe?

> 
> > > 
> > > Update the test logic to always use igt_display_commit_atomic with
> > > DRM_MODE_ATOMIC_ALLOW_MODESET for all color management operations.
> > > This simplifies code and guarantees correct validation of gamma,
> > > degamma, and ctm properties.
> > 
> > What do you mean with "guarantees correct validation"? The current
> > code works just fine AFAIK.
> 
> I have encountered that GAMM_LUT drm property is not updated into the
> gamma_lut struct in drm_crtc_state via igt_disaply_commit().
> 
> I found igt_disaply_commit() will finally call
> drmModeObjectSetProperty() and igt_plane_commit() in igt_pipe_commit().
> These functions will set GAMM_LUT property to drm driver but they won't
> update the gamma_lut struct in crtc state. So our GAMMA driver won't do
> anything when running these IGT KmsColorTest.

Whether the commit comes via that atomic ioctl or the setproperty ioctl
the same exact code gets used to update the blobs in the crtc state,
and then the driver's atomic hooks get called in exactly the same way.

But with the non-atomic igt commit you obviously will see multiple
commits coming into the kernel, and you won't see the full state in
the kernel until all the commits are done. 

So if you're saying that the crtc state gamma blob didn't have the
expected new stuff in it, then I think you were either looking at 
the state before all the commits had arrived, or you have some kind
of driver bug where the state gets corrupted.

> 
> Then I found igt_atomic_commit() will sync these properties to drm_crtc
> _state and make our HW driver work successfully. So I send the patch to
> ask for review and guidance.
> 
> Or do you know what I may miss in the original igt_disaply_commit()?

IIRC the one thing that is busted in the legacy commit path is
plane properties for primary/cursor planes. Pretty sure I sent
a patch to fix that long ago, but it might have had some kind of
performance problem due to some unintended property value
ping-pong. I suppose I should take another look at it again...

Anyways, that's only about plane properties so should have nothing
to do with the crtc gamma stuff.

> 
> > 
> > > 
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >  tests/kms_color.c | 47 ++++++++++++++++++++++++-------------------
> > > ----
> > >  1 file changed, 24 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > > index c424083b7fd4..0d2baf8f8aad 100644
> > > --- a/tests/kms_color.c
> > > +++ b/tests/kms_color.c
> > > @@ -125,12 +125,12 @@ static bool test_pipe_degamma(data_t *data,
> > >       disable_ctm(primary->pipe);
> > >       disable_gamma(primary->pipe);
> > >       set_degamma(data, primary->pipe, degamma_linear);
> > > -     igt_display_commit(&data->display);
> > > +     igt_display_commit_atomic(display,
> > > DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> > > 
> > >       /* Draw solid colors with linear degamma transformation. */
> > >       paint_rectangles(data, mode, red_green_blue, &fb);
> > >       igt_plane_set_fb(primary, &fb);
> > > -     igt_display_commit(&data->display);
> > > +     igt_display_commit_atomic(display,
> > > DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> > >       igt_wait_for_vblank(data->drm_fd,
> > 
> 
> [snip]
> 
> > --
> > Ville Syrjälä
> > Intel
> 
> Regards,
> Jason-JH Lin

-- 
Ville Syrjälä
Intel
