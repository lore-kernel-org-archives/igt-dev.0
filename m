Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E24CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 12:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A32510EAD8;
	Tue, 16 Jun 2026 12:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I52yhJO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3D610EAB6;
 Tue, 16 Jun 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613775; x=1813149775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WMqRU/2tHmzQV+3ym8LtQ8MeiSC0zhmnulnD6NHNVw4=;
 b=I52yhJO4GZ9KBUMjjBEbkRzF80f6shWD0l2sOWxCzyQ+ObKJF5uQ/bSM
 6zybQHQ7lxw0Jl0KgTlgw4yRysNfXFw7kbIez5p0TE1/FbaPAMTn0yK//
 pxEmby0dGL2NjQXMfdnyYCosRqzjf10a/x5Wy3fQpzGEphgWCeRAWnmHN
 IKA66AFb2CxS7E4Hgwm9RnvHHvteHNSyLbLfT5JmYdYUm78TgrEM0G9cc
 ucwajW5ojnVzE1d7Kx6sCntqSrHhQgqochxljmZpESRfoT5ZJ103xSu+e
 WLNNv2tLDalTmzd91mNDRAuqnyXVXArx/TVq6WbyDEzn+oZqLO5IbQOm8 Q==;
X-CSE-ConnectionGUID: RsSE9ArOSyyiWC6LKnVgWw==
X-CSE-MsgGUID: 5estn3LfQB68MoQ5KacwrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86015133"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="86015133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:42:54 -0700
X-CSE-ConnectionGUID: faIo8UiySSe0RSFIOsRF7Q==
X-CSE-MsgGUID: mUqk6AQhRz2M7fsBpm1piA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246874784"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 05:42:53 -0700
Date: Tue, 16 Jun 2026 14:42:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 include/linux_scaffold: drop _AC macro
Message-ID: <20260616124228.fvjyudagikwfmcbf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260615174422.212996-1-kamil.konieczny@linux.intel.com>
 <178159494702.82746.10759478922744882149@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178159494702.82746.10759478922744882149@6beec6c84f66>
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
On 2026-06-16 at 07:29:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: include/linux_scaffold: drop _AC macro
> URL   : https://patchwork.freedesktop.org/series/168536/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8964_full -> IGTPW_15370_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15370_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15370_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15370/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15370_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-dg1:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8964/shard-dg1-13/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15370/shard-dg1-14/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a1:
>     - shard-dg1:          NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15370/shard-dg1-14/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@c-hdmi-a1.html
> 

Unrelated.

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15370_full that come from known issues:
> 
...cut...
