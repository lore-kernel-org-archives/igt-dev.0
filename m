Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A5FC369D3
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 09:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A86710E1F6;
	Wed, 23 Apr 2025 09:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSuONlHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3392910E0E9;
 Wed, 23 Apr 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745400284; x=1776936284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vQ2/f+pBNowBYc2LjDzA6z9voSbAisYRt4dr3AZcswg=;
 b=HSuONlHEutccICRg3BoZ+6i7kNugkFy0CmNtgAQlBg57RUlRKPUBHqh4
 sTqB1iJhOmvFlsdZ7DuSzXayH3CQHn9T7HcXNCKUbryYtGgCObsvNZSUV
 XYdv+hg5hgBoHyimrmc6XiqnwxXF2VQ7QZ0Mq3yqTzNlhrFUnDGsIkZ+5
 BzLwkDv3DWUitpVB2rkR3tDL+I+EbsdnCY23QbuZEMRWqgUoFBQ6QhvbQ
 rS4wMCakIeKBgsFcPLGrw93rfLznyoLqmguB4EdgUF+6tr5/1saaOguKN
 DxaDqMrWMiiamvZJPWF/G+qIO8Fk1o1r0G1G61guMCiZ4GWyQKcsMXr/d Q==;
X-CSE-ConnectionGUID: T0yd4cMWRpSOvfWVsGwiJQ==
X-CSE-MsgGUID: 0ls+Op3KTvuj2N8qWw6P9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50815084"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50815084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 02:24:44 -0700
X-CSE-ConnectionGUID: M9rOy9MuQcmzOWhTqzVl3g==
X-CSE-MsgGUID: l+AfX7kvSii//Ggbu6RyIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132112926"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 02:24:43 -0700
Date: Wed, 23 Apr 2025 11:24:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 intel/xe_test_config.json: add intel_sysfs_debugfs
Message-ID: <20250423092426.jme2pkxg46d36znk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250422171125.137275-1-kamil.konieczny@linux.intel.com>
 <174538597646.27920.6372674972277775083@b68e5b3b99e1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174538597646.27920.6372674972277775083@b68e5b3b99e1>
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
On 2025-04-23 at 05:26:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel/xe_test_config.json: add intel_sysfs_debugfs
> URL   : https://patchwork.freedesktop.org/series/148093/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8331_FULL -> XEIGTPW_13022_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13022_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13022_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

Unrelated, it added intel_sysfs_debugfs subtests for i915/Xe,

Regards,
Kamil

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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13022_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color@ctm-0-75@pipe-a-dp-2:
>     - shard-bmg:          [PASS][1] -> [SKIP][2] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-a-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13022/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-a-dp-2.html
> 
>   * igt@kms_sequence@queue-idle@pipe-b-dp-2:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/shard-bmg-8/igt@kms_sequence@queue-idle@pipe-b-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13022/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-b-dp-2.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-bmg:          [SKIP][5] ([Intel XE#2321]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8331/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13022/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13022_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8331 -> IGTPW_13022
>   * Linux: xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191 -> xe-2982-2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402
> 
>   IGTPW_13022: 13022
>   IGT_8331: e209a9bb68d2b524c7eeed1cb87abb4e187f2b78 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191
>   xe-2982-2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402: 2b8e7eee3b2b082348b1a307f07b5a6f8a9a2402
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13022/index.html
