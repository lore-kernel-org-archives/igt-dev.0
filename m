Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B06CEA3C4E
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 13:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D266210E0D2;
	Thu,  9 Apr 2026 13:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUKxFv4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D610E0D2
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775742031; x=1807278031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1cYLcbM7yBn/g98zO8Zzd6WNzpeCTyhb4MwVtXeq5wA=;
 b=dUKxFv4DWBB0LNg3Sx/Ps4rXTVfdN5hkDiA1EJlSJY2GfdWxLH9q0hH6
 b3XyQ9JlWmgpDlX9fwY6wvCJvZ/7n44OPp5WqRVVygb/z9eBJx/w/2ELU
 u86QrHbcfYLPiw6zgzEO2UYEIu1O6DgbldapIP6NuGbOhY2YRHSX4S+9z
 9bh+l6jIdy0Q/7cH8cruMqadePjkdyuJD2ZvC18jQt3TNgtZ/qsHn85bq
 IoobMSztWT6DudRcz1Nlp8uUNjPJVwtWts1mxsHMUiP3JLE3UsaXNwKcp
 1U8ZNJKKJ4FUBs7qGiePbpMDDmpeliyOlaPZmBZQFduxwMBjv/16ITR23 g==;
X-CSE-ConnectionGUID: vHNiPUygQEidJ4flN4DL8g==
X-CSE-MsgGUID: 9UhhlbpTRt2H90cVhHGK1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87035386"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87035386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 06:40:31 -0700
X-CSE-ConnectionGUID: zd+DOcc2SvCgm0rt/XAUOA==
X-CSE-MsgGUID: sC7xJ8DPQ1uLuLrDCKuhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="224461052"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:40:08 -0700
Date: Thu, 9 Apr 2026 15:40:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Alex Hung <alex.hung@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: Re: [PATCH] tests/kms_writeback: fix coding style issues
Message-ID: <20260409134005.rfajti6xtz3d5yaz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Alex Hung <alex.hung@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
References: <20260408230245.442843-1-alex.hung@amd.com>
 <DM3PPF208195D8D0FEB3A265EA65CF1332BE3582@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D0FEB3A265EA65CF1332BE3582@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

Hi Kandpal,,
On 2026-04-09 at 08:06:17 +0000, Kandpal, Suraj wrote:
> > Subject: [PATCH] tests/kms_writeback: fix coding style issues
> > 
> > Fix missing spaces after comma in two igt_skip_on_f() calls and in the
> > writeback-invalid-parameters subtest description strings.
> > 
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> 
> LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 

Thank you all, pushed.

Regards,
Kamil

> > ---
> >  tests/kms_writeback.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > f15abba96..5031fcb83 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -58,8 +58,8 @@
> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> >   *
> >   * SUBTEST: writeback-invalid-parameters
> > - * Description: Writeback has a couple of parameters linked together(output
> > - *              framebuffer and fence); this test goes throughthe combination
> > + * Description: Writeback has a couple of parameters linked together (output
> > + *              framebuffer and fence); this test goes through the combination
> >   *              of possible bad options
> >   *
> >   * SUBTEST: writeback-pixel-formats
> > @@ -620,8 +620,8 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> > opt_handler, NULL)
> >  		drmModeFreePropertyBlob(formats_blob);
> >  	}
> > 
> > -	igt_describe("Writeback has a couple of parameters linked together"
> > -		     "(output framebuffer and fence); this test goes through"
> > +	igt_describe("Writeback has a couple of parameters linked together "
> > +		     "(output framebuffer and fence); this test goes through "
> >  		     "the combination of possible bad options");
> >  	igt_subtest("writeback-invalid-parameters") {
> >  		igt_fb_t invalid_output_fb;
> > @@ -644,7 +644,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> > opt_handler, NULL)
> >  		igt_fb_t output_fb;
> > 
> >  		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > +		igt_skip_on_f(!(data.supported_colors & XRGB8888),
> > +"DRM_FORMAT_XRGB8888 is unsupported\n");
> >  		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> >  				      DRM_FORMAT_XRGB8888,
> >  				      DRM_FORMAT_MOD_LINEAR,
> > @@ -678,7 +678,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> > opt_handler, NULL)
> >  		igt_fb_t output_fb;
> > 
> >  		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > +		igt_skip_on_f(!(data.supported_colors & XRGB8888),
> > +"DRM_FORMAT_XRGB8888 is unsupported\n");
> >  		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> >  				      DRM_FORMAT_XRGB8888,
> >  				      igt_fb_mod_to_tiling(0),
> > --
> > 2.43.0
> 
