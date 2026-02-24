Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94CEEFB810
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 07:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930C810E4CC;
	Tue, 24 Feb 2026 07:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzQdNr7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2D510E4CC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771918128; x=1803454128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=woJnen/299NFwToodGF4V2tWTada8gYizK94Lgv+eIg=;
 b=MzQdNr7MdCYDFpBQiz7nqJLC2VEKN/fUJCUSAiCFoUsHfC4bNZR7zd/k
 GJFfihpueFd/g7zAmhxXHWD12SB9HnXRNWdFxvp51ewCspAO5hY8AX43N
 OQ5N4t/bupB8Xb31dYVqSZnufpuUU5RObxMIYYOZYYpFL28cqSHXaOrdS
 GNZ8NreLpJ+dS6NM6XwKQ+wVQvLDYDzQW3mmIOINYBnlkwu9rpANPM/fK
 Hs3ndyqOQNIrd7gYK2j5NbJSLjj7RfWAG8YdcxWPQ3V7Et9u2zKhNSD+5
 ks4yrMITsD2LNe0FB4O9JGox3mcdRTExWJZ5E8x6SoqwssGhyAR997doR g==;
X-CSE-ConnectionGUID: lXFWJ15FTfuBNfccX9UDSw==
X-CSE-MsgGUID: u6VyIWCBTCqVVZO0S+V62w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90508560"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90508560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:28:48 -0800
X-CSE-ConnectionGUID: 1NRyDepYSxCpnhMUYdi+xg==
X-CSE-MsgGUID: vYJR8kh5S0GuvtOTx9QTlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219919890"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:28:47 -0800
Date: Tue, 24 Feb 2026 09:28:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 01/23] tests/intel/kms_psr: Don't pass
 uninitialized 'pipe' to intel_fbc_supported_on_chipset()
Message-ID: <aZ1TLBPrmYD9aDe8@intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-2-ville.syrjala@linux.intel.com>
 <df675eff67bc754b59787a066c0afdf9bc8dbac7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df675eff67bc754b59787a066c0afdf9bc8dbac7@intel.com>
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

On Mon, Feb 23, 2026 at 01:22:08PM +0200, Jani Nikula wrote:
> On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Instead passing stack garbage in 'pipe' to
> > intel_fbc_supported_on_chipset() iterate over all the CRTCs
> > and properly check if any of them supports FBC.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/intel/kms_psr.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> > index c411981c0104..c730a6f23944 100644
> > --- a/tests/intel/kms_psr.c
> > +++ b/tests/intel/kms_psr.c
> > @@ -774,7 +774,6 @@ int igt_main()
> >  {
> >  	int z, y;
> >  	enum operations op;
> > -	enum pipe pipe;
> >  	const char *append_subtest_name[3] = {
> >  		"psr-",
> >  		"psr2-",
> > @@ -787,10 +786,12 @@ int igt_main()
> >  	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
> >  	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
> >  	igt_output_t *output;
> > -	bool fbc_chipset_support;
> > +	bool fbc_chipset_support = true;
> >  	int disp_ver;
> >  
> >  	igt_fixture() {
> > +		igt_crtc_t *crtc;
> > +
> >  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> >  		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
> >  		kmstest_set_vt_graphics_mode();
> > @@ -799,7 +800,11 @@ int igt_main()
> >  		igt_display_require(&data.display, data.drm_fd);
> >  		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
> >  		disp_ver = intel_display_ver(data.devid);
> > -		fbc_chipset_support = intel_fbc_supported_on_chipset(data.drm_fd, pipe);
> > +
> > +		for_each_crtc(&data.display, crtc) {
> > +			if (!intel_fbc_supported_on_chipset(data.drm_fd, crtc->pipe))
> > +				fbc_chipset_support = false;
> 
> The commit message says "if any of them", but this requires all of them
> to support FBC, which is unlikely.

Hmm, yeah that is definitely a problem for hsw+. I guess I'll just
reverse the logic here.

intel_fbc_supported_on_chipset() should probably itself iterate all
the CRTCs, but with the current low level API that'd be a bit
inconvenient to implement. We should probably look into changing 
the intel_fbc*() API to take igt_display_t/igt_crtc_t/etc. as well...

-- 
Ville Syrjälä
Intel
