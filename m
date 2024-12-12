Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EEAE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5AE10E2EB;
	Thu, 12 Dec 2024 17:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3a7MLgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FF210E635;
 Thu, 12 Dec 2024 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734024230; x=1765560230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zvF9tPQR3LJCGP+zfpUia/JTTeAlXTrToUVQ2vRoEE0=;
 b=e3a7MLgNhDE0sgxcUvTxeSL813IGEdxfH16CKPcDYQXYN3K3tfbbotpk
 H4jgOFdNJlrm/i0LCAnB5Aa7HGaRWWKld/b8HuuFX9Huvi4K528dkmTN9
 vKRnpI6HldenSqIi9H8mPGK05n4RacXfHLd6MXE1m2aPqMVAfTW4pkevF
 wcO+X4Je+c/j9082ap71VT5STWlwFHmWxgI+IzF1F3P6L1Rf4RTBmIyaa
 VvCnMfGrzXzS+EXdpb7df9JgsOE+TbFXo6OWpsvNU9pJIbq+o6NvrWk++
 R0mTcCrSe2EPvYtXKV+26xCYBmomLa+5ictGXQiJuKTC/xUtAJKFYr2Ki A==;
X-CSE-ConnectionGUID: Hy1boMuTRUmcJJvr4gRdyQ==
X-CSE-MsgGUID: 4bhpuyY2TcmkdNsilSkAeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="56930259"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="56930259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:23:50 -0800
X-CSE-ConnectionGUID: RKTxjxBTR0CpcikkTweCuw==
X-CSE-MsgGUID: 0m+nhngjSwG/RlBbkxe3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100456086"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:23:48 -0800
Date: Thu, 12 Dec 2024 18:23:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/intel-ci: Update chamelium-only.testlist
Message-ID: <20241212172346.lipwqgfctabveqpc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241212042509.30614-1-karthik.b.s@intel.com>
 <173400210639.1551260.2539362894083090823@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173400210639.1551260.2539362894083090823@b555e5b46a47>
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
On 2024-12-12 at 11:15:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel-ci: Update chamelium-only.testlist
> URL   : https://patchwork.freedesktop.org/series/142462/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8150_full -> XEIGTPW_12302_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12302_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12302_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12302_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12302/shard-bmg-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12302/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12302_full that come from known issues:
> 
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8150 -> IGTPW_12302
>   * Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -> xe-2359-9b5dff950301bf05d2e76745cacb457a0a82b50f
> 
>   IGTPW_12302: 12302
>   IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292
>   xe-2359-9b5dff950301bf05d2e76745cacb457a0a82b50f: 9b5dff950301bf05d2e76745cacb457a0a82b50f
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12302/index.html
