Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACBAC88E65
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 10:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C0E10ED3F;
	Mon, 14 Sep 2026 10:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYS5hhmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B5410ED3B;
 Mon, 14 Sep 2026 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789382999; x=1820918999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tXSIuzmrImki85vgbKdCtIffY3ycK+m8TxKfKWSmE90=;
 b=dYS5hhmnKb3Jw8Pq1v+XFz3pzzcLhf0L0vi7YjRmJQjzKnoTjJPNjQX/
 N+9cilDV+kgkbR1kVw6wO7k8HhgMQI6EtVQCHTo+Ve8nCFsd6Gw+9QNnZ
 2P7UGKh1dqEXaUbOIBifRE3L0+dS7mP8QtBaUfMXbQAXELWe9eNBU0AM6
 mErB9eYQRdt2BAIfdYYxbR/9dgNm+tyunE3MH9WQgGgHqgaryYrRJZgrh
 8/QWMBYG0K0zr7oXKt8nq+Psa+G92p2+XBs/v6epRWDaJZ/wA2iwK0wp7
 YpPn5nNAb+UEbkMp5cu10Nw/6qPcqxoV2esPiHsp5VGCuL1hia9N/Q14t A==;
X-CSE-ConnectionGUID: qiqL/4dESwqE1+ZEa3Ycdg==
X-CSE-MsgGUID: wtH4/U+iRfiPgfKa82m4Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89759254"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="89759254"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 03:49:59 -0700
X-CSE-ConnectionGUID: 2tc6YN86Q9ONvEvAHr7ZOg==
X-CSE-MsgGUID: eltwWnQBQCmvNWuiWSrWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="270804338"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:49:58 -0700
Date: Mon, 14 Sep 2026 12:49:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible
Message-ID: <20260914104955.pi3zn3xarzommnm6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260909133320.71100-1-kamil.konieczny@linux.intel.com>
 <178917845556.154179.2246411853323177161@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178917845556.154179.2246411853323177161@61270ab9df2a>
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
On 2026-09-12 at 02:00:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19114_full -> IGTPW_15815_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15815_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15815_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   Additional (1): shard-tglu-1 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15815_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19114/shard-mtlp-6/igt@gem_pxp@display-protected-crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/shard-mtlp-7/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-mtlp:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19114/shard-mtlp-4/igt@i915_module_load@reload-no-display.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/shard-mtlp-7/igt@i915_module_load@reload-no-display.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-rkl:          NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/shard-rkl-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 

Unrelated.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15815_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#6230])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/shard-rkl-7/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#6230])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15815/shard-dg1-18/igt@api_intel_bb@crc32.html
> 
...cut...
