Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41B7C88E64
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 10:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AA310E151;
	Mon, 14 Sep 2026 10:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cqez689/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B8610E151;
 Mon, 14 Sep 2026 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789382657; x=1820918657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vXP/8WCwcEMpmIl4xUKXxt8FpvhqZBFyuIruFG4UkWM=;
 b=Cqez689/HzTzU/MVRhviHXIX5DvkNkVDLX+VlS9Qox8DILq7F5u0pyTZ
 DzdoojNtv9RxJrIsCRjdVKaDtcZmGyUXTfG/TS+sBxH35XAeNQrP21zip
 tkLauozWhSy10epM/kRqEVNLpe61BgCuIw41Ir4hUec/vA5i/V3JDJ/Td
 gB3WyROTrIYQGrpA5CSTcRPC7wnIQo1AVRfPsR++1LSXaeTWzQgT67OCq
 aoPfrBZv2jvbqwGNk1g7TIZCCS8IwCji//vQFL8qy4XBLDYPzdz3miSLE
 qPca3eukVhQ/DFBMcfn2auste/0SZzz9smNG13hQGfMoOfYHNHumBivzO g==;
X-CSE-ConnectionGUID: 2p6RFju8QtabItTi1/sj5Q==
X-CSE-MsgGUID: ra3+7sRQQmOQca3W6OYWdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="242238"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="242238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 03:44:17 -0700
X-CSE-ConnectionGUID: VDNawJLuT2+5j0WYx2/eDw==
X-CSE-MsgGUID: SgyjT2MWQpaqVbR+agV4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="272574352"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:44:15 -0700
Date: Mon, 14 Sep 2026 12:43:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing (rev2)
Message-ID: <20260914104359.225zjq4x5zolzycr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
 <178912728699.151079.6545246974106592289@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178912728699.151079.6545246974106592289@61270ab9df2a>
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
On 2026-09-11 at 11:48:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing (rev2)
> URL   : https://patchwork.freedesktop.org/series/173146/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9092_BAT -> XEIGTPW_15832_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15832_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15832_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 15)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15832_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-1:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9092/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
> 

This is unrelated.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15832_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-ptl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9115])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9092/bat-ptl-2/igt@xe_waitfence@reltime.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/bat-ptl-2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9092 -> IGTPW_15832
>   * Linux: xe-5727-b6d5d3322d5aafa2fdfae5731c06336976099913 -> xe-5728-774012d1006e6642542095389ca1a0cabd21ac40
> 
>   IGTPW_15832: 15832
>   IGT_9092: 9092
>   xe-5727-b6d5d3322d5aafa2fdfae5731c06336976099913: b6d5d3322d5aafa2fdfae5731c06336976099913
>   xe-5728-774012d1006e6642542095389ca1a0cabd21ac40: 774012d1006e6642542095389ca1a0cabd21ac40
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/index.html
