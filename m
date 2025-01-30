Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34A3C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 11:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B79C10E93E;
	Thu, 30 Jan 2025 11:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJuQ2z3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132D10E93E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738237634; x=1769773634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oUWtO6tgz5WRlThVcbIsHBFfmhPhRiMaaxB7yL+tsTY=;
 b=lJuQ2z3oI8BrUUWSNlxgoOOUARjeZsx45XaRa3AnmNP5oEFEXQH4rEbq
 YS24NnkExxodrXk85obY4YrQpiNkFXBtM42aLnM2AzPoP7o+YKkej2uNs
 JaVs4bf5QT4vRHBgBRzYEEWBj/9sUY5OO8Ndd8ZfMn7h177GFCM3Pw4QX
 jp2xrwyhzzrViM1uaGGltqObT2qIpRUxGnb3/gjDajRgkNLvIdGIEI87a
 2E0cbGr414eTX2YcLW7GXiAVs6uAY7BcQwnwr6faCCI8WsSBlFnJCzz+u
 2w5MwsvvTHbdzyWZRofsVIA+I59wCtBkHcFE4V+4rMlcPOc/2prhIF0T3 w==;
X-CSE-ConnectionGUID: Bz5gTYOKT+29OJLjwh/ezg==
X-CSE-MsgGUID: y4A6bdHiTg6HkpU5LZhWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38681270"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38681270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 03:47:14 -0800
X-CSE-ConnectionGUID: rGXpThOAR2WoKVbEC41SDQ==
X-CSE-MsgGUID: QyZfWt/6R2uWnkqzM+seng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140188559"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 03:47:13 -0800
Date: Thu, 30 Jan 2025 12:47:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 lib/pciids: sync with kernel (rev2)
Message-ID: <20250130114710.3s7kf4a64gknoxri@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20250129105902.120630-1-kamil.konieczny@linux.intel.com>
 <173818760384.2530294.8960862302018458882@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173818760384.2530294.8960862302018458882@b555e5b46a47>
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
On 2025-01-29 at 21:53:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/pciids: sync with kernel (rev2)
> URL   : https://patchwork.freedesktop.org/series/141981/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8214_full -> XEIGTPW_12512_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12512_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12512_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

these are unrelated to a change, no need for respin.

Regards,
Kamil

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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12512_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-466/igt@xe_module_load@reload-no-display.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12512/shard-dg2-463/igt@xe_module_load@reload-no-display.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12512_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getstats:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2423]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-434/igt@core_getstats.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12512/shard-dg2-433/igt@core_getstats.html
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#3440])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8214/shard-dg2-436/igt@core_getversion@all-cards.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12512/shard-dg2-433/igt@core_getversion@all-cards.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-lnl:          NOTRUN -> [ABORT][7] ([Intel XE#3914])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12512/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html
> 
...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8214 -> IGTPW_12512
>   * Linux: xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 -> xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3
> 
>   IGTPW_12512: 12512
>   IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2568-486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79: 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79
>   xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3: 683350734da38bc7332a3b87c9f2faf6bbeeb5a3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12512/index.html
