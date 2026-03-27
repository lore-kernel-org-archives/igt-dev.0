Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F55210BA42D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 05:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46910EC86;
	Fri, 27 Mar 2026 05:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADXUMgeI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905D310EC70
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 05:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774590073; x=1806126073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=primKyZ2R9mmvMMhtx9eaoDsNh+ejsACbmEVEuRLTEE=;
 b=ADXUMgeI2XKyVJhZZJTcVqbu+Uav+HOc7S5T41njIPqkmjheStUc5VJ2
 runv0/LnaWq4aCEHZmLFJFxPmgLHFJ5KfHNxo9AYioqXoTn++z+yUEuJU
 1Fe77j4wwHLVbVTROywBAKvdc6NWkjU3RNBA0SnVg7LkBb/ed+ZKqLjUh
 iicT4AvtQX0Tt+bnNU9rnGdFeVs1AY+yCjrxZkQ609HG+sfYyLeZAgc/I
 VE3IUkHWBeQtSJIg4Z/pcqKqJ1DqjWqOjD91KjxUZi7N6ha14FHrlq6Od
 DfdJtQrDbYs2FUgJXM2yISSa59AvdmltHWGxP2sfMjA/PkeWK+aOITX4m w==;
X-CSE-ConnectionGUID: uQ0r/jOmTXip7wilpp1RRA==
X-CSE-MsgGUID: DEBKKjSiS4+3l9a58eNBVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79517822"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="79517822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 22:41:13 -0700
X-CSE-ConnectionGUID: YumaJcoKQseseYQ2I/uRLg==
X-CSE-MsgGUID: Dtg9LNIfRUGx3dxGywEtgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="248554061"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 22:41:12 -0700
Date: Fri, 27 Mar 2026 06:41:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/xe_pat: Verify PTA PAT entries contain
 expected values
Message-ID: <hu6jygswuw66v6wwuot4dosu2zvtnjwr5ibqepn7q5aqiqots4@xowfuyhjbhaq>
References: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
 <20260326113425.520545-6-zbigniew.kempczynski@intel.com>
 <822d4aef-ea23-4c91-9e9f-bd3a52baa364@intel.com>
 <54lfamjft2hmwikrxjxas23r5bz2rthvvedr3zyeojtnhl5jh5@ewnj4ca3spw7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54lfamjft2hmwikrxjxas23r5bz2rthvvedr3zyeojtnhl5jh5@ewnj4ca3spw7>
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

On Fri, Mar 27, 2026 at 06:36:42AM +0100, Zbigniew Kempczyński wrote:
> On Thu, Mar 26, 2026 at 03:52:38PM +0000, Matthew Auld wrote:
> > On 26/03/2026 11:34, Zbigniew Kempczyński wrote:
> > > Debugfs exposes PTA PAT entries for different GTs so verify they
> > > contain expected values. Verify they are correct also in reset
> > > and suspend scenarios.
> > 
> > Is this just validating the sw angle? i.e that the debugfs interface still
> > reports the correct thing?
> 
> You're right, definitely preconfigured software table is not I want
> to compare.
> 
> > 
> > If this is hw angle then this might be tricky to validate, since the debugfs
> > dump is just the static array of indices, AFAIK. Not what is actually
> > programmed in each PAT register. For example, if we somehow forget to
> > reprogram the PTA registers after suspend/reset, I don't think this test
> > would catch this, right?
> 
> Right, I roughly took a look and I thought xe2_dump() was used but I was
> wrong. Do you think adding pat_hw_config debugfs entry will be accepted?
> Definitely I want to compare with current registers, not predefined
> table.

I see there's 'pat' file which contains exactly what I need. Doesn't
work for vf, but I think this is not a problem.

--
Zbigniew

