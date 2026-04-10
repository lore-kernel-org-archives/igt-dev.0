Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B7F44873
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 14:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A280897FB;
	Fri, 10 Apr 2026 14:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbTCqg//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D27710E97B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775830458; x=1807366458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Rce64MIKcM1V/bMUJV34qEJhypLbPeH/dqOnbnM4krM=;
 b=kbTCqg//wIseLY3qfihM1h0E0oc1heNFoU540Ye0TyUOwYXoME448+rD
 nkq5GfYSuUCQNkMmF8bIP41CiVWJ4CNBFF/tt3BKQk/xh8Na52Cis+DSY
 xKO8xzimnTq4i88mE57J6ocQAIlgM3FU1nzY+pUa85DZS4CF9+KTEGGUk
 GR2IqKThScwN2hJSIMsh4AlBtk1ZOYO1zNX3ZXWYTuW6trpbVvRv/jBK+
 HEqha015mF/ZgvtFbrNJ+CFYObawdSsmYiKFy6kzIz+e2tjokixCFYJpC
 v4/PdLBWMyv4/QMIlrll1eC0/sIax/xyxYz0PKBzgCUeyVLFTxOnu/8Ct A==;
X-CSE-ConnectionGUID: /97Vm5PuQq6C968YWlOGoQ==
X-CSE-MsgGUID: GtHNetkjR/aTMtPGxL5vNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87925309"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87925309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 07:14:17 -0700
X-CSE-ConnectionGUID: 0vebzat0RbWEDnxbGMehig==
X-CSE-MsgGUID: +KCrBgwSSR2t8BziItKcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="230819467"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:14:15 -0700
Date: Fri, 10 Apr 2026 16:14:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t 1/4] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status checks
Message-ID: <20260410141413.ra6k6hude3eqf5md@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-2-vinod.govindapillai@intel.com>
 <e2800fef737c676e44f15a7be8441ce89cae66f3@intel.com>
 <acW28s0esy571c5F@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acW28s0esy571c5F@intel.com>
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

Hi Ville,
On 2026-03-27 at 00:45:06 +0200, Ville Syrjälä wrote:
> On Thu, Mar 26, 2026 at 11:27:47AM +0200, Jani Nikula wrote:
> > On Thu, 26 Mar 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> > > Replace the fbc status check for "mode too large for compression" wchich
> > > is no longer being set by the driver with "plane size too big" and
> > > "surface size too big" fbc status checks.
> > >
> > > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > > ---
> > >  tests/intel/kms_frontbuffer_tracking.c | 17 +++++++++++++----
> > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> > > index c16f63199..e764c9ce1 100644
> > > --- a/tests/intel/kms_frontbuffer_tracking.c
> > > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > > @@ -1664,15 +1664,23 @@ static bool fbc_stride_not_supported(void)
> > >  	char buf[128];
> > >  
> > >  	debugfs_read_crtc("i915_fbc_status", buf);
> > > -	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
> > > +	return strstr(buf, "FBC disabled: stride not supported\n");
> > >  }
> > >  
> > > -static bool fbc_mode_too_large(void)
> > > +static bool fbc_plane_size_too_big(void)
> > >  {
> > >  	char buf[128];
> > >  
> > >  	debugfs_read_crtc("i915_fbc_status", buf);
> > > -	return strstr(buf, "FBC disabled: mode too large for compression\n");
> > > +	return strstr(buf, "FBC disabled: plane size too big\n");
> > > +}
> > > +
> > > +static bool fbc_surface_size_too_big(void)
> > > +{
> > > +	char buf[128];
> > > +
> > > +	debugfs_read_crtc("i915_fbc_status", buf);
> > > +	return strstr(buf, "FBC disabled: surface size too big\n");
> > >  }
> > >  
> > >  static bool fbc_psr_not_possible(void)
> > > @@ -2356,7 +2364,8 @@ static void do_status_assertions(int flags)
> > >  	if (flags & ASSERT_FBC_ENABLED) {
> > >  		igt_require(!fbc_not_enough_stolen());
> > >  		igt_require(!fbc_stride_not_supported());
> > > -		igt_require(!fbc_mode_too_large());
> > > +		igt_require(!fbc_plane_size_too_big());
> > > +		igt_require(!fbc_surface_size_too_big());
> > 
> > I think the problem with the current implementation and this series is
> > that it still keeps all those i915_fbc_status reads in place, instead of
> > reading it *once* and then figuring it out.
> > 
> > You could e.g. have a function that reads i915_fbc_status, parses it
> > into, I don't know, an enum on the igt side, with some handling of
> > unknown "FBC disabled: xxx" messages, and returns that.
> > 
> > And then you get that status once, and check that, instead of reading
> > the file N times.
> 
> The other big problem is that the buffer size used for this is too 
> small. A while ago I noticed that it was getting chopped off so I
> have a patch in some branch that doubles it. But dunno if even that
> is sufficient on the latest platforms with more and more FBC capable
> planes. Someone should probably check that...
> 

+cc few more KMS devs
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Btw maybe it is a good candidate for a new work-item on igt GitLab?

Regards,
Kamil

> -- 
> Ville Syrjälä
> Intel
