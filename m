Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3FDC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 17:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF510E86D;
	Thu, 17 Jul 2025 17:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gk/NZ4lW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BC310E173;
 Thu, 17 Jul 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752772520; x=1784308520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P04OhNTJakzJnftktRJSK4B8WTxMLeKR3GNRQlGvbew=;
 b=Gk/NZ4lWJ2Wkf0PBipwHkYn5myeRit9V1tHF96Nt1UxVqAE71kexWos4
 DsE/tsZlbsHuBrqDehcLcZFiNWsI7z7dLlk1EJj5QAvxBqlrqL1oMEgc1
 6K4UYyTypUamwmlXzdTIKpbJ2Lm/4Bfji6NmpwE9INFLuaoZkR9pLil3z
 TIu+chWC90kzvDppWJL4x1ThaoWvM7bYmvFmxpA992RcwR2YPtjeeCdC7
 MLuqaUzfRwcWGJfZDyLVJtQnb7egdy5dfqpnxkkGdiV/VmApFuyzSR3XS
 55K0bI3+Va4oRhS/qq4PyurvlsexiLLnD2ZCz41MGP1uWymzcdQsJIgcX A==;
X-CSE-ConnectionGUID: ejfqHeY5SzOb4w5RMRIk2A==
X-CSE-MsgGUID: R1NIN4UBSpqf18nOzeJTJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65751115"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="65751115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 10:15:19 -0700
X-CSE-ConnectionGUID: 3aLQ6MucT1m0ZM65rwRxVg==
X-CSE-MsgGUID: bs4hIQ7ISxuWjU7vHCo0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162138932"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:15:17 -0700
Date: Thu, 17 Jul 2025 19:15:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Runner: report test command line
Message-ID: <20250717171502.oglwdpb7hslbx63i@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
 <175276514354.169458.5250266132488923766@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175276514354.169458.5250266132488923766@1538d3639d33>
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
On 2025-07-17 at 15:12:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: report test command line
> URL   : https://patchwork.freedesktop.org/series/151715/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8462_FULL -> XEIGTPW_13485_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13485_FULL absolutely need to be
>   verified manually.

Unrelated to change in runner.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13485_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13485_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8462/shard-lnl-3/igt@xe_pm@s4-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/shard-lnl-2/igt@xe_pm@s4-basic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13485_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] ([Intel XE#4842])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/shard-dg2-434/igt@core_hotunplug@hotreplug.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 

...cut...

