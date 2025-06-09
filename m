Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37776C61CE8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 13:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FF010E340;
	Mon,  9 Jun 2025 13:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwUkAzQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CC610E11E;
 Mon,  9 Jun 2025 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749474032; x=1781010032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VRkXQ0Pz4XQzE+mm7wfC7bXXaeXFAqrd+N8whKEOt+A=;
 b=EwUkAzQLeAy8LFEjeN9q3BlEpaynAJ3XSEZ3nAk168Z7eDknTkNUqqVi
 U3l0wPBAogmR5N8Iqx6cxmVDZ2lm2qT4K9gra5/pNpH4UJR4qgD5st6HB
 rCsw0tqdYF6LLcG4FHs1rOLYUZyEo4+LWsDV6kgbxjqb+HX4pvEynznTo
 v3RFpKw/a/e6UxlCjZTEdWUuwkmlaCx8e6CANZRaZnKT4AcPLtCeSOHJk
 as+BVRcTvGje0igz/XPgV652dlNT5U0/j40sjIYoRxKGp0AK9F5bufbFo
 HLt0niz0Clw8UatWNMjIPpUWFk1UKk2lsqb2dieZj8biTopG4nlpSJCBP A==;
X-CSE-ConnectionGUID: fhK72Z52R72Leg6OfOhY4Q==
X-CSE-MsgGUID: YfOjDq7fS+CUGMkRGKDv2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55338950"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55338950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 06:00:32 -0700
X-CSE-ConnectionGUID: Qxrh0idiSdechuLFBWYUfg==
X-CSE-MsgGUID: va5UPDFsTvSIU4a7TUwXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147436851"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 06:00:31 -0700
Date: Mon, 9 Jun 2025 15:00:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/intel/gem_eio: Fix SIGABRT in kms subtest
Message-ID: <20250609130011.woyeavp3d2vnk2br@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
 <174934218406.57946.11562354379581834579@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174934218406.57946.11562354379581834579@1538d3639d33>
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

Hi igt-dev,
On 2025-06-08 at 00:23:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_eio: Fix SIGABRT in kms subtest
> URL   : https://patchwork.freedesktop.org/series/149898/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8397_FULL -> XEIGTPW_13248_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13248_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13248_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (0 -> 3)
> ------------------------------
> 
>   Additional (3): shard-lnl shard-bmg shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13248_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset:
>     - shard-bmg:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-malloc-bo-unmap-nomemset.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 

Unrelated, change was in i915 tests,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13248_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/shard-lnl-8/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_3d:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1465])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/shard-lnl-2/igt@kms_3d.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8397 -> IGTPW_13248
>   * Linux: xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41 -> xe-3201-b832e3126eed9068d80c521a6c6d3a9411354bf8
> 
>   IGTPW_13248: 5c317470d8e30d7088e7396f166984858100cece @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41: d5a5fd842902e24da80b61d64ce337ecee6b0c41
>   xe-3201-b832e3126eed9068d80c521a6c6d3a9411354bf8: b832e3126eed9068d80c521a6c6d3a9411354bf8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13248/index.html
