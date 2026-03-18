Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8EB10854DB
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0FA10E792;
	Wed, 18 Mar 2026 09:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2wOiZsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FF210E032
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773827072; x=1805363072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P2pTpeoaV6D/mdUWn9hOVjXqycnWLFoOsdOylrk/dKE=;
 b=R2wOiZsnn5Vy98aq5OrBw6qn7sGX168CdEZoJNJKbYoy7R8toTgUJOJO
 MQLV91/YVSOjaGbH37N/8BXyBenpZ0wPsC0KJ0HcM8sw6mEASV471agtd
 EzyMM8GED1Qy2S+ImoJOigcl2Z/pYn0BdR6m1Cvh7S9H9Mn2ZTn3xiB1x
 +8XhyJfEQfwcAR+y9sAQY0EMqBSwlu1aTaPKaO60ZScETY41P71ZDf6JD
 CyOuL58M7ZzOmMryo0Gfks+Zgzmed2Ubbuk61O0bCk4VGieKuwc7RASms
 o7W8T97cFKph1LVpAxXQRnBIm+yWPqZ9dR3SFG2JMsWLzEtuX+dYf+1ao w==;
X-CSE-ConnectionGUID: jfNfDy55Q6+RbqvteLPSjw==
X-CSE-MsgGUID: R2xNcIs8T4uixEYrHGiu4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92445648"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="92445648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:44:32 -0700
X-CSE-ConnectionGUID: dyyOZaoFQv67BOSd5GlOJg==
X-CSE-MsgGUID: tuDjCx0LR6KwAQ8BvxYKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227515209"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.36])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:44:30 -0700
Date: Wed, 18 Mar 2026 11:44:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier
 when supported
Message-ID: <abpz-6xaOvlPfgXS@intel.com>
References: <20260316033807.24078-1-jeevan.b@intel.com>
 <abgWhvmToId2i7mj@intel.com>
 <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
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

On Mon, Mar 16, 2026 at 05:27:15PM +0000, B, Jeevan wrote:
> > -----Original Message-----
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Sent: Monday, March 16, 2026 8:15 PM
> > To: B, Jeevan <jeevan.b@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Naladala, Ramanaidu
> > <ramanaidu.naladala@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
> > supported
> > 
> > On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
> > > While creating the framebuffer, prefer tile4 when it is supported
> > > instead of always using linear. Fall back to linear if tile4 is not
> > > available.
> > 
> > Why?
> On Xe platforms, using the linear modifier takes longer to prepare and submit a flip compared to tiled modifiers. 

So it's a hack due to to the shortcomings of the xe driver. Someone
should really fix the kernel side so we didn't need such hacks...

> On HRR panels, the available frame time is small, and this delay can cause flips to be submitted in the Evasion region, 
> leading to sequence mismatches.
> > 
> > >
> > > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > > ---
> > >  tests/kms_cursor_legacy.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > > index 5399ef481..4c4e477a1 100644
> > > --- a/tests/kms_cursor_legacy.c
> > > +++ b/tests/kms_cursor_legacy.c
> > > @@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t
> > > *display, igt_crtc_t *crtc,  {
> > >  	drmModeModeInfoPtr mode;
> > >  	igt_plane_t *primary;
> > > +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
> > >
> > >  	igt_output_set_crtc(output, crtc);
> > >  	mode = igt_output_get_mode(output);
> > >
> > > +	primary = igt_output_get_plane_type(output,
> > DRM_PLANE_TYPE_PRIMARY);
> > > +
> > > +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
> > > +				     I915_FORMAT_MOD_4_TILED))
> > > +		modifier = I915_FORMAT_MOD_4_TILED;
> > > +
> > >  	igt_create_pattern_fb(display->drm_fd,
> > >  		      mode->hdisplay, mode->vdisplay,
> > > -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> > fb_info);
> > > +		      DRM_FORMAT_XRGB8888, modifier, fb_info);
> > >
> > > -	primary = igt_output_get_plane_type(output,
> > DRM_PLANE_TYPE_PRIMARY);
> > >  	igt_plane_set_fb(primary, fb_info);
> > >  }
> > >
> > > --
> > > 2.43.0
> > 
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
