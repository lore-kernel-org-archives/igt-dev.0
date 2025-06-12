Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0AEC71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 13:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5175F10E270;
	Thu, 12 Jun 2025 13:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hO9OLisw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEFF10E270;
 Thu, 12 Jun 2025 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749735496; x=1781271496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+RcskmhxN6o4/gAItnfKrEKadf0wQTnbnNLTmim3rc4=;
 b=hO9OLiswUg7iU4PPGO8Q0jNQRC1i352m+Lu6xkxonnYMzOa32y6e4/vL
 iEeZd9iw1dIhKU0Hks5qcPvyVZhtJ3cAYwUAL0twKTZwhEws477w1knnX
 w9yKbrLFmefFu47NvCgLkXURvG1RPvEZTIFn1gsipd9dqmRR2UqYiA35m
 /6TDuSqj3/mA82tm/7fvHEfTx4iWN8xKthqF+6/sVFS8JZ8JyREwGNcn+
 bIGPiG+VTs+x8Gev+Kk/KDRi27XsM5U2srwYPEGmLkIgqvf5pVbYSMV+M
 tx+jAyjMKXiVm75gnUsQuR1dFgDGQaI/mlGLwFTaYT1W1YGHHuYjWg7pl A==;
X-CSE-ConnectionGUID: heleiJUHTVuqKeLB9aARYw==
X-CSE-MsgGUID: WsSr8HoRQhyokqPgXBYUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51903011"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51903011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:38:15 -0700
X-CSE-ConnectionGUID: O78OlnPMRmGhZApe5R+5IA==
X-CSE-MsgGUID: cooLQGR8RAqBVHQy5nJD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152675018"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:38:13 -0700
Date: Thu, 12 Jun 2025 15:38:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/amdgpu: Fix compilation warnings for USERQ (rev3)
Message-ID: <20250612133811.muo5cl7e55qr3chs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
 <174972724953.71058.9970391398109822846@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174972724953.71058.9970391398109822846@1538d3639d33>
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
On 2025-06-12 at 11:20:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu: Fix compilation warnings for USERQ (rev3)
> URL   : https://patchwork.freedesktop.org/series/150105/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8405_FULL -> XEIGTPW_13278_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13278_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13278_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13278_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8405/shard-dg2-435/igt@kms_hdr@static-toggle.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13278/shard-dg2-434/igt@kms_hdr@static-toggle.html
> 

Unrelated to change in amdgpu.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13278_FULL that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8405 -> IGTPW_13278
>   * Linux: xe-3230-a08a2132ed7ae776652df710008606631989bc60 -> xe-3233-6989c5689c982c207b57b8634d117f6dfdd5e698
> 
>   IGTPW_13278: 2894da8046e1bec113ef83f0e170df4172ac194e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8405: 8405
>   xe-3230-a08a2132ed7ae776652df710008606631989bc60: a08a2132ed7ae776652df710008606631989bc60
>   xe-3233-6989c5689c982c207b57b8634d117f6dfdd5e698: 6989c5689c982c207b57b8634d117f6dfdd5e698
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13278/index.html