> 
> --
> Zbigniew
> 
> > 
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >   tests/intel/xe_pat.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 97 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> > > index 2e2d7e01e7..7e5dc9f44f 100644
> > > --- a/tests/intel/xe_pat.c
> > > +++ b/tests/intel/xe_pat.c
> > > @@ -2115,6 +2115,93 @@ static void pt_caching_test(int xe, enum pt_test_opts opts)
> > >   	pt_destroy_objects(xe, objs2, num_objs);
> > >   }
> > > +enum pt_pta_test_opts {
> > > +	PT_PTA_CHECK = 1,
> > > +	PT_PTA_RESET_GT = 2,
> > > +	PT_PTA_SUSPEND = 3,
> > > +};
> > > +
> > > +#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
> > > +		((no_promote << 10) | \
> > > +		(comp_en << 9) | \
> > > +		(l3clos << 6) | \
> > > +		(l3_policy << 4) | \
> > > +		(l4_policy << 2) | \
> > > +		(__coh_mode))
> > > +
> > > +
> > > +#define NUMGT 2
> > > +static uint32_t xe2_pta[NUMGT] = {
> > > +	XE2_PAT( 0, 0, 0, 0, 3, 0 ),
> > > +	XE2_PAT( 0, 0, 0, 0, 3, 0 )
> > > +};
> > > +
> > > +static uint32_t xe3p_pta[NUMGT] = {
> > > +	XE2_PAT( 0, 0, 0, 0, 0, 3 ),
> > > +	XE2_PAT( 0, 0, 0, 0, 0, 2 )
> > > +};
> > > +
> > > +static uint32_t xe3p_xpc_pta[NUMGT] = {
> > > +	XE2_PAT( 0, 0, 0, 0, 0, 0 ),
> > > +	XE2_PAT( 0, 0, 0, 0, 0, 0 )
> > > +};
> > > +
> > > +static uint32_t get_expected_pta(int fd, int gt)
> > > +{
> > > +	uint32_t devid = intel_get_drm_devid(fd);
> > > +	uint32_t ip_ver = intel_graphics_ver(devid);
> > > +	int ver = intel_gen(devid);
> > > +	uint32_t pta = 0;
> > > +
> > > +	igt_assert_lt(gt, NUMGT);
> > > +
> > > +	if (ip_ver == IP_VER(35, 11))
> > > +		pta = xe3p_xpc_pta[gt];
> > > +	else if (ver == 35 && !xe_has_vram(fd))
> > > +		pta = xe3p_pta[gt];
> > > +	else if ((ver == 30 || ver == 20) && xe_has_vram(fd))
> > > +		pta = xe2_pta[gt];
> > > +
> > > +	return pta;
> > > +}
> > > +
> > > +static void pt_check_pta_for_gts(int fd)
> > > +{
> > > +	struct intel_pat_cache pat_sw_config = {};
> > > +	int gt;
> > > +
> > > +	xe_for_each_gt(fd, gt) {
> > > +		xe_get_pat_sw_config(fd, &pat_sw_config, gt);
> > > +		igt_debug("gt: %d, pta: %x, pta expected: %x\n",
> > > +			  gt, pat_sw_config.pta_mode, get_expected_pta(fd, gt));
> > > +		igt_assert_eq(pat_sw_config.pta_mode, get_expected_pta(fd, gt));
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: pt-pta-check
> > > + * Description: verify pta value is expected
> > > + *
> > > + * SUBTEST: pt-pta-reset-gt
> > > + * Description: verify pta value is expected before and after gt reset
> > > + *
> > > + * SUBTEST: pt-pta-suspend
> > > + * Description: verify pta value is expected before and after suspend/resume
> > > + */
> > > +static void pt_pta_check(int fd, enum pt_pta_test_opts opts)
> > > +{
> > > +	pt_check_pta_for_gts(fd);
> > > +
> > > +	if (opts == PT_PTA_RESET_GT) {
> > > +		xe_force_gt_reset_all(fd);
> > > +		sleep(1);
> > > +		pt_check_pta_for_gts(fd);
> > > +	} else if (opts == PT_PTA_SUSPEND) {
> > > +		igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
> > > +		pt_check_pta_for_gts(fd);
> > > +	}
> > > +}
> > > +
> > >   static int opt_handler(int opt, int opt_index, void *data)
> > >   {
> > >   	switch (opt) {
> > > @@ -2253,6 +2340,16 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
> > >   	igt_subtest("pt-caching-update-pat-and-pte")
> > >   		pt_caching_test(fd, PT_UPDATE_PAT_AND_PTE);
> > > +	igt_subtest("pt-pta-check")
> > > +		pt_pta_check(fd, PT_PTA_CHECK);
> > > +
> > > +	igt_subtest("pt-pta-reset-gt")
> > > +		pt_pta_check(fd, PT_PTA_RESET_GT);
> > > +
> > > +	igt_subtest("pt-pta-suspend")
> > > +		pt_pta_check(fd, PT_PTA_SUSPEND);
> > > +
> > > +
> > >   	igt_fixture()
> > >   		drm_close_driver(fd);
> > >   }
> > 
