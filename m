Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73A9CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 15:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D16C10E57C;
	Thu, 15 Oct 2026 15:50:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8A810E5CA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079361; x=1823615361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xgtPzs2Zuvxw9uOY8IkEt8KCheTTEyHH4fjzAhQfcBc=;
 b=SKX62leNd6dPfQ/MvYHeTafam8ARb30isLwTZB5hPz3rt/j/jmcc0VTq
 pjefu2e4dxod0aAzEY6yshIOPWesDJIxiDD9mWTNCddK/K6VhNyqlUuYg
 t7sdGXpgVIfG6FBirdxvhvsFs3/V7PACDXhGvs7dWWbCAkS2vM85EBvtF
 Yq5Byi7TyTtUzSEj7CU0MYV4Jh4LoD4GSan1psv/vbuvcUKqYQCoE4wlr
 TUCfzDfkcvzGKOoMqVwB4mpywZEsprLup2KYkXmrGBgyVsy8cP/slW8kf
 GyhBvFvRHz5E4V/6Hru0xv7xQN2dhTCDdlZ6wul8TkoummCSeWmYUG+oo Q==;
X-CSE-ConnectionGUID: J904hHU9QAO0sDgpgS4vgw==
X-CSE-MsgGUID: 2IPHyFM+TMGFF6kOxHW6pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="850228"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="850228"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:49:21 -0700
X-CSE-ConnectionGUID: ZconZFzbSUOynKWPhg7qdg==
X-CSE-MsgGUID: JFsFEq+4TJWZONA+O1r2Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3475073"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:49:20 -0700
Date: Thu, 15 Oct 2026 17:49:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/1] tests/intel/xe_pmu: Provision VFs inside
 dynamic subtests
Message-ID: <20261015154917.zr7rlp4zus5tstge@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20261014081759.1111471-1-marcin.bernatowicz@linux.intel.com>
 <20261014081759.1111471-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014081759.1111471-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2026-10-14 at 10:17:59 +0200, Marcin Bernatowicz wrote:
> VF setup helpers can call igt_assert(), which is not allowed in the outer
> igt_subtest_with_dynamic() scope. Set up VFs in the first dynamic case,
> reuse them across engine cases, and clean up after the group. This keeps
> VF setup out of unrelated subtests.
> 
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Applied, thanks! 

Regards,
Kamil

> ---
>  tests/intel/xe_pmu.c | 48 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d41ebba1f..1dc102a7b 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -117,6 +117,8 @@ static char xe_device[NAME_MAX];
>  static bool autoprobe;
>  static int total_exec_quantum;
>  static bool has_engine_active_ticks;
> +static unsigned int sriov_num_functions;
> +static bool sriov_vfs_setup_started;
>  
>  #define test_each_engine(test, fd, hwe) \
>  	igt_subtest_with_dynamic(test) \
> @@ -999,6 +1001,7 @@ static unsigned int enable_and_provision_vfs(int fd)
>  	num_vfs = total_vfs > 2 ? 2 : total_vfs;
>  
>  	/* Enable VF's */
> +	sriov_vfs_setup_started = true;
>  	igt_sriov_disable_driver_autoprobe(fd);
>  	igt_sriov_enable_vfs(fd, num_vfs);
>  	igt_require(igt_sriov_get_enabled_vfs(fd) == num_vfs);
> @@ -1021,6 +1024,16 @@ static unsigned int enable_and_provision_vfs(int fd)
>  	return num_vfs;
>  }
>  
> +static void ensure_vfs_enabled(int fd)
> +{
> +	if (sriov_num_functions)
> +		return;
> +
> +	igt_require_f(!sriov_vfs_setup_started,
> +		      "VF setup failed in an earlier dynamic subtest; see its log\n");
> +	sriov_num_functions = enable_and_provision_vfs(fd) + 1;
> +}
> +
>  static void unprovision_and_disable_vfs(int fd)
>  {
>  	int ret;
> @@ -1039,6 +1052,16 @@ static void unprovision_and_disable_vfs(int fd)
>  	igt_sriov_clear_exit_handler();
>  }
>  
> +static void cleanup_vfs_setup(int fd)
> +{
> +	if (!sriov_vfs_setup_started)
> +		return;
> +
> +	unprovision_and_disable_vfs(fd);
> +	sriov_vfs_setup_started = false;
> +	sriov_num_functions = 0;
> +}
> +
>  static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
>  {
>  	int max_gt, gt;
> @@ -1190,28 +1213,29 @@ int igt_main()
>  	}
>  
>  	igt_subtest_group() {
> -		unsigned int num_fns;
> -
> -		igt_fixture()
> -			num_fns = enable_and_provision_vfs(fd) + 1;
> -
>  		igt_describe("Validate engine activity on all functions");
> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
> -			engine_activity_all_fn(fd, eci, num_fns);
> +		test_each_engine("all-fn-engine-activity-load", fd, eci) {
> +			ensure_vfs_enabled(fd);
> +			engine_activity_all_fn(fd, eci, sriov_num_functions);
> +		}
>  
>  		igt_describe("Validate per-function engine activity");
> -		test_each_engine("fn-engine-activity-load", fd, eci)
> -			for (int fn = 0; fn < num_fns; fn++)
> -				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
> +		test_each_engine("fn-engine-activity-load", fd, eci) {
> +			ensure_vfs_enabled(fd);
> +			for (int fn = 0; fn < sriov_num_functions; fn++)
> +				engine_activity_fn(fd, eci, fn,
> +						   XE_SRIOV_SCHED_PRIORITY_LOW);
> +		}
>  
>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>  		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> -			for (int fn = 0; fn < num_fns; fn++)
> +			ensure_vfs_enabled(fd);
> +			for (int fn = 0; fn < sriov_num_functions; fn++)
>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>  		}
>  
>  		igt_fixture()
> -			unprovision_and_disable_vfs(fd);
> +			cleanup_vfs_setup(fd);
>  	}
>  
>  	igt_subtest_group() {
> -- 
> 2.43.0
> 
