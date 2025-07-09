Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF7C83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 07:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C42F10E751;
	Wed,  9 Jul 2025 07:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gicz/39q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D132E10E751;
 Wed,  9 Jul 2025 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752045557; x=1783581557;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+wqvzcyGjrOi6lj5aJt/UQopQTI17ihXJsbpPwgh/lk=;
 b=Gicz/39qBd0+RIb6/mB3lqeVpVSofbHS6aD+dwt0fui1NZi2G90+Cwr6
 LbOA84gx/X3uhBzoAbKnK4IYq21BiSIFgfDXLW19l3ho6pRfFWGptt7fV
 zDc/OwlxEcWUh9rRuAnZnyrDHw1N1kEyK5bLHsRNDptN9U6s3sy5vqvJd
 77F8A2dB7M2P37yE4eYDG7zlFv47abhcRvdLwBrEGNGoAalTfL9u4mgdw
 lT0ZbrGI0xVWKZchOraBVZu47qHbFkF6yaw9+VDi5K0jQHJH5t4rSuJTX
 QYA9yrNmq828D6knbmsdemaB46Q3WN8/c3Bs5DGOoAtk97qYM6t7vJnLC A==;
X-CSE-ConnectionGUID: +t8mU66XSS+ePn89/XUX3g==
X-CSE-MsgGUID: wuqDjTB6Ssq3vA1Pv7faKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56902446"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="56902446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 00:19:16 -0700
X-CSE-ConnectionGUID: yh2Epl0UQHibuFEh/oM6Ww==
X-CSE-MsgGUID: 2BTZt3cEQr6UQ/pVXpAw0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156431828"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 00:19:15 -0700
Message-ID: <24c88440-b587-44a2-85a6-0fbba5b44ed4@linux.intel.com>
Date: Wed, 9 Jul 2025 09:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Replace_int?=
 =?UTF-8?Q?el=5Fsysfs=5Fdebugfs?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <175202210059.145914.14422593174335609531@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175202210059.145914.14422593174335609531@1538d3639d33>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 7/9/2025 2:48 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Replace intel_sysfs_debugfs
> URL   : https://patchwork.freedesktop.org/series/151342/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8447_FULL -> XEIGTPW_13432_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13432_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13432_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13432_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-bo-unmap.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-1/igt@xe_pm@s4-exec-after.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/shard-lnl-4/igt@xe_pm@s4-exec-after.html

These are unrelated. Please fix and resend.

[...]

Thanks,

Peter
