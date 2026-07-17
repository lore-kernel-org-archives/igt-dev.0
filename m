Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D17BC44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB7410F547;
	Fri, 17 Jul 2026 12:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhyoA4F4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9263910F547;
 Fri, 17 Jul 2026 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784291924; x=1815827924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UgvpUNzodqNbsxLYNUkHXVMBprl+cePU2iqrLgAZJPw=;
 b=mhyoA4F4s4KxamcnPbuDY/Xj9r2Qn09r9i8KQf7YpDf6SbtoJCbcEZou
 Y/Q8CxBZedqP0rx0LYDynk9RJEy/C0ST18ARv9lV94knzedhCG3akXEE+
 T47Uvr1dAHqSAeM5xcnCapvaUlHl+AEsoA7RqU/A6DCW5hubdMIo0N2hB
 ef9aOF+nB/sCxVvFvLEh6jz/TyscdRuw1DhBxDKUfrEakxiXvfPQ1d8Ds
 wXLhP7omjLA9MttBSrBQ5PSazSThuDj/oV/RQFnlemGGObWNWV2yoqaMt
 6QDn2a8HBVh2OsUe2G43rShg8zq4u4v/YP+fiugYc8KHy3bIQoAgowaKd A==;
X-CSE-ConnectionGUID: 93BCjkKRTj6rotQwTb6xkQ==
X-CSE-MsgGUID: 19Ls/YbxR6GMhMXHKM9nJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84818233"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84818233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:38:44 -0700
X-CSE-ConnectionGUID: BeratKUSRFqG2CTypBb1Xw==
X-CSE-MsgGUID: hcD7A6oQTbmkV0vHBpAG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="286856894"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:38:43 -0700
Date: Fri, 17 Jul 2026 14:38:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <jason-jh.lin@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fk?=
 =?utf-8?Q?ms=5Fhdr=3A?= Skip unsupported formats in bpc-switch test (rev4)
Message-ID: <20260717123839.kkozfaozdanfjol6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <jason-jh.lin@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
 <178422983609.199043.2967505601516285899@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178422983609.199043.2967505601516285899@6beec6c84f66>
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
On 2026-07-16 at 19:23:56 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_hdr: Skip unsupported formats in bpc-switch test (rev4)
> URL   : https://patchwork.freedesktop.org/series/166923/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9008_full -> IGTPW_15541_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15541_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15541_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15541/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15541_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf_pmu@multi-client:
>     - shard-snb:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9008/shard-snb1/igt@perf_pmu@multi-client.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15541/shard-snb4/igt@perf_pmu@multi-client.html
> 

Unrelated.



Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_9008_full and IGTPW_15541_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.12] s
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.97] s
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.01] s
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a4:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.99] s
> 
>   * igt@kms_rmfb@close-fd@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15541_full that come from known issues:
> 
...cut...
