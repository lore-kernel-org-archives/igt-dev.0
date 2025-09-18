Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57171CAC5A0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 13:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A89D10E75A;
	Thu, 18 Sep 2025 13:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HeOMKoqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A7010E8B8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758200772; x=1789736772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CEOthrUL0SL68/Dkq5Imb73v2ur7vFvdR3ZhgxzZ2A8=;
 b=HeOMKoqrtkgDjdd4I1MEx3mpI+VE7yqaNt3GotLlknndGBFwHieLcPld
 Y+Idz/mI125yhnvHNRJsLxZpFd5OYAUSPna4Ig6jWxHAtRwgwK6Pt+ekl
 D/7Z0KCcLLVm8ndjCvfSQph5pkiYbaipOKBQ0KwHwTeqMzvdQ6k2MciRR
 z2MrbHybrsQwTEAKStmuVqBhoaq/m21N0L02M8lEP1eY74gztYVqSb3P9
 T0p8cn5BZfufdPxNTuSRBNJTTEro3fesDOc5kS51YwhugYuCmS0Zqwh55
 i3lsaLYGd2uzwQ1OJDBwSJTKDEjw6LtMnfpXVXAhI904Wgh0Z/OPe3Aw9 g==;
X-CSE-ConnectionGUID: Whf+nT+RQseFmvTQf2N/lQ==
X-CSE-MsgGUID: wSp2lQ/HQTC1bp7HiGR6sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59569379"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="59569379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:06:12 -0700
X-CSE-ConnectionGUID: XIYmayKBQqOe27+AOaqGdw==
X-CSE-MsgGUID: EastjHRKT2im6BBsfxh8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="180649989"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 06:06:11 -0700
Date: Thu, 18 Sep 2025 15:06:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend
 freeze test case
Message-ID: <20250918130608.jq6mbuepr4gmjt2p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250918105709.25093-1-mohammed.thasleem@intel.com>
 <20250918105709.25093-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250918105709.25093-2-mohammed.thasleem@intel.com>
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
On 2025-09-18 at 16:27:09 +0530, Mohammed Thasleem wrote:
> Added a new subtest that tests S0ix (suspend-to-idle/freeze state)
> functionality using SUSPEND_STATE_FREEZE.
> 
> This expands power management test coverage to include modern low-power
> idle states for comprehensive suspend testing.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 344ef8c94..3a91eda89 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1685,6 +1685,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_subtest("system-suspend-modeset")
>  		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
>  					       SUSPEND_TEST_NONE);
> +	igt_subtest("system-suspend-freeze")

Looks ok but maybe it should be named system-suspend-modeset-freeze?
Or system-suspend-idle-modeset and rename old one to
system-suspend-mem-modeset?

+cc Swati and Karthik

Regards,
Kamil

> +		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
> +					       SUSPEND_TEST_NONE);
>  
>  	/* power-wake reference tests */
>  	igt_subtest("pm-tiling") {
> -- 
> 2.25.1
> 
