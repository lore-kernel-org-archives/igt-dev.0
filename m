Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B399C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 11:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14FE10E802;
	Thu, 17 Jul 2025 11:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERNYN4l2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5E610E080;
 Thu, 17 Jul 2025 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752753578; x=1784289578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1dXFc1EkJNH/FGYeAIN2GV0bz1/BxcRg8QBo8jJ6Wc4=;
 b=ERNYN4l20Cr2m42vAHoxz5NkxjlH6WQ+FWdMqPrD66KOxeV7U8a9fGcD
 O8VySmTbyDV2cuQGYs7aMPZFoAGMv/6GI6JdXkF3o1qkd3U43X89Qct8J
 2MTjfSqSnqvjX104FqFjq9BwFQc4eWXa4Fqw4E8v/vFdx1ZTUY32G4Hob
 wOqhGdpjqQmxJt2PKQDdzXkKN5hG4JdmxJgGRQJ8NyXqnKrat3wPr0Oug
 9+LuZZfbqaq0TaWkzE6NWaw4euPjy0fX8H2vVZYfcLR5WQPreQbyRAsaD
 nZ80i5SXWw8ritAbquo2uwPTYBKt5VJXtEBsCI3pASopJiF0PK81ZFTIU Q==;
X-CSE-ConnectionGUID: +cL4wHDRRmefznWs0Bi9Vw==
X-CSE-MsgGUID: xsPFCOgpRHS/lSG23ghoAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54132994"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54132994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 04:59:37 -0700
X-CSE-ConnectionGUID: jrQ95tfARmqw53ALWmlihw==
X-CSE-MsgGUID: eCTfN6crTFO9Bunfik07GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="163302939"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 04:59:37 -0700
Date: Thu, 17 Jul 2025 13:59:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Runner: report test command line
Message-ID: <20250717115934.fkgjifjdsyzujxxo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
 <175275215375.169253.10147817707936822753@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175275215375.169253.10147817707936822753@1538d3639d33>
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
On 2025-07-17 at 11:35:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: report test command line
> URL   : https://patchwork.freedesktop.org/series/151715/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8462_full -> IGTPW_13485_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13485_full absolutely need to be
>   verified manually.

Unrelated to change in runner.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13485_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13485/index.html
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): shard-glk10 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13485_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_gttfill@engines@ccs0:
>     - shard-dg2-9:        NOTRUN -> [DMESG-FAIL][1] +2 other tests dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13485/shard-dg2-9/igt@gem_exec_gttfill@engines@ccs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13485_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13485/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html
> 

...cut...

