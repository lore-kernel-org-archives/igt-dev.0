Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B867FC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 11:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D26E112A0E;
	Mon, 22 Apr 2024 11:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIsnscvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A077112A0E;
 Mon, 22 Apr 2024 11:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713785729; x=1745321729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B14LXWL1yDXXWGKqsPDlmePExS9AfuJ+9JQVrmVWjlc=;
 b=oIsnscvNZBuQlGudrPYJ/qB6AbWoVTDSStROg5bLDXPfUwOj62bSIoLV
 KaVnq0lzVGbTWRHZMNLoNfpAKvFrVJMvL+r5B4HQCZupYWIzmzur/nXCk
 79p1DmDwmhR76pEIr3IJDsupA0XKpBwYdMdBG/QjAswrNjhMbYTcNv3Tg
 nVmmb6NB3JsIwpuIIRcJypAgPoUH4/JOVrfgGJwnP8dOgwLoxYSpFOotm
 Zbb5Yp/upbmbNZuQq70ziCIroOCcps86TZmDqocG+J85JGMtyBXo4RQJU
 HGdrJjSQvkKUMhVqEkq08F157th8zGeCXhzxQPGgyfBO2RWZbX6d0nP+3 Q==;
X-CSE-ConnectionGUID: +LqUbZQqQ7WspDk4Ues0tg==
X-CSE-MsgGUID: 6n/5Nlz5SBeKk0RZ5p4QyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="34715926"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="34715926"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 04:35:29 -0700
X-CSE-ConnectionGUID: Qczwti5zQcG42Ri0OyOfew==
X-CSE-MsgGUID: XS1rk2oqSRWNuldW+YITqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24027175"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 04:35:28 -0700
Date: Mon, 22 Apr 2024 13:35:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fexec=5Fcapture?= =?utf-8?Q?=3A?= fix use of
 igt_allow_hang() / igt_disallow_hang() (rev2)
Message-ID: <20240422113509.xsjepiwnul3zh5d4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240411191934.10368-1-me@petersenna.com>
 <171357818004.1536675.6162668437809712972@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171357818004.1536675.6162668437809712972@8e613ede5ea5>
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
On 2024-04-20 at 01:56:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_capture: fix use of igt_allow_hang() / igt_disallow_hang() (rev2)
> URL   : https://patchwork.freedesktop.org/series/132330/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14616_full -> IGTPW_11045_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11045_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11045_full, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11045/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11045_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14616/shard-mtlp-5/igt@i915_suspend@basic-s2idle-without-i915.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11045/shard-mtlp-1/igt@i915_suspend@basic-s2idle-without-i915.html
> 

This is unrelated to gem_exec_capture,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11045_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7814 -> IGTPW_11045
> 
>   CI-20190529: 20190529
>   CI_DRM_14616: 53dd7a2909139fb469db4423b79d8a2888a734c2 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11045: 39d6c504f49565054cc3ead0e7147105c67db1f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7814: 7814
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11045/index.html
