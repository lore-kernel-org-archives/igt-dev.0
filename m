Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579CFD49212
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 12:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354E10E081;
	Mon, 18 Nov 2024 12:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7F9ig8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A938110E081
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731934133; x=1763470133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7x0eBLs7xvq47ikHvweyV39kqrENXJBKObaXhCRQFuU=;
 b=S7F9ig8YIfIXoiw5gWkJ2y9t9wWwfAlaugFJkuUD+WeYDWwVa06Cc0tf
 7LXwRZZHZSALv9VoW21sXD9o1cppE56ibMTyRF5FkvG1g81QtE/lww5dz
 +iv55uU4HtcNQEieGtShIZJ7CUtJI8GYjHB9ZVbfs67XdAXmgihR0kSLz
 Yc52zrFJ6rDIlJlrL3QXy9zhKlYttB00KTNCuIHtRCEaLBMVYzNYqEWo+
 xamv0h561baZuwqTN5iTQ7XLKg5BDx++7h2ABymAduHDidhFJbV/8Cu2c
 1fpHbdqi19gncPkgc2cjcc3hhGCuPSsboUG0p3AXSDpBlM7ZGdd1pOU/6 g==;
X-CSE-ConnectionGUID: 14wBAh08R4W3mh8ZIWlrUg==
X-CSE-MsgGUID: MkwEk/pBTASeOodQB3VBWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49425922"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="49425922"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:48:53 -0800
X-CSE-ConnectionGUID: aYf5y6d1SBKE7RNjfkn0TA==
X-CSE-MsgGUID: h6dcyCLKQsyzhl9WAGOqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89646779"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:48:52 -0800
Date: Mon, 18 Nov 2024 13:48:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH i-g-t v3 5/9] XE3: tests/kms_addfb_basic: fix x-tiled
 tests for case when there is no x-tile
Message-ID: <20241118124849.47jg5gczvubp4fi7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-6-clinton.a.taylor@intel.com>
 <20241115133105.o7772oanzhwk2kil@kamilkon-desk.igk.intel.com>
 <9a959681ca5fad5d62b7d4fa21deadaf3005ac40.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a959681ca5fad5d62b7d4fa21deadaf3005ac40.camel@intel.com>
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

Hi Taylor,,
On 2024-11-15 at 23:42:17 +0000, Taylor, Clinton A wrote:
> On Fri, 2024-11-15 at 14:31 +0100, Kamil Konieczny wrote:
> > Hi Clint,
> > On 2024-11-14 at 11:03:35 -0800, Clint Taylor wrote:
> > > From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> > 
> > Please use correct names here, it should be:
> > 
> > > From: "Juha-pekka Heikkila" <juha-pekka.heikkila@intel.com>
> > > On Xe3 display no more support x-tile and will disable such framebuffers
> > > 
> > > Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> > 
> > and here:
> > 
> > Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> > 
> > Please do the same corrections in other patches in this series.
> > 
>   I will ask JP if it's ok to change the original SOB and Author lines. They were
> originally committed this way.
> 

You are right, now I see I didn't add J-P to cc, so +cc
I am also not sure if it should be 'Juha-Pekka' or 'Juha-pekka'

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>

Regards,
Kamil

> 
> -Clint
> 
> > Regards,
> > Kamil
> > 
> > > Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> > > ---
> > >  tests/kms_addfb_basic.c | 22 ++++++++++++----------
> > >  1 file changed, 12 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> > > index b22818592..3ba87117b 100644
> > > --- a/tests/kms_addfb_basic.c
> > > +++ b/tests/kms_addfb_basic.c
> > > @@ -217,6 +217,12 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
> > >  	return err;
> > >  }
> > >  
> > > +static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
> > > +{
> > > +	return igt_display_has_format_mod(disp, f->pixel_format,
> > > +					  f->modifier[0]) ? 0 : -1;
> > > +}
> > > +
> > >  static void invalid_tests(int fd)
> > >  {
> > >  	struct drm_mode_fb_cmd2 f = {};
> > > @@ -735,8 +741,10 @@ static void addfb25_tests(int fd)
> > >  		igt_describe("Check if addfb2 call works for x-tiling");
> > >  		igt_subtest("addfb25-x-tiled-legacy") {
> > >  			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
> > > -			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> > > -			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
> > > +			igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> > > +				      addfb_expected_ret(&display, &f));
> > > +			if (!addfb_expected_ret(&display, &f))
> > > +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
> > >  			f.fb_id = 0;
> > >  		}
> > >  
> > > @@ -756,12 +764,6 @@ static void addfb25_tests(int fd)
> > >  		gem_close(fd, gem_bo);
> > >  }
> > >  
> > > -static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
> > > -{
> > > -	return igt_display_has_format_mod(disp, f->pixel_format,
> > > -					  f->modifier[0]) ? 0 : -1;
> > > -}
> > > -
> > >  static void addfb25_ytile(int fd)
> > >  {
> > >  	struct drm_mode_fb_cmd2 f = {};
> > > @@ -1012,8 +1014,6 @@ igt_main
> > >  
> > >  	master_tests(fd);
> > >  
> > > -	addfb25_tests(fd);
> > > -
> > >  	tiling_tests(fd);
> > >  
> > >  	igt_subtest_group {
> > > @@ -1025,6 +1025,8 @@ igt_main
> > >  		igt_fixture
> > >  			igt_require_intel(fd);
> > >  
> > > +		addfb25_tests(fd);
> > > +
> > >  		addfb25_ytile(fd);
> > >  
> > >  		addfb25_4tile(fd);
> > > -- 
> > > 2.25.1
> > > 
