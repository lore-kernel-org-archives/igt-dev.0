Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FFBCA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 14:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB9310E3B2;
	Tue,  6 Oct 2026 14:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9xFc9S7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791F610E373
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791296652; x=1822832652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1/0FMXeq8QzP9P/oYHU6tfgqxyPPqvKKvEjE4AVpYzQ=;
 b=P9xFc9S7CWTqXGZnP1DbuB0TmTqv2xzk1+gXHebB9vJQC5JoZCMeJ5I/
 gBQ0wtEaxlBy2bHyJEd2rYHs1Rq0mVvunL83YH4cxRUr6JwSuVz0d9AtZ
 2y2YuNeVvN0VrS5IOgevtglxcZSM8m3x3uSGdkWdWhpt1XgY0WFD8L/H6
 ps0e2hwB67qpVN7Y+iqwEoT31jJUMll9AwU0KEFomZ3khlOTQS7mLO90+
 BR7pVjcIYIInASl/fRv39REh2KKKV29NXhRm3DxuviDnudImtAHDbByO6
 qz6IdfNXmsfkO2bXcyWEITivwMIde1O25MBK1vRU8VPqrU2XhbbFruJB0 Q==;
X-CSE-ConnectionGUID: JWzFMxedTwa536VmnIpGZw==
X-CSE-MsgGUID: 3tFVkmX1RzqqQSAKxxlrXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102566302"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="102566302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:24:12 -0700
X-CSE-ConnectionGUID: 2LcL53pURbWSIKDyVpCzzw==
X-CSE-MsgGUID: qC1hKr01QBW9E4QX5pgt8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="277282393"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:24:11 -0700
Date: Tue, 6 Oct 2026 16:23:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
Message-ID: <20261006142331.ofwjxlkvt6an5tit@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
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
On 2026-10-06 at 11:11:19 -0300, Gustavo Sousa wrote:
> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
> its fixture.  Even though the fixture is part of a subtest group, the
> enabling/disabling will happen regardless of whether those subests are
> selected or not (via --run-subtest).
> 
> As most subtests in xe_pmu don't need that, avoid doing that as a
> fixture and rather incorporate the enabling/disabling as part of a new
> macro called test_each_engine_with_vfs().
> 
> v2:
>   - Add "intel" to commit subject prefix. (Kamil)
>   - Fix argument name of test_each_engine_with_vfs():
>     s/num_vfs/num_fns/. (Kamil)
>   - Enable/disable VFs only once per macro call by moving the call to
>     xe_for_each_engine() inside the for-loop. (Marcin)
> 
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  tests/intel/xe_pmu.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d41ebba1faef..eda56c078653 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>  			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>  				      hwe->engine_instance)
>  
> +#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
> +	igt_subtest_with_dynamic(test) \
> +		for (num_fns = enable_and_provision_vfs(fd) + 1; \
> +		     num_fns; \
> +		     unprovision_and_disable_vfs(fd), num_fns = 0) \
> +			xe_for_each_engine(fd, hwe) \
> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
> +					      hwe->engine_instance)
> +
>  static bool has_event(const char *device, const char *event)
>  {
>  	char buf[512];
> @@ -1192,26 +1201,20 @@ int igt_main()
>  	igt_subtest_group() {
>  		unsigned int num_fns;
>  
> -		igt_fixture()
> -			num_fns = enable_and_provision_vfs(fd) + 1;
> -
>  		igt_describe("Validate engine activity on all functions");
> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
>  			engine_activity_all_fn(fd, eci, num_fns);
>  
>  		igt_describe("Validate per-function engine activity");
> -		test_each_engine("fn-engine-activity-load", fd, eci)
> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
>  			for (int fn = 0; fn < num_fns; fn++)
>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>  
>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
>  			for (int fn = 0; fn < num_fns; fn++)
>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>  		}
> -
> -		igt_fixture()
> -			unprovision_and_disable_vfs(fd);

Hmm, maybe that last one should stay, test should do a cleanup,
after it ends with igt_assert() or skip, for example:

		igt_fixture() {
			if (num_nfs)
				unprovision_and_disable_vfs(fd);
		}
	

Regards,
Kamil

>  	}
>  
>  	igt_subtest_group() {
> 
> ---
> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 
