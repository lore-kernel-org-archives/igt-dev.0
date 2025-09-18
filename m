Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25D3CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E96D10E755;
	Thu, 18 Sep 2025 12:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kc23B9/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282DD10E755
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758199329; x=1789735329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1bM1w4DgwsfPy6W6Z80r6/3/V+JSdQXZslp4Kry6IIc=;
 b=Kc23B9/V1khizn63U+ECGjZ1lIJg3j27Apys5W27R2Wfa/SMalge984y
 GUIgLu/Lk8yyqFGFM6+/cFlesbconX0Nxuewa9oLfkPoa/Gu25mH/yh5e
 5QRr33V8ufot3dwQ5luAezRdekPCfR9a2+POddq/NQIXl1t0AEACL9CtY
 aQqMBC7he97uTisLCBHFwBDr3+oNsdQ+t/3EqzrkROYTDtz7r0PkGoz1n
 GNTXOvdXQnLPftC2dgIy1eJzEZ/QZq3OenZzSqTSYdIWTJfy2dY/ySYq1
 eRl5CkfglHDEymmzGz6BDDkS1eKyc78updsj9IjVMrRtIbqU92S6OyGjZ A==;
X-CSE-ConnectionGUID: ImtysgMERfaRkSoUW6OG4g==
X-CSE-MsgGUID: e2IlC1llQEe2YRWmZDc0AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="63154767"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="63154767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:42:09 -0700
X-CSE-ConnectionGUID: uzEeZAc/S2m419tJyPo81Q==
X-CSE-MsgGUID: Nmdmz4MwQCKExXdKtF8YnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175135747"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 05:42:07 -0700
Date: Thu, 18 Sep 2025 14:42:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Refactor system
 suspend test function parameters
Message-ID: <20250918124205.okwarjtysdet52b4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250918105709.25093-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250918105709.25093-1-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2025-09-18 at 16:27:08 +0530, Mohammed Thasleem wrote:
> Modified the system_suspend_modeset_subtest() function to accept suspend
> state and test type as parameters instead of using hardcoded values.
> 
> This change improves code flexibility and reusability for different suspend
> testing scenarios.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_pm_rpm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index d22f165b8..344ef8c94 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1127,10 +1127,11 @@ __noreturn static void stay_subtest(void)
>  		sleep(600);
>  }
>  
> -static void system_suspend_modeset_subtest(void)
> +static void system_suspend_modeset_subtest(enum igt_suspend_state state,
> +					   enum igt_suspend_test test)
>  {
>  	disable_all_screens_and_wait(&ms_data);
> -	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	igt_system_suspend_autoresume(state, test);
>  	igt_assert(wait_for_suspended());
>  
>  	enable_one_screen_and_wait(&ms_data);
> @@ -1682,7 +1683,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  
>  	/* System suspend */
>  	igt_subtest("system-suspend-modeset")
> -		system_suspend_modeset_subtest();
> +		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
> +					       SUSPEND_TEST_NONE);
>  
>  	/* power-wake reference tests */
>  	igt_subtest("pm-tiling") {
> -- 
> 2.25.1
> 
