Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E59C53213
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 08:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBCD10E028;
	Fri, 24 Jul 2026 08:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDRSpetU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062F210E028
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784883272; x=1816419272;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=uoDDA2bt+2XKrFVFNks2mS7+VeqAWjp55BfPTJld34A=;
 b=QDRSpetUyO17l4eb1CvQmZHYYW056G0ChVkdDpL+bOFkhVqrIPT/Qs76
 3E0hM4iErjiZaWbI3Kc7mahLn0LdAtLXjNOUh+zHvPpjuLVBh8Fz8r9T4
 zASlBRnk7F+s05DXMUXlaYOH2TJZAAhoTGOLaQ/gExeTfiBT/3d5vGw/B
 TC53TTY4Uas0Ca/YimlhRBxl+v7y/s89hnxWbUdG3JY8NUiFK5tbyE8sq
 C/dgayJ797qskPYwAnJSzx/ZYpzdtD374qqNdNJwnmyVtogW2d1SLzyhY
 Pbh/3bWYf39knE5aewtlbk1ZGyj5wdUDR5Rb8SnN/txtB/8kw4crVDWLD w==;
X-CSE-ConnectionGUID: PIlb4rKRSoKmsZOSx1XcBg==
X-CSE-MsgGUID: Qem2M/O6T/OPhBFCpfGvig==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103088425"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="103088425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:54:32 -0700
X-CSE-ConnectionGUID: WvcCn8lbSlCsijaWdHbnfg==
X-CSE-MsgGUID: 28YprX1vTomUtyC7aszwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="259317621"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:54:28 -0700
Date: Fri, 24 Jul 2026 10:54:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Message-ID: <20260724085426.yq4pilxvdwbyp2rp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
 <20260715030534.1209206-3-jason-jh.lin@mediatek.com>
 <20260715090814.nlllqebxegyy3sp7@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715090814.nlllqebxegyy3sp7@kamilkon-DESK.igk.intel.com>
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

Hi Jason-JH,
On 2026-07-15 at 11:08:14 +0200, Kamil Konieczny wrote:
> Hi Jason-JH,
> On 2026-07-15 at 11:04:29 +0800, Jason-JH Lin wrote:
> > Add a new subtest that disables CPU deep sleep to eliminate wakeup
> > latency interference during vblank timestamp verification.
> > 
> > This allows platforms without get_scanout_position() to verify their
> > timestamp accuracy is correct, separate from CPU idle interference.
> > 
> > The original "basic" test remains unchanged to detect any timestamp
> > issues including CPU idle interference, while "basic-no-cpu-idle"
> > specifically tests timestamp accuracy without external interference.
> > 
> > Once get_scanout_position() is implemented, the vblank timestamp
> > will be accurately compensated regardless of CPU idle states.
> > 
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Applied, thanks!

Regards,
Kamil

> > ---
> >  tests/kms_setmode.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> > index ef0082dbf70b..a65ea8b232fc 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -42,6 +42,7 @@
> >  #include <math.h>
> >  
> >  #include "i915/intel_drrs.h"
> > +#include "igt_pm.h"
> >  #include "xe/xe_query.h"
> >  
> >  /**
> > @@ -49,6 +50,13 @@
> >   * Description: Tests the vblank timing by iterating through all valid crtc/connector
> >   *              combinations
> >   *
> > + * SUBTEST: basic-no-cpu-idle
> > + * Description: Tests vblank timing with CPU deep sleep disabled to verify
> > + *              timestamp accuracy without CPU idle interference. This test
> > + *              is for platforms lacking HW/SW get_scanout_position() support,
> > + *              allowing them to verify vblank timestamp correctness without
> > + *              external CPU wakeup latency interference.
> > + *
> >   * SUBTEST: basic-clone-single-crtc
> >   * Description: Test allows the use of a single CRTC for two connectors, such as VGA/HDMI,
> >   *		VGA/DP, and HDMI/HDMI
> > @@ -1034,6 +1042,11 @@ static void run_test(const struct test_config *tconf)
> >  		test_combinations(tconf, connector_num);
> >  }
> >  
> > +static void restore_cpu_deep_sleep_at_exit(int sig)
> > +{
> > +	igt_pm_enable_cpu_deep_sleep();
> > +}
> > +
> >  static int opt_handler(int opt, int opt_index, void *data)
> >  {
> >  	switch (opt) {
> > @@ -1105,6 +1118,30 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
> >  		}
> >  	}
> >  
> > +	/*
> > +	 * This subtest disables CPU deep sleep to eliminate wakeup latency
> > +	 * interference during vblank timestamp verification.
> > +	 *
> > +	 * NOTE: This is for platforms that have not yet implemented
> > +	 * get_scanout_position(). Once get_scanout_position() is properly
> > +	 * implemented, the vblank timestamp will be accurately compensated
> > +	 * regardless of CPU idle states, and this test becomes redundant
> > +	 * with the standard "basic" test.
> > +	 */
> > +	igt_describe("Tests vblank timing with CPU deep sleep disabled");
> > +	igt_subtest_with_dynamic("basic-no-cpu-idle") {
> > +		struct test_config tconf = {
> > +			.flags		= TEST_TIMINGS,
> > +			.name		= "basic-no-cpu-idle",
> > +			.resources	= drm_resources,
> > +		};
> > +
> > +		igt_require_f(igt_pm_disable_cpu_deep_sleep(),
> > +			      "Platform does not support CPU idle control\n");
> > +		igt_install_exit_handler(restore_cpu_deep_sleep_at_exit);
> > +		run_test(&tconf);
> > +	}
> > +
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil
> 
> >  	igt_fixture() {
> >  		drmModeFreeResources(drm_resources);
> >  		drm_close_driver(drm_fd);
> > -- 
> > 2.43.0
> > 
