Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4921CA5FF0
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 10:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D77B10F276;
	Tue,  6 Oct 2026 10:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/y8IWW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3410F276
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791282543; x=1822818543;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hhyc3u3qZnREtNX7D1AhWkmZqTawHd2fUbsjwa7MYxw=;
 b=O/y8IWW7MOm8VkkT29sAIFWy8cp9H0Cu6xy8MuPkSBhAMbnUAc4wbso6
 bCCwEhH21PSI1QhgB6zAceocTg5I+FnY5duvYy6BvHytYAsOSAF6mqlrN
 zc48Tcj1bz5O9mTfLjuWX+Siny+BlTwBsOENoX6NSpSO9whwt7Jh675vr
 EJz1VEBHaUmCNh4uT49VAaOEqSWkRKMGOBIX0an8xOVsvmb0bFvOT+o3o
 EPxioi1PChVkG2fcoHkAUVY28MQ0UXTrrElWW2DLdIvEzjJJgKBfZllH0
 PkxiTL2MKQpkrHTp7rlV7AHcyrJ9C2zfje0BPibn1Vi/4P4zmW0q2vRHB w==;
X-CSE-ConnectionGUID: cDqNMzP5R1Wop3LdySsp3A==
X-CSE-MsgGUID: qHghbXpMQ4uTdBsi/9iHqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="22604"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="22604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 03:29:03 -0700
X-CSE-ConnectionGUID: rZImZzzdSmOTkU8TxnbHtw==
X-CSE-MsgGUID: Y7aKwGe8RTiQINY70fmRAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="280837166"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 03:29:03 -0700
Message-ID: <3d8faa2c-0327-4bb4-846a-18066858ff8b@linux.intel.com>
Date: Tue, 6 Oct 2026 12:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_pmu: Do not enable VFs in unrelated
 subtests
To: Gustavo Sousa <gustavo.sousa@intel.com>, igt-dev@lists.freedesktop.org
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 10/6/2026 12:40 AM, Gustavo Sousa wrote:
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
>   tests/intel/xe_pmu.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d41ebba1faef..79d466093d1d 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>   			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>   				      hwe->engine_instance)
>   
> +#define test_each_engine_with_vfs(test, fd, hwe, num_vfs) \
> +	igt_subtest_with_dynamic(test) \
> +		xe_for_each_engine(fd, hwe) \
> +			for (num_fns = enable_and_provision_vfs(fd) + 1; \
> +			     num_fns; \
> +			     unprovision_and_disable_vfs(fd), num_fns = 0) \
> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
> +					      hwe->engine_instance)
> +

Could we move xe_for_each_engine() inside the VF setup loop? This avoids 
enabling and disabling VFs for every engine.

>   static bool has_event(const char *device, const char *event)
>   {
>   	char buf[512];
> @@ -1192,26 +1201,20 @@ int igt_main()
>   	igt_subtest_group() {
>   		unsigned int num_fns;
>   
> -		igt_fixture()
> -			num_fns = enable_and_provision_vfs(fd) + 1;
> -
>   		igt_describe("Validate engine activity on all functions");
> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
>   			engine_activity_all_fn(fd, eci, num_fns);
>   
>   		igt_describe("Validate per-function engine activity");
> -		test_each_engine("fn-engine-activity-load", fd, eci)
> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
>   			for (int fn = 0; fn < num_fns; fn++)
>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>   
>   		igt_describe("Validate per-function engine activity when sched-if-idle is set");
> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
>   			for (int fn = 0; fn < num_fns; fn++)
>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>   		}
> -
> -		igt_fixture()
> -			unprovision_and_disable_vfs(fd);
>   	}
>   
>   	igt_subtest_group() {
>
> ---
> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
>
> Best regards,
> --
> Gustavo Sousa <gustavo.sousa@intel.com>
