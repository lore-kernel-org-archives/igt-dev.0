Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A98CA5FFC
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 14:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1954110E1DF;
	Tue,  6 Oct 2026 14:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEnvw5lU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3566610E239
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791297884; x=1822833884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bmxwjVi/RXHPehEZ4HQfjl/F8vFrcBtjC32K5m6cYsk=;
 b=OEnvw5lUf5wrJQ5pdHV/Ya2PBhMMrp78wQsrzUHAABBo2LAKHjTUa/qw
 NUmm/AmADCsDsloDh2k4VZeAdYO4fVGy6i/M8fCo86g9VVy4pIFqFsvYQ
 MbD4EOa6JLlv5NIEejOmD492yOTmAI2OvaDeaulF3DSs6ekpLJjqUVjCc
 dhn9HRTdcQXcVzyQ9UeFyhMAWzseTFjbMzJLJVMmrSj/Lhtk0wy/LplyT
 9JQ75oKcLRgVIP0RoHdv3NJvp94PVcTEJETRyEpjSfs0lnN+FxDplD6+4
 BpD+X4NPP7QBqu7cB4CkWG6U7vBlAujhXwyMQf1b6h6i6hibUphUm2FHc g==;
X-CSE-ConnectionGUID: l+sYZmvrSX24iXPfdwZ8Qg==
X-CSE-MsgGUID: jol7kK2ATXirK0PwC+3DAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="94860805"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="94860805"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:44:44 -0700
X-CSE-ConnectionGUID: MyDeMeXRQvah0edhxaPDyQ==
X-CSE-MsgGUID: tYnEsqSJQMab16Sk3ZJBcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1264265"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:44:43 -0700
Date: Tue, 6 Oct 2026 16:44:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
Message-ID: <20261006144440.alu37vjplb5igvxx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
 <20261006142331.ofwjxlkvt6an5tit@kamilkon-DESK.igk.intel.com>
 <87tsmydhs7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tsmydhs7.fsf@intel.com>
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

Hi Gustavo,
On 2026-10-06 at 11:29:12 -0300, Gustavo Sousa wrote:
> Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:
> 
> > Hi Gustavo,
> > On 2026-10-06 at 11:11:19 -0300, Gustavo Sousa wrote:
> >> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
> >> its fixture.  Even though the fixture is part of a subtest group, the
> >> enabling/disabling will happen regardless of whether those subests are
> >> selected or not (via --run-subtest).
> >> 
> >> As most subtests in xe_pmu don't need that, avoid doing that as a
> >> fixture and rather incorporate the enabling/disabling as part of a new
> >> macro called test_each_engine_with_vfs().
> >> 
> >> v2:
> >>   - Add "intel" to commit subject prefix. (Kamil)
> >>   - Fix argument name of test_each_engine_with_vfs():
> >>     s/num_vfs/num_fns/. (Kamil)
> >>   - Enable/disable VFs only once per macro call by moving the call to
> >>     xe_for_each_engine() inside the for-loop. (Marcin)
> >> 
> >> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> >> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  tests/intel/xe_pmu.c | 21 ++++++++++++---------
> >>  1 file changed, 12 insertions(+), 9 deletions(-)
> >> 
> >> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> >> index d41ebba1faef..eda56c078653 100644
> >> --- a/tests/intel/xe_pmu.c
> >> +++ b/tests/intel/xe_pmu.c
> >> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
> >>  			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
> >>  				      hwe->engine_instance)
> >>  
> >> +#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
> >> +	igt_subtest_with_dynamic(test) \
> >> +		for (num_fns = enable_and_provision_vfs(fd) + 1; \
> >> +		     num_fns; \
> >> +		     unprovision_and_disable_vfs(fd), num_fns = 0) \
> >> +			xe_for_each_engine(fd, hwe) \
> >> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
> >> +					      hwe->engine_instance)
> >> +
> >>  static bool has_event(const char *device, const char *event)
> >>  {
> >>  	char buf[512];
> >> @@ -1192,26 +1201,20 @@ int igt_main()
> >>  	igt_subtest_group() {
> >>  		unsigned int num_fns;
> >>  
> >> -		igt_fixture()
> >> -			num_fns = enable_and_provision_vfs(fd) + 1;
> >> -
> >>  		igt_describe("Validate engine activity on all functions");
> >> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
> >> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
> >>  			engine_activity_all_fn(fd, eci, num_fns);
> >>  
> >>  		igt_describe("Validate per-function engine activity");
> >> -		test_each_engine("fn-engine-activity-load", fd, eci)
> >> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
> >>  			for (int fn = 0; fn < num_fns; fn++)
> >>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
> >>  
> >>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
> >> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> >> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
> >>  			for (int fn = 0; fn < num_fns; fn++)
> >>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
> >>  		}
> >> -
> >> -		igt_fixture()
> >> -			unprovision_and_disable_vfs(fd);
> >
> > Hmm, maybe that last one should stay, test should do a cleanup,
> > after it ends with igt_assert() or skip, for example:
> >
> > 		igt_fixture() {
> > 			if (num_nfs)
> > 				unprovision_and_disable_vfs(fd);
> > 		}
> 
> The cleanup is already done in the for-loop generated by the macro. Do
> you see a case where we really need this extra cleanup call?

When test fails due to igt_assert(), code execution jumps to
next igt_fixture, so also no cleanup will happen in for-loop.

Regards,
Kamil

> 
> --
> Gustavo Sousa
> 
> > 	
> >
> > Regards,
> > Kamil
> >
> >>  	}
> >>  
> >>  	igt_subtest_group() {
> >> 
> >> ---
> >> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
> >> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
> >> 
> >> Best regards,
> >> --  
> >> Gustavo Sousa <gustavo.sousa@intel.com>
> >> 
