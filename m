Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E9210AB82A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 22:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2F10EAE8;
	Thu, 26 Mar 2026 22:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALJVg+6j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCB010EAE8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 22:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774565110; x=1806101110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y7HIKqx8ZMv7MWnlXwBo4dsf9qFiEkYcBpwVolsjf1w=;
 b=ALJVg+6j8n9Cwp779H39AAQHTlH3UFaaLQmw/EMig96A/katF67Jdq2C
 cT3bm9aSQfSB3xyO2kI9ShBiS2CMIirUedoktrzdxLrAfN+hXl4TLd1oE
 CauU2+uvsasTkh8J4w3yOzW0tzg6SQ44+U4ImXXlk8maJfAZMcDbigGP1
 n5sQpvmO/oBV3Eh3nBCHfe7Tsa/hdR14Ww2bJYR/8gTUXA36zCuWjLZJE
 f8tM5YJiUJy2iL1LDMNPg4CQBxzut3O0N2DawQmUxcmDgYibdzG4PMdye
 hZt8oTMFYOpZVJ5E9jOAGNEFoB8EGmNU53EN34U72mfQIbBKnRFVVc6oe A==;
X-CSE-ConnectionGUID: okROFWKeTtuWMDu6865SAA==
X-CSE-MsgGUID: joOnN6K6RR2ZjCP1XL6nzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75530262"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75530262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:45:10 -0700
X-CSE-ConnectionGUID: dwU9CGX4Qf+Swk//HzDkzw==
X-CSE-MsgGUID: ZUKta7CfSbmfeV3BGtgpiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="229607669"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:45:09 -0700
Date: Fri, 27 Mar 2026 00:45:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status checks
Message-ID: <acW28s0esy571c5F@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-2-vinod.govindapillai@intel.com>
 <e2800fef737c676e44f15a7be8441ce89cae66f3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2800fef737c676e44f15a7be8441ce89cae66f3@intel.com>
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

On Thu, Mar 26, 2026 at 11:27:47AM +0200, Jani Nikula wrote:
> On Thu, 26 Mar 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> > Replace the fbc status check for "mode too large for compression" wchich
> > is no longer being set by the driver with "plane size too big" and
> > "surface size too big" fbc status checks.
> >
> > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > ---
> >  tests/intel/kms_frontbuffer_tracking.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> > index c16f63199..e764c9ce1 100644
> > --- a/tests/intel/kms_frontbuffer_tracking.c
> > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > @@ -1664,15 +1664,23 @@ static bool fbc_stride_not_supported(void)
> >  	char buf[128];
> >  
> >  	debugfs_read_crtc("i915_fbc_status", buf);
> > -	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
> > +	return strstr(buf, "FBC disabled: stride not supported\n");
> >  }
> >  
> > -static bool fbc_mode_too_large(void)
> > +static bool fbc_plane_size_too_big(void)
> >  {
> >  	char buf[128];
> >  
> >  	debugfs_read_crtc("i915_fbc_status", buf);
> > -	return strstr(buf, "FBC disabled: mode too large for compression\n");
> > +	return strstr(buf, "FBC disabled: plane size too big\n");
> > +}
> > +
> > +static bool fbc_surface_size_too_big(void)
> > +{
> > +	char buf[128];
> > +
> > +	debugfs_read_crtc("i915_fbc_status", buf);
> > +	return strstr(buf, "FBC disabled: surface size too big\n");
> >  }
> >  
> >  static bool fbc_psr_not_possible(void)
> > @@ -2356,7 +2364,8 @@ static void do_status_assertions(int flags)
> >  	if (flags & ASSERT_FBC_ENABLED) {
> >  		igt_require(!fbc_not_enough_stolen());
> >  		igt_require(!fbc_stride_not_supported());
> > -		igt_require(!fbc_mode_too_large());
> > +		igt_require(!fbc_plane_size_too_big());
> > +		igt_require(!fbc_surface_size_too_big());
> 
> I think the problem with the current implementation and this series is
> that it still keeps all those i915_fbc_status reads in place, instead of
> reading it *once* and then figuring it out.
> 
> You could e.g. have a function that reads i915_fbc_status, parses it
> into, I don't know, an enum on the igt side, with some handling of
> unknown "FBC disabled: xxx" messages, and returns that.
> 
> And then you get that status once, and check that, instead of reading
> the file N times.

The other big problem is that the buffer size used for this is too 
small. A while ago I noticed that it was getting chopped off so I
have a patch in some branch that doubles it. But dunno if even that
is sufficient on the latest platforms with more and more FBC capable
planes. Someone should probably check that...

-- 
Ville Syrjälä
Intel
