Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC310C624D3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 16:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B32A10E417;
	Tue,  1 Sep 2026 16:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/tuRFTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103110E417
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788281655; x=1819817655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/d7nLTfDRxHq7xMtPRv9yyFKVGRylt0uWpqq+7ldbj8=;
 b=A/tuRFTuicr+vuOMAriWfDOzaeTHwPLINoAH8JEWPdplS2QYfCf3PPHz
 qPot96N7CtM/JEG+FehSLo5sQdH/UlVa4psAabcdwGMx7oj8m4S0nMgZw
 gzvA81KUHZA41PQelhQbonsHO+jK0775hv89MOVl0td+WYaE3jRy8un7P
 mQ495aKuklaC88se2OQUhrvAKXtTjuKR0h2b9xJ9ErA/ZRvj7FZF+Vkfu
 7dxHfG0tS8XwcKzI2ORmZb7loGjuYkIlgcc2inBUSJ2xc6nWH1/dr1bOv
 sIrM8PsZK1J4GzpZskw14kUHddS5TXpQ1ilqJR5Q9JH5UM3xqr23lYUcP w==;
X-CSE-ConnectionGUID: 62fPUCVOSGWER1VdEb286A==
X-CSE-MsgGUID: OMisoWOyTPeqOh5u1HWplg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92535509"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="92535509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:54:15 -0700
X-CSE-ConnectionGUID: 7xTZgHbzSom7DnlDjlDHGg==
X-CSE-MsgGUID: 8PDtFxQyRW63h3RWsMWTqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269192976"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 09:54:13 -0700
Date: Tue, 1 Sep 2026 18:54:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Alex Hung <alex.hung@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
Message-ID: <20260901165411.oh7i4gqow36ltvib@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
 <bd02d25f-fb9b-4f38-b189-0449af5ff897@amd.com>
 <a45a1a06-36e0-4d66-99ce-3d558ecd14e9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a45a1a06-36e0-4d66-99ce-3d558ecd14e9@intel.com>
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

Hi Borah,,
On 2026-08-28 at 15:34:27 +0530, Borah, Chaitanya Kumar wrote:
> 
> 
> On 8/28/2026 5:45 AM, Alex Hung wrote:
> > 
> > 
> > On 8/26/26 23:31, Sharma, Swati2 wrote:
> > > Hi Chaitanya
> > > 
> > > Patch LGTM
> > > 
> > > Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> > > 
> > > Also, it seems we have duplicate igt_display_require(&display,
> > > display.drm_fd);
> > > 
> > > It is required once. Anyways, its a separate patch.
> > > 
> > > Alex,
> > > 
> > > Can you please test on AMD driver with above change?
> > 
> > yes it ran fine. Some inline comments below.
> > 
> > > 
> > > On 03-08-2026 01:33 pm, Chaitanya Kumar Borah wrote:
> > > > Following the pattern in kms_color_pipeline, set
> > > > DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
> > > > local variable, then propagate it to display->has_plane_color_pipeline
> > > > after the final igt_display_require() (which reinitializes the display
> > > > state). This avoids calling drmSetClientCap() twice.
> > > > 
> > > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > > Cc: Alex Hung <alex.hung@amd.com>
> > > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > > ---
> > > >   tests/kms_colorop.c | 9 +++++----
> > > >   1 file changed, 5 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> > > > index 16db0b8ad..d573d2ceb 100644
> > > > --- a/tests/kms_colorop.c
> > > > +++ b/tests/kms_colorop.c
> > > > @@ -406,6 +406,7 @@ int igt_main_args("d", long_options,
> > > > help_str, opt_handler, NULL)
> > > >       igt_display_t display;
> > > >       int i, j, ret;
> > > > +    int has_plane_color_pipeline = 0;
> > can this be bool?
> > 
> > > >       igt_fixture() {
> > > >           display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> > > > @@ -417,15 +418,15 @@ int igt_main_args("d", long_options,
> > > > help_str, opt_handler, NULL)
> > > >           igt_require_f(!ret, "error setting
> > > > DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> > > > -        igt_display_require(&display, display.drm_fd);
> > > >           if (drmSetClientCap(display.drm_fd,
> > > > DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> > > > -            display.has_plane_color_pipeline = 1;
> > > > +            has_plane_color_pipeline = 1;
> > > > +
> > > > +        igt_display_require(&display, display.drm_fd);
> > is this igt_display_require() necessary?
> > 
> 
> Swati flagged this too and this is probably unnecessary. However, I thought
> of handling it in a separate patch. What do you think?

Why waiting for next change when it is already spotted? Lets keep
number of commits low, so git history will be shorter. imho you
could fix it and add r-b you already got.

Regards,
Kamil

> 
> > > >           kmstest_set_vt_graphics_mode();
> > > >           igt_display_require(&display, display.drm_fd);
> > > > -        if (drmSetClientCap(display.drm_fd,
> > > > DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> > > > -            display.has_plane_color_pipeline = 1;
> > > > +        display.has_plane_color_pipeline = has_plane_color_pipeline;
> > > >           igt_require(display.is_atomic);
> > > >       }
> > 
> 
