Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36206C282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 17:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D472710EA3A;
	Thu,  6 Mar 2025 17:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsIqR76U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F7410EA3A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741282063; x=1772818063;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=yhnBPW7NdjQgapjJS2epyZqUp7pOfj26T5WOQEMyAA4=;
 b=XsIqR76UHUdP0zj9sQaJxnBWfhG/zQYsBRzqGz4AGJ0B+G4F8Kg/yrOw
 yF4xl5Fn7HVlY66ZKW/M/R4r5mCjz1rsyBwN0/Kv7iVtj9LZb86niJ1JH
 bvehhfnLlQA8m5TwBA2ceGjb3UZgs78zMminp+N+SxDZLduYcgwvqAT3n
 nvfraxhmMWn/aUQ2orgENU65TuHz6Lxkn+fVTPGnVoHPN8qaQzjjXxDxH
 TS7et+PT7yNtyB7ZyyJWwQC2lTFLfwpBekNFTc1ZXOfM8HQyjShe6tfSi
 CK3Xz+EeLOrAVzzhvnyK1ldzIe/EdTn/I/eDTCBuMTKLoMBqOMfqjFpIC g==;
X-CSE-ConnectionGUID: zma9QE/HSICFobZDck/0lA==
X-CSE-MsgGUID: yxlOTbxkReiXbYfxj0/28A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42195786"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42195786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:27:43 -0800
X-CSE-ConnectionGUID: TxQmR1MuR9iSVetqHa5n0g==
X-CSE-MsgGUID: NNNPRz4TSsmDYd8ov1fRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120002636"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 09:27:42 -0800
Date: Thu, 6 Mar 2025 18:27:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 runner: Parse results harder (rev5)
Message-ID: <20250306172739.7no47dcoz3el7lqc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
 <174127509205.68359.15658565372113290564@64e06c682a23>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174127509205.68359.15658565372113290564@64e06c682a23>
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
On 2025-03-06 at 15:31:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Parse results harder (rev5)
> URL   : https://patchwork.freedesktop.org/series/145520/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8262_full -> XEIGTPW_12713_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12713_full absolutely need to be
>   verified manually.

Not related to change in igt_resume/runner.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12713_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12713_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12713/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-bmg:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8262/shard-bmg-7/igt@xe_oa@buffer-size.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12713/shard-bmg-2/igt@xe_oa@buffer-size.html
> 
>   * {igt@xe_oa@buffer-size@ccs-0-128k} (NEW):
>     - shard-bmg:          NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12713/shard-bmg-2/igt@xe_oa@buffer-size@ccs-0-128k.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8262_full and XEIGTPW_12713_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_oa@buffer-size@ccs-0-128k:
>     - Statuses : 1 fail(s)
>     - Exec time: [0.04] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12713_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-lnl:          NOTRUN -> [ABORT][5] ([Intel XE#3914]) +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12713/shard-lnl-4/igt@core_hotunplug@hotreplug-lateclose.html

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8262 -> IGTPW_12713
> 
>   IGTPW_12713: 12713
>   IGT_8262: 8262
>   xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12713/index.html
