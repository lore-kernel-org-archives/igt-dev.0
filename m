Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E296EC83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 07:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C5410E754;
	Wed,  9 Jul 2025 07:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1P2FFvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D891D10E750;
 Wed,  9 Jul 2025 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752045612; x=1783581612;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ozQG22bjmKGyPHWdv3lQeTU3zbJONIj6TiXPPVsHQqM=;
 b=X1P2FFvfhRsdE1/DG5IGGPHwV1pOPB97OvL4Nn3mCUogo5jwnfhD9cIZ
 enyxXAU5+rU7h03zRc/M4Vne1/+Sfkm+P0s0gq6BMF0+P0nPnxNQX7nA5
 JGUxCsCWkXiSToU7UWOPfT+zoD5HdQPuJePX45TftQiIrEhgrVBzNY7aj
 Md3Il9xGEOhSUDJbb0nIVFai3gYduaDkFYV1bxgU4kV56j7LBRFwoJzhj
 2u8SxhMc5wKXB+q1AWE7scC8mnbtvcrhh02E8Zq2HqyHTDi0/EA6GVxwk
 JmsLzZiTZow2N4iQpq9DSQ/844ju2DcbP3TM7EQRVrVoBm2dXK+hfdi0p Q==;
X-CSE-ConnectionGUID: l23DYpgmSjKhYurfGrv16g==
X-CSE-MsgGUID: ZkzfGWyMTWCtBMGoh+VBqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56902514"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="56902514"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 00:20:12 -0700
X-CSE-ConnectionGUID: qSPbLICtRASy+wiq9DC4MQ==
X-CSE-MsgGUID: h/v15WKMS/auUAc4gqlPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156432126"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 00:20:10 -0700
Message-ID: <d81f976e-fa58-4b04-8509-874a849a75d6@linux.intel.com>
Date: Wed, 9 Jul 2025 09:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Replace_i?=
 =?UTF-8?Q?ntel=5Fsysfs=5Fdebugfs?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <175203159461.146096.18430735761304273724@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175203159461.146096.18430735761304273724@1538d3639d33>
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

On 7/9/2025 5:26 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Replace intel_sysfs_debugfs
> URL   : https://patchwork.freedesktop.org/series/151342/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16827_full -> IGTPW_13432_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13432_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13432_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13432/index.html
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13432_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf_pmu@rc6@runtime-pm-gt0:
>     - shard-rkl:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16827/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-gt0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13432/shard-rkl-5/igt@perf_pmu@rc6@runtime-pm-gt0.html

These are unrelated. Please fix and resend.

[...]

Thanks,

Peter
