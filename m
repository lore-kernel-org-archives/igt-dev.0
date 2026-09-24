Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E2C98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 08:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A5B10F38D;
	Thu, 24 Sep 2026 08:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5FPv8GF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA7F10F39A;
 Thu, 24 Sep 2026 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236408; x=1821772408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cSMLOFT51y6wgYVIT7nCcUGUCbhlFDqG/rZy4K3jXtU=;
 b=F5FPv8GFWiT+Q/sZ0fdWyCx4qMhBv/k2DAbWUAGAHfxbAp2QoN+SEWLY
 9n2RJrMU6azmIC7ISCHY0B517JIL+Y+Sts6Ehv6mHXiZTsPL2TnYMYnUs
 w9oj5uSAjjO2C0KfGjRaie6AKJSQ4GOGMZt1AaSP7Ywt58a3w6GLsi+tH
 wHFhbZBzi6gi2mHrHobipPhwhPPRhnary7lTYCLUSza7oxWWckcXNer76
 gwLN+C0xr+2r5dx30SNhHEpj7QeDXsQsd22P8fF6bTl067CyLXf5SyCIz
 4rs5Nu+MCbYsWx/+GB8MJ5WbkxtJjKgURy4whtuN4V9yLvQ3Q+nWI6zQt Q==;
X-CSE-ConnectionGUID: 43I7Ng01QKiKSRW5lCDi9w==
X-CSE-MsgGUID: XgGjDxeDRv+vOqfb9VKpIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101654799"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="101654799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:53:27 -0700
X-CSE-ConnectionGUID: 26lSQFAQSguZBerejJmfEA==
X-CSE-MsgGUID: xKbsmw0VQea0LgJuoymUJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="273447003"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:53:26 -0700
Date: Thu, 24 Sep 2026 09:53:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 lib/igt_profiling: configure Panthor enable state
Message-ID: <20260924075324.jbekyjbzrv2swpnv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260922-b4-gputop_panthor-v1-1-e908705bd062@collabora.com>
 <179019872378.198725.7877499012059031016@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179019872378.198725.7877499012059031016@61270ab9df2a>
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
On 2026-09-23 at 21:25:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_profiling: configure Panthor enable state
> URL   : https://patchwork.freedesktop.org/series/174754/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9109_FULL -> XEIGTPW_15888_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15888_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15888_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15888_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-ptl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15888/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-suspend:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15888/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-ptl:          [PASS][5] -> [INCOMPLETE][6] +3 other tests incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15888/shard-ptl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 

Unrelated,


Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15888_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#7225])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15888/shard-ptl-4/igt@intel_hwmon@hwmon-write.html
> 
...cut...
