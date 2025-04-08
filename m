Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202EAC369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 12:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C727A10E6B7;
	Tue,  8 Apr 2025 12:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVEZEIEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262B110E6B7
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744116077; x=1775652077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FlOV+adMzUxhi1z877TcQPS5jgX9ytZhzl15EDE5R28=;
 b=VVEZEIEYAXfCko6Wy+mAiS4XCXCmIkdcC4vfI2QXHvUMtRlqMB2syaz8
 F5SpedMMiF7aw/a4yrE0suUSYO0Uqqx6KFvRTvfKFykpNbUjbhhM5b/wV
 mrfUERbosUQ4x7qdbLx8J2fP126XzWzmDnVkIpqH0DHyvSscVtXz3GUzu
 dsHiTWnj9GtoTUW6k5ClZqZXpEm6tiODjqIsETcntZLxcWuqHEv7FZgyg
 0A5xOBm4Sf2I2e/lxhMmpKcpJuCwTb/DfHUNMBI/Db8WMTbbPsfV2LoZ+
 PnK5kV5wkM4Pak9phd/d44uHe4d5TmgRGgmYH68sTUDv38gjx8ODQl+jX g==;
X-CSE-ConnectionGUID: 6aLbWp2bT2SPQYY0clYZ5Q==
X-CSE-MsgGUID: CSqFfRIiR6yajdrzAM1orA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56915404"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56915404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 05:41:16 -0700
X-CSE-ConnectionGUID: /SperINRQ+u+qPiVHfBfHg==
X-CSE-MsgGUID: vFXmSkKnSyyX4B/FG4li5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133228559"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:41:15 -0700
Date: Tue, 8 Apr 2025 14:41:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: replace_with Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 dominik.karol.piatkowski@intel.com
Subject: Re: [PATCH v1 i-g-t 1/1] tests/intel/xe_fault_injection: Inject
 fault for xe_hw_engine_class_to_str
Message-ID: <20250408124112.z6h5ow5q4ywi4cfy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 replace_with Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 dominik.karol.piatkowski@intel.com
References: <20250401120657.1829327-1-sobin.thomas@intel.com>
 <20250401120657.1829327-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401120657.1829327-2-sobin.thomas@intel.com>
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

Hi replace_with,
On 2025-04-01 at 12:06:57 +0000, replace_with Sobin Thomas wrote:
> From: Sobin Thomas <sobin.thomas@intel.com>
> 
> Use the fault injection infrastructure to make targeted fault injection in
> functions xe_hw_engine_class_to_str and check the error handling in the
> xe_hw_engine_class_sysfs_init() so that more code paths involving error
> handling is tested.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

Why you did not added here r-b from Priyanka?

Also please look at report from CI for Xe.Full - there are failures
for your newly added subtest, do it wait for kernel patch to be merged?
Please reply to failure mails from CI and add also CI-bug-filing team
on Cc (address is given in there).

Regards,
Kamil

> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 24c114ba7..94c1bbf38 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -173,6 +173,7 @@ static void set_retval(const char function_name[], long long retval)
>   * @xe_guc_ct_init:		xe_guc_ct_init
>   * @xe_guc_log_init:		xe_guc_log_init
>   * @xe_guc_relay_init:		xe_guc_relay_init
> + * @xe_hw_engine_class_to_str:	xe_hw_engine_class_to_str
>   * @xe_mmio_probe_early:	xe_mmio_probe_early
>   * @xe_pcode_probe_early:	xe_pcode_probe_early
>   * @xe_pm_init_early:		xe_pm_init_early
> @@ -388,6 +389,7 @@ igt_main
>  		{ "xe_guc_ct_init" },
>  		{ "xe_guc_log_init" },
>  		{ "xe_guc_relay_init" },
> +		{ "xe_hw_engine_class_to_str" },
>  		{ "xe_mmio_probe_early" },
>  		{ "xe_pcode_probe_early" },
>  		{ "xe_pm_init_early" },
> -- 
> 2.34.1
> 
