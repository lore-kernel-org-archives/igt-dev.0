Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232D7FF495E
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD40210E210;
	Mon, 30 Mar 2026 14:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI397bex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C986810E1DD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774879205; x=1806415205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MG9NyLr+8ILwuNnTDYJfcrJPuzDKTlfiOCKpD0aa+VE=;
 b=cI397bexqpJlHN23HhCBMXx8srtvoGswpAX3IkWHn8bT18w7GhOcrGbZ
 NSme3V/RGvtyINyg+R/dddwHitt7beFNkiw0NpZCIdd2qzgROK16vNzpk
 OI7CfQga4jMvhpsaEgKaksGzRac3LXCIpOtq5o2FFfGZw6ReI2LxaByd9
 R5leJmqQfBu6XHaOmIs70A7qcVz6sem8WPmDSohQRwou+zwvBkMVAexT8
 ukFtTKeTRKRSIrn9ZB3GyXaEXnS6QsbzM35Q+Z7LqgvqFGRc2r8TZDb5V
 wO9sVEoR72502lOLNHzwlZZ1fG1B+SLryeYf1kGgqPwihvLFkVhdrPJBk Q==;
X-CSE-ConnectionGUID: Q9teJE+YQdeznEbVxwy4iA==
X-CSE-MsgGUID: KZwbBIdSRzOqpYe8OFggqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="78467772"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="78467772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:00:05 -0700
X-CSE-ConnectionGUID: lNCqIampTRSWoCgPEIC3HQ==
X-CSE-MsgGUID: U5QOz69tSFuAfHgwkdDgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="263998505"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:00:03 -0700
Date: Mon, 30 Mar 2026 16:00:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/4] tests/xe_pat: Verify PTA PAT entries
 contain expected values
Message-ID: <lpawydpaermssx6z5zab36lvooax6hq7r56ft65okkxtl6szzn@wdaia7xuwvdz>
References: <20260330054551.1729437-6-zbigniew.kempczynski@intel.com>
 <20260330054551.1729437-9-zbigniew.kempczynski@intel.com>
 <3d0a84d6-228b-4fc1-a654-12179bb80e4a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d0a84d6-228b-4fc1-a654-12179bb80e4a@intel.com>
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

On Mon, Mar 30, 2026 at 02:22:22PM +0100, Matthew Auld wrote:
> On 30/03/2026 06:45, Zbigniew Kempczyński wrote:
> > Debugfs exposes PTA PAT entries for different GTs so verify they
> > contain expected values. Verify they are correct also in reset
> > and suspend scenarios.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > ---
> > v2: - use pat file instead pat_sw_config as it accesses pat regs (Matt)
> >      - ignore PTAs which were not explicitely configured during PAT
> >        initialization (ZK)
> > ---
> >   tests/intel/xe_pat.c | 102 +++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 102 insertions(+)
> > 
> > diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> > index 2e2d7e01e7..b976d2c6a8 100644
> > --- a/tests/intel/xe_pat.c
> > +++ b/tests/intel/xe_pat.c
> > @@ -2115,6 +2115,98 @@ static void pt_caching_test(int xe, enum pt_test_opts opts)
> >   	pt_destroy_objects(xe, objs2, num_objs);
> >   }
> > +enum pt_pta_test_opts {
> > +	PT_PTA_CHECK = 1,
> > +	PT_PTA_RESET_GT = 2,
> > +	PT_PTA_SUSPEND = 3,
> > +};
> > +
> > +#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
> > +		((no_promote << 10) | \
> > +		(comp_en << 9) | \
> > +		(l3clos << 6) | \
> > +		(l3_policy << 4) | \
> > +		(l4_policy << 2) | \
> > +		(__coh_mode))
> > +
> > +
> > +#define NUMGT 2
> > +static uint32_t xe2_pta[NUMGT] = {
> > +	XE2_PAT( 0, 0, 0, 0, 3, 0 ),
> > +	XE2_PAT( 0, 0, 0, 0, 3, 0 )
> > +};
> > +
> > +static uint32_t xe3p_pta[NUMGT] = {
> > +	XE2_PAT( 0, 0, 0, 0, 0, 3 ),
> > +	XE2_PAT( 0, 0, 0, 0, 0, 2 )
> > +};
> > +
> > +static uint32_t xe3p_xpc_pta[NUMGT] = {
> > +	XE2_PAT( 0, 0, 0, 0, 0, 0 ),
> > +	XE2_PAT( 0, 0, 0, 0, 0, 0 )
> > +};
> 
> Would it be possible to get these from the kernel through the sw query
> debugfs thing? Just to make this type of stuff easier to maintain going
> forward. We have been doing that for the other PAT stuff. What are your
> thoughts here?

