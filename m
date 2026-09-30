Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EADCA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28810F429;
	Wed, 30 Sep 2026 14:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZRwK4xy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850D310F422;
 Wed, 30 Sep 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790778806; x=1822314806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W/OTcvPdDOpVCOkLHCVaNeXFLxgUT8YCiAfMRio2kCs=;
 b=IZRwK4xyQJv7gyRLxJRKwo9xoDro/DuAZmbrpS9Lkk2uNY08xNlmcJCv
 U96qpiWzUjoQWpnqDJqc4IJpkfqvJla5gY3+jG1gqBTn6HQn2Lzj2HXr7
 TWNjKOHkVJQnvr1FglfXmHWrLA8nJBnEDNI4aRxu9vg//uMcChxNsi5pl
 YRp8i3B7U4u7omOC/A294qRX1Vs7Fvy95r4bA3f6rubFxGrg7dNcH91In
 aQhxzhWjM1DzvNugN433iPhReWPViN0TkCYkpFYeVSODZY/mPTod61pJG
 hf/QDswvVDzpcFuQk8XZ5Ljb2OOBkIhygKmYawPN/wCEBZHSx5gAiz9H3 w==;
X-CSE-ConnectionGUID: ocINa44SRsC/LmyPUOWYZA==
X-CSE-MsgGUID: yAcmYuvlR5i7rLFjqqsWtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95327384"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95327384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:33:26 -0700
X-CSE-ConnectionGUID: zM7Hk4j/SKWKg3YdMDuslw==
X-CSE-MsgGUID: Mf9i/x3JQke+di74V0I2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275843135"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:33:25 -0700
Date: Wed, 30 Sep 2026 16:33:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 Preserve const qualifiers in string parsing (rev2)
Message-ID: <20260930143322.g7msmmggg5evaiwu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <179071896687.220956.1291688083026361951@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179071896687.220956.1291688083026361951@61270ab9df2a>
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
On 2026-09-29 at 21:56:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Preserve const qualifiers in string parsing (rev2)
> URL   : https://patchwork.freedesktop.org/series/175019/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9116_FULL -> XEIGTPW_15919_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15919_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15919_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15919_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9116/shard-lnl-3/igt@xe_pm@s4-mocs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15919/shard-lnl-5/igt@xe_pm@s4-mocs.html
> 

Unrelated.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15919_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
>     - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#9422])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9116/shard-bmg-10/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15919/shard-bmg-10/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html
> 
...cut...
