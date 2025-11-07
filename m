Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86192CCF9E3
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 20:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2D10EB7E;
	Fri,  7 Nov 2025 20:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCZ2VMaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C198A10EB7E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762547683; x=1794083683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qkhlRmpJhi94HNSkyiZfb1ZXWElgcGyy9zPNWOXHSrQ=;
 b=fCZ2VMaM9Xkq4Gzzl5zka4G80sOUMcwVQQkYoeCqnXStbF0Uv4lZyKOS
 K4Ewm3P6O0r3PwQQA8NxCSUyDhoTxhSGn0sBB89EX0DXVfSmTQewRpZmI
 RY5E1SCNJOidM47cLHIjEcZko4IVCkYTgDmcGjTPsa9Wl15ymzs7Ve1aL
 mriXmYGCz1bD/xZMPzMM0tpun7Rpu/+VxHEHsXqIIkObyJRhbZnnZFFb4
 Q6JknQiE5XwSkaULBC8ue1wNRv6NLRiL6GGlLTPM/jtJu4Cep1Yk1TrdU
 DgxGTF4M6itt5vJOKmMh1on8/Nbdn1Ot0HLpqv5HmZzfAm7LrB8W5JLvV w==;
X-CSE-ConnectionGUID: 9E/g5DQBSwGjnSlE4HgacA==
X-CSE-MsgGUID: YSTHFUwsRFqOfL/uS053LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="67311569"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="67311569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 12:34:43 -0800
X-CSE-ConnectionGUID: gpe1EAldQwmH3xIDVcaG6g==
X-CSE-MsgGUID: q+ecj8qJStW267rCWkomIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188559068"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 12:34:41 -0800
Date: Fri, 7 Nov 2025 21:34:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 pranay.samala@intel.com, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Reduce debug log
 level in CI for scaling tests
Message-ID: <20251107203439.nlxux3rbkgx7k4ju@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 pranay.samala@intel.com, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
 <20251106092204.1505129-2-ramanaidu.naladala@intel.com>
 <191a8b272532dbd8de15b380b583de718a37e44f@intel.com>
 <aQ35-kADO2KSZVx8@intel.com>
 <61112011-603a-46d3-a5af-6e80ac0570fb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61112011-603a-46d3-a5af-6e80ac0570fb@intel.com>
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

Hi Naladala,,
On 2025-11-07 at 21:40:46 +0530, Naladala, Ramanaidu wrote:
> Hi Ville/Nikula Jani,
> 
> Thanks for the pointing the problems.
> 
> On 11/7/2025 7:24 PM, Ville Syrjälä wrote:
> > On Thu, Nov 06, 2025 at 03:09:08PM +0200, Jani Nikula wrote:
> > > On Thu, 06 Nov 2025, Naladala Ramanaidu<ramanaidu.naladala@intel.com> wrote:
> > > > Reduce excessive logging in CI environments when multiple outputs
> > > > are connected. It prevents CI runners from exceeding disk usage
> > > > limits.
> > > So how do we debug issues when there are no KMD debug logs? This can't
> > > be the go-to solution in the long run.
> > Yeah, this stuff is already causing problems. Eg.
> > igt@kms_atomic_transition@plane-toggle-modeset-transition keeps
> > failing randomly on tgl, but since the debugs are disabled the
> > logs are completely useless.
> > 
> > I've thrownhttps://patchwork.freedesktop.org/series/155702 a few
> > times at trybot to get more logs, but since it's random no luck so
> > far. If we didn't have this "disable debugs" crap in the first
> > place the bug would probably have been solved as soon as it
> > appeared.
> 
> In recent days observed that many tests are failing or incomplete due to
> limitations in the test CI environment. Specifically, the issues related to
> log memory space and log line count.
> 
> examples:
> disk usage issue: https://gfx-ci-internal.igk.intel.com/cibuglog/issue/28035?query_key=ee34b0f8805b0bdf398a1f0fb816d255a978a81f
> Lane count issue: https://gfx-ci.igk.intel.com/cibuglog-ng/issue/19731?query_key=3a88cc35a02fed031e37c0b1dae196e821340a7b
> 
> 
> Please suggest right direction to fix this types of runner issues.
> 

As for runner please talk with me and CI.
For example, one idea would be to drop or extreamly cut
all successfull logs, leaving only failures intact.

Regards,
Kamil

+cc Ewelina and Ryszard


> > 
> > > Moreover, update_debug_mask_if_ci() doesn't even log the actual mask
> > > being switched to.
> > > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> > > > Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
> > > > ---
> > > >   tests/kms_plane_scaling.c | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > > > index 63d35d76b..34c8f8a64 100644
> > > > --- a/tests/kms_plane_scaling.c
> > > > +++ b/tests/kms_plane_scaling.c
> > > > @@ -32,6 +32,7 @@
> > > >   #include "igt.h"
> > > >   #include "igt_vec.h"
> > > > +#include "igt_sysfs.h"
> > > >   #include <math.h>
> > > >   /**
> > > > @@ -1358,11 +1359,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
> > > >   		data.devid = is_intel_device(data.drm_fd) ?
> > > >   			intel_get_drm_devid(data.drm_fd) : 0;
> > > >   		igt_require(data.display.is_atomic);
> > > > +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> > > >   	}
> > > >   	igt_subtest_group {
> > > >   		igt_output_t *output;
> > > > +		if (igt_get_connected_output_count(&data.display) > 1)
> > > > +			update_debug_mask_if_ci(DRM_UT_DRIVER | DRM_UT_CORE);
> > > > +
> > > >   		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
> > > >   			igt_describe(scaler_with_pixel_format_tests[index].describe);
> > > >   			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
> > > -- 
> > > Jani Nikula, Intel
