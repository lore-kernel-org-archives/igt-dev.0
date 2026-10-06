Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB323CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 08:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5311E10E0BE;
	Tue,  6 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hbl1wyQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C2110E317
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791276906; x=1822812906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GvvW7RVCmGmvt/kKFyfbdDDGlyDqEaCwOt/BHxuzMV4=;
 b=Hbl1wyQaTSUUbn9uujKJCP7XyvGHKnkCNmCq+Cv9Oj4s0/OuMIQOlri+
 +O+pTFcXpNaIkHLLxz3OO/VbN7giGbY4Ix/1sk39nSAShkW74zUq4XmHn
 m1po5GzhDAaWPuJ+oR8YYjTjE1KQSIWoaA2yZJ9Nw3EX3DES5uPuw8Z/u
 y8lmgAv4HQZBvAyQ2yYjDON+F76TIGEh5YS0FRvkjDyU5vZ0kSVWiqJPf
 67DURH0nq9OlbGCdUzzSoe7XgYsKf4vUxkclf16DZoKQUB3gRr6wPyix8
 P8Jl5Tn2a5ytbfHFcQloYlAUgEtrF22A5PZktE/uKuzT+xD9MHEReGJdS w==;
X-CSE-ConnectionGUID: YTJTFnV7RqKNDZJefSDYZA==
X-CSE-MsgGUID: zGrQPI86TJ6+CBY6GYH4Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="15687"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="15687"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 01:55:06 -0700
X-CSE-ConnectionGUID: /fAjX+a3RzOhv0Zq7M4iUg==
X-CSE-MsgGUID: jPB8y1QrRnyKuLA7X5OyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="274891375"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:55:05 -0700
Date: Tue, 6 Oct 2026 10:55:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/xe_pmu: Do not enable VFs in unrelated
 subtests
Message-ID: <20261006085502.csxdvhiysrig4ud4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
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
On 2026-10-05 at 19:40:45 -0300, Gustavo Sousa wrote:

I did give you r-b but after compilling this I have few nits,
first about subject, please add 'intel/' in prefix in subject, so
better

[PATCH i-g-t] tests/intel/xe_pmu: Do not enable VFs in unrelated subtests

> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
> its fixture.  Even though the fixture is part of a subtest group, the
> enabling/disabling will happen regardless of whether those subests are
> selected or not (via --run-subtest).
> 
> As most subtests in xe_pmu don't need that, avoid doing that as a
> fixture and rather incorporate the enabling/disabling as part of a new
> macro called test_each_engine_with_vfs().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  tests/intel/xe_pmu.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d41ebba1faef..79d466093d1d 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>  			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>  				      hwe->engine_instance)
>  
> +#define test_each_engine_with_vfs(test, fd, hwe, num_vfs) \

num_vfs is unused, either use it or drop it.

Regards,
Kamil

> +	igt_subtest_with_dynamic(test) \
> +		xe_for_each_engine(fd, hwe) \
> +			for (num_fns = enable_and_provision_vfs(fd) + 1; \
> +			     num_fns; \
> +			     unprovision_and_disable_vfs(fd), num_fns = 0) \
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