If we're 100% sure value from pat_sw_config is really what we expect
then I've no objections - test would self extend then on rest of
platforms without necessity of manual intervention. From the code
perspective change is simple, PAT->PTA fix quarantees I read what
I expect. I'm going to change according to your suggestion in new rev.

--
Zbigniew

> 
> > +
> > +static uint32_t get_expected_pta(int fd, int gt)
> > +{
> > +	uint32_t devid = intel_get_drm_devid(fd);
> > +	uint32_t ip_ver = intel_graphics_ver(devid);
> > +	int ver = intel_gen(devid);
> > +	uint32_t pta = UINT32_MAX;
> > +
> > +	igt_assert_lt(gt, NUMGT);
> > +
> > +	if (ip_ver == IP_VER(35, 11))
> > +		pta = xe3p_xpc_pta[gt];
> > +	else if (ver == 35 && !xe_has_vram(fd))
> > +		pta = xe3p_pta[gt];
> > +	else if ((ver == 30 || ver == 20) && xe_has_vram(fd))
> > +		pta = xe2_pta[gt];
> > +
> > +	return pta;
> > +}
> > +
> > +static void pt_check_pta_for_gts(int fd)
> > +{
> > +	struct intel_pat_cache pat_hw_config = {};
> > +	int gt;
> > +
> > +	xe_for_each_gt(fd, gt) {
> > +		xe_get_pat_hw_config(fd, &pat_hw_config, gt);
> > +
> > +		 /* Ignore if PTA is not explicitly programmed */
> > +		if (get_expected_pta(fd, gt) == UINT32_MAX)
> > +			continue;
> > +
> > +		igt_debug("gt: %d, pta: %x, pta expected: %x\n",
> > +			  gt, pat_hw_config.pta_mode, get_expected_pta(fd, gt));
> > +		igt_assert_eq(pat_hw_config.pta_mode, get_expected_pta(fd, gt));
> > +	}
> > +}
> > +
> > +/**
> > + * SUBTEST: pt-pta-check
> > + * Description: verify pta value is expected
> > + *
> > + * SUBTEST: pt-pta-reset-gt
> > + * Description: verify pta value is expected before and after gt reset
> > + *
> > + * SUBTEST: pt-pta-suspend
> > + * Description: verify pta value is expected before and after suspend/resume
> > + */
> > +static void pt_pta_check(int fd, enum pt_pta_test_opts opts)
> > +{
> > +	pt_check_pta_for_gts(fd);
> > +
> > +	if (opts == PT_PTA_RESET_GT) {
> > +		xe_force_gt_reset_all(fd);
> > +		sleep(1);
> > +		pt_check_pta_for_gts(fd);
> > +	} else if (opts == PT_PTA_SUSPEND) {
> > +		igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
> > +		pt_check_pta_for_gts(fd);
> > +	}
> > +}
> > +
> >   static int opt_handler(int opt, int opt_index, void *data)
> >   {
> >   	switch (opt) {
> > @@ -2253,6 +2345,16 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
> >   	igt_subtest("pt-caching-update-pat-and-pte")
> >   		pt_caching_test(fd, PT_UPDATE_PAT_AND_PTE);
> > +	igt_subtest("pt-pta-check")
> > +		pt_pta_check(fd, PT_PTA_CHECK);
> > +
> > +	igt_subtest("pt-pta-reset-gt")
> > +		pt_pta_check(fd, PT_PTA_RESET_GT);
> > +
> > +	igt_subtest("pt-pta-suspend")
> > +		pt_pta_check(fd, PT_PTA_SUSPEND);
> > +
> > +
> >   	igt_fixture()
> >   		drm_close_driver(fd);
> >   }
> 
