Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35580C9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 12:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CFF10EFDC;
	Wed, 23 Sep 2026 12:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEGAiy07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260010E7F4;
 Wed, 23 Sep 2026 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790165602; x=1821701602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ErLKHG7E2Axuie6mfImsK0hA2J+oR9xwZCXx8FItvUY=;
 b=GEGAiy07PQBZd5hau1+dDrhe0uz6ezSeRnsoyephX9dnaoAqiuEFilaa
 MrXob/rGcGeL4wu5uL00KTgF8w/WATRc0neM5FfutJGj9hf1dVVREO8MG
 heRHiSMpnfJBRTrFp7FXOVINK/3EBr+HW4H7CUuBdk9jGl0LwiBLY0+be
 DqDAvE8su5I9SpaIbp8AOqlDBaDPqfFRLzvfJ8d4tCFpxAUvr0U70Fu3b
 ca69vMIZ+Hpt8OwCUgsh/+2mCHOrpgWE8PCq9puKwh1MSqFe8qhc0f1UJ
 +xtLHoaddKuKfg/LngzJNq1vWkKzl7y3Lr4APhDN9cfA4IEr6lGZaeMW4 A==;
X-CSE-ConnectionGUID: FVVFpJfyRb69gP3UJiXtZA==
X-CSE-MsgGUID: n8B5/bYmT1mdxae217KKxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102209648"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="102209648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 05:13:22 -0700
X-CSE-ConnectionGUID: OT+7xkdhRpmKuXjLESvJYw==
X-CSE-MsgGUID: 8T6nGlEbST2DDBWdhIKCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273766093"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:13:21 -0700
Date: Wed, 23 Sep 2026 14:13:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 intel-ci: Add multigpu svm to CRI Core blocklist
Message-ID: <20260923121318.7qtniykyy7l6fm56@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260921115610.933754-1-venkateswara.rao.muppidi@intel.com>
 <179003966626.190193.9665463234632667003@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179003966626.190193.9665463234632667003@61270ab9df2a>
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
On 2026-09-22 at 01:14:26 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Add multigpu svm to CRI Core blocklist
> URL   : https://patchwork.freedesktop.org/series/174617/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9104_FULL -> XEIGTPW_15870_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15870_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15870_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15870_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>     - shard-ptl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/shard-ptl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +25 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race.html
> 
>   * igt@xe_exec_system_allocator@twice-large-malloc-nomemset:
>     - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +221 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/shard-bmg-10/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/shard-bmg-3/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
>     - shard-bmg:          [FAIL][6] ([Intel XE#9319]) -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/shard-bmg-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15870/shard-bmg-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
> 

Unrelated to CRI blocklist.



Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_9104_FULL and XEIGTPW_15870_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15870_FULL that come from known issues:
> 
...cut...
